import argparse
import logging, os, re, sys
import lxml.etree as etree
from lxml.isoschematron import Schematron
#import simplejson as json
import json

class ApiArgs():
    """ Structure to pass arguments to validator for API calls """
    def __init__(self, md_xml, rule=None, profile=None):
        cli = [md_xml, ]
        if profile is not None:
            cli = ['--profile', profile] + cli
        if rule is not None:
            cli = ['--rule', rule] + cli
        self.cliInvocation = CliInvocation(cli)


class CliInvocation():
    """ define CLI invocation for validate.  Test runner can use this by passing testargs """
    def __init__(self, testargs=None):
        self.parser = argparse.ArgumentParser(description='SAML metadata validation')
        self.parser.add_argument('-v', '--verbose', dest='verbose', action="store_true")
        self.parser.add_argument('-R', '--ruledir', dest='ruledir',
            help='path for (expanded) schematron rule file(s). Default: "rules/schtron_exp"')
        self.parser.add_argument('-p', '--profile', dest='profile',
            help='JSON file containing a list of rules for a SAML profile (relative path to cwd')
        self.parser.add_argument('-r', '--rule', dest='rule',
            help='rule name (schematron rule file name, without extension')
        self.parser.add_argument('metadatafile', help='metadata file name')

        if (testargs):
            self.args = self.parser.parse_args(testargs)  # for unit test
        else:
            self.args = self.parser.parse_args()  # regular case: use sys.argv
        if self.args.profile is None and self.args.rule is None:
            self.parser.error('Missing argument: must specify either -profile or -rule')
        if self.args.profile is not None and self.args.rule is not None:
            self.parser.error('Mutually exclusive arguments: cannot specify both -profile and -rule')
        if not os.access(self.args.metadatafile, os.R_OK):
            self.parser.error('Metadata file not found or not readable:' + self.args.metadatafile)
        if self.args.profile is not None and not os.access(self.args.profile, os.R_OK):
            self.parser.error('Profile file not found or not readable:' + self.args.profile)


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
        if getattr(invocation.args, 'ruledir', None):
            self.schtrondir = invocation.args.ruledir
        else:
            self.schtrondir = os.path.join(self.projdir, 'rules', 'schtron_exp')
        if invocation.args.rule is not None:
            self.rules = [invocation.args.rule]
        else:
            with open(invocation.args.profile) as fd:
                self.rules = json.load(fd)
            assert isinstance(self.rules, (list, tuple))


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
            schtron_dom = etree.parse(os.path.join(self.schtrondir, rule + '_exp.sch'))
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


def run_me(testrunnerInvocation=None):
    if testrunnerInvocation:
        # CLI args and logger set by unit test
        invocation = testrunnerInvocation
    else:
        invocation = CliInvocation()
    validator = Validator(invocation)
    return validator.validate()


if __name__ == '__main__':
    if sys.version_info < (3, 4):
        raise "must use python 3.4 or higher"
    val_result = run_me()
    print('max. severity: ' + val_result.level)
    print(val_result.message)
