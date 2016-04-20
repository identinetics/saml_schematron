import argparse
import logging, os, re, sys
import lxml.etree as etree
from lxml.isoschematron import Schematron
import json

class ApiArgs():
    """ Structure to pass arguments to validator for API calls """
    def __init__(self, md_xml='dummy', rule=None, profile=None, listprofiles=False):
        cli = [md_xml, ]
        if profile is not None:
            cli = ['--profile', profile] + cli
        if rule is not None:
            cli = ['--rule', rule] + cli
        if listprofiles:
            cli = ['--listprofiles'] + cli
        self.cliInvocation = CliInvocation(cli)


class CliInvocation():
    """ define CLI invocation for validate.  Test runner can use this by passing testargs """
    def __init__(self, testargs=None):
        projdir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
        self.parser = argparse.ArgumentParser(description='SAML metadata validation')
        self.parser.add_argument('-v', '--verbose', dest='verbose', action="store_true")
        self.parser.add_argument('-R', '--ruledir', dest='ruledir',
            help='path for (expanded) schematron rule file(s). Default: "rules/schtron_exp"')
        self.parser.add_argument('-p', '--profile', dest='profile',
            help='JSON file containing a list of rules for a SAML profile (basename only, no dir')
        self.parser.add_argument('-r', '--rule', dest='rule',
            help='rule name (schematron rule file name, without extension')
        self.parser.add_argument('-l', '--listprofiles', dest='proflist', action="store_true",
            help='list available profiles (and ignore check of metadatafile - provide a dummy name)')
        self.parser.add_argument('metadatafile', help='metadata file name')

        if (testargs):
            self.args = self.parser.parse_args(testargs)  # for unit test
        else:
            self.args = self.parser.parse_args()  # regular case: use sys.argv
        if self.args.ruledir is None:
            self.args.ruledir = os.path.join('rules', 'schtron_exp')
        if not self.args.proflist:
            if self.args.profile is None and self.args.rule is None:
                self.parser.error('Missing argument: must specify either -profile or -rule')
            if self.args.profile is not None and self.args.rule is not None:
                self.parser.error('Mutually exclusive arguments: cannot specify both -profile and -rule')
            if not os.access(self.args.metadatafile, os.R_OK):
                self.parser.error('Metadata file not found or not readable:' + self.args.metadatafile)
            if self.args.profile is not None:
                if not self.args.profile.endswith('.json'):
                    self.args.profile += '.json'
                profile_abspath = os.path.join(projdir, 'rules', 'profiles', self.args.profile)
                if not os.access(profile_abspath, os.R_OK):
                    self.parser.error('Profile file not found or not readable:' + profile_abspath)
                else:
                    self.args.profile_abspath = profile_abspath


class ValidatorResult:
    """ Attributes:
    result (bool): False if an assertion failed, True otherwise
    level (str): Severity level (extracted from svrl message text): INFO/WARNING/ERROR
    message (str): svrl message text
    """
    def __init__(self):
        pass


class Validator:
    """
    Validate SAML Metadata according to a specified set of Schematron rules
    """
    def __init__(self, invocation):
        self.metadatafile = invocation.args.metadatafile
        self.verbose = invocation.args.verbose
        self.projdir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
        if self.verbose:
            print('self.projdir = ' + self.projdir)
            print('metadatafile = ' + self.metadatafile)
            print('rules: ' + ', '.join(invocation.args.rule))
        self.ruledir = invocation.args.ruledir
        if invocation.args.rule is not None:
            self.rules = [invocation.args.rule]
        elif invocation.args.profile is not None:
            with open(invocation.args.profile_abspath) as fd:
                profile = json.load(fd)
                self.rules = profile['rules']
                if invocation.args.verbose: print(profile['profile'])
            assert isinstance(self.rules, (list, tuple))

    def get_profiles(self) -> list:
        profiles = []
        profiledir = os.path.join(self.projdir, 'rules', 'profiles')
        for fname in os.listdir(path=profiledir):
            if fname[-5:] != '.json':
                continue
            if fname == 'allrules.json':
                continue
            with open(os.path.join(profiledir, fname)) as fd:
                profile = json.load(fd)
            if 'profile' in profile:
                profiles.append({'file': fname, 'name': profile['profile']})
        return profiles

    def validate(self) -> ValidatorResult:
        validator_result = ValidatorResult()
        md_dom = etree.parse(self.metadatafile)
        eds = md_dom.findall('{urn:oasis:names:tc:SAML:2.0:metadata}EntityDescriptor')
        if len(eds) > 1:
            validator_result.level = 'ERROR'
            validator_result.message = 'Cannot validate files with multiple entities'
            return validator_result
        if self.verbose: print('entityID: ' + eds[0].attrib['entityID'])
        validator_result.code = True
        validator_result.message = ''
        tracker = {'OK': 0, 'INFO': 0, 'WARNING': 0, 'ERROR': 0}
        for rule in self.rules:
            schtron_dom = etree.parse(os.path.join(self.projdir, self.ruledir, rule + '_exp.sch'))
            schtron_val = Schematron(schtron_dom, error_finder=Schematron.ASSERTS_AND_REPORTS)
            if schtron_val.validate(md_dom):
                tracker['OK'] += 1
            else:
                validator_result.code = False
                m_dom = etree.XML(schtron_val.error_log.last_error.message)
                last_msg = m_dom.find('{http://purl.oclc.org/dsdl/svrl}text').text.lstrip()
                validator_result.message += last_msg + '\n'
                last_level = ''
                if re.match('Info', last_msg):
                    last_level = 'INFO'
                elif re.match('Warning', last_msg):
                    last_level = 'WARNING'
                elif re.match('Error', last_msg):
                    last_level = 'ERROR'
                else:
                    print('could not get severity level:\n', last_msg)
                    last_level = 'ERROR'
                tracker[last_level] += 1

        for l in ('OK', 'INFO', 'WARNING', 'ERROR'):  # return highest severity
            if tracker[l] > 0:
                validator_result.level = l
        if validator_result.level != 'OK':
            validator_result.message += \
                'INFO: ' + str(tracker['INFO']) + ', ' + \
                'WARNING: ' + str(tracker['WARNING']) + ', ' + \
                'ERROR: ' + str(tracker['ERROR'])
        return validator_result
