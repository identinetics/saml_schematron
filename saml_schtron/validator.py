import argparse
import logging, os, re, sys
import lxml.etree as etree
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
            help='path for xslt rule file(s) (converted from schematron). Default: "rules/schtron_xsl"')
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
            self.args.ruledir = os.path.join('rules', 'schtron_xsl')
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
    level (str): Severity level (extracted from svrl message text): OK/INFO/WARNING/ERROR
    messages (list): svrl message(s)
    summary (dict): message count per severity level

    'OK' in the context of a severity level means that a rule was executed but no message reported

    """
    def __init__(self):
        self.code = True
        self.level='OK'
        self.messages = []
        self.summary = {'OK': 0, 'INFO': 0, 'WARNING': 0, 'ERROR': 0}

    def get_json(self):
        m = self.messages
        m.append({"Summary": self.summary})
        return json.dumps(m, sort_keys=True, indent=4)


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

    @staticmethod
    def get_profiles() -> dict:
        """ return a dict of key : displayname pairs for each profile """
        profiles = {}
        projdir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
        profiledir = os.path.join(projdir, 'rules', 'profiles')
        for fname in os.listdir(path=profiledir):
            if fname[-5:] != '.json':
                continue
            if fname == 'allrules.json':
                continue
            with open(os.path.join(profiledir, fname)) as fd:
                profile = json.load(fd)
            if 'profile' in profile:
                profiles[fname[:-5]] = profile['profile']   # filename minus ext : display name
        return profiles

    def validate_schtron(self) -> ValidatorResult:
        val_result = ValidatorResult()
        md_dom = etree.parse(self.metadatafile)
        eds = md_dom.findall('{urn:oasis:names:tc:SAML:2.0:metadata}EntityDescriptor')
        if len(eds) > 1:
            val_result.level = 'ERROR'
            val_result.message = 'Cannot validate files with multiple entities'
            return val_result
        if self.verbose: print('entityID: ' + eds[0].attrib['entityID'])
        for rule in self.rules:
            with open(os.path.join(self.projdir, self.ruledir, rule + '.xsl')) as fd:
                transform = etree.XSLT(etree.XML(''.join(fd.readlines())))
            transform(md_dom)
            result_jsonsnippet = str(transform.error_log).replace('<string>:0:0:ERROR:XSLT:ERR_OK:', '')
            try:
                result_dict = json.loads('{' + result_jsonsnippet + '}')
            except ValueError as e:
                print('ValueError: Decoding JSON string from ' + rule + ':\n{' + result_jsonsnippet + '}')
                raise
            if rule not in result_dict:
                val_result.summary['OK'] += 1
            else:
                val_result.code = False
                val_result.messages.append(result_dict)
                last_level = ''
                if result_dict[rule]['Severity'] == 'Info':
                    val_result.summary['INFO'] += 1
                elif result_dict[rule]['Severity'] == 'Warning':
                    val_result.summary['WARNING'] += 1
                elif result_dict[rule]['Severity'] == 'Error':
                    val_result.summary['ERROR'] += 1
                else:
                    print('could not get severity level from ', result_jsonsnippet)
                    val_result.summary['CRITICAL'] += 1

        for l in ('OK', 'INFO', 'WARNING', 'ERROR'):  # return highest severity
            if val_result.summary[l] > 0:
                val_result.level = l
#        if val_result.level != 'OK':
#            val_result.json += ',\n"Summary": {"OK": %d, "INFO": %d, "WARNING": %d, "ERROR": %d}' % \
#                               (val_result.summary['OK'], val_result.summary['INFO'],
#                                val_result.summary['WARNING'], val_result.summary['ERROR'])
#            val_result.json += '\n}'
        return val_result

    def validate(self) -> ValidatorResult:
        return self.validate_schtron()
