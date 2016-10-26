import json, logging, os.path, re
import logging.config
import loggingconfig
import lxml.etree as etree
import unittest
from saml_schtron.validator import ApiArgs, Validator
from assertNoDiff import assertNoDiff

__author__ = 'r2h2'

# Logging setup for unit tests
logbasename = re.sub(r'\.py$', '', os.path.basename(__file__))
logging_config = loggingconfig.LoggingConfig(logbasename)
logging.info('DEBUG log: ' + logging_config.LOGFILENAME)
here = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
version = open(os.path.join(here, 'VERSION')).read()
projname = open(os.path.join(here, 'PROJNAME')).read()
logging.info(projname + ' V' + version)


def execute_a_test(rule, expected_severity, testfile, PROJROOT):
    """ assert that severity level matches the expected value """
    logging.info('  -- Testing schematron rule ' + rule)
    md_file = os.path.join(PROJROOT, 'testdata', testfile)
    validator = Validator(ApiArgs(md_xml=md_file, rule=rule).cliInvocation)
    validator_result = validator.validate()

    # pyunit test not useful to have multiple assertions in a test because it does not continue
    # all unittests in a loop run as a single pyunit test

    #assert validator_result.level == expected_severity, ('expected severity level ' +
    #    expected_severity + ' but test returned ' + validator_result.level + '. rule: ' + rule +
    #    ', testdata: ' + testfile)
    if validator_result.level != expected_severity:
        print (rule + ' expected severity level ' + expected_severity + ' but test returned ' +
               validator_result.level + '. (' + rule + ' | ' + testfile + ')')


class TestValidator(unittest.TestCase):

    def test_validate_single_rule(self):
        """ -- Test a single schematron rule """
        # this one helps to debug a specific rule; otherwise it is covered by test_validate_rules()
        logging.info(TestValidator.test_validate_single_rule.__doc__)
        print(TestValidator.test_validate_single_rule.__doc__)
        PROJROOT = os.path.dirname(os.path.dirname(__file__))
        rule = "rule60E"
        testfile = "idp_incomplete.xml"
        expected_severity = "ERROR"
        execute_a_test(rule, expected_severity, testfile, PROJROOT)


    def test_validate_rules(self):
        """ -- Test schematron rules with different input files """
        logging.info(TestValidator.test_validate_rules.__doc__)
        print(TestValidator.test_validate_rules.__doc__)
        PROJROOT = os.path.dirname(os.path.dirname(__file__))
        with open(re.sub('.py$', '.json', os.path.realpath(__file__))) as f:
            try:
                testcases = json.loads(f.read())
            except Exception:
                print("error when loading " + f.name)
                raise
        for tc in testcases:
            rule = tc[0]
            expected_severity = tc[1][0]
            testfile = tc[1][1]
            execute_a_test(rule, expected_severity, testfile, PROJROOT)


    def test_validate_saml2int(self):
        """ -- Test API with profile saml2int against idp_incomplete.xml """
        logging.info(TestValidator.test_validate_saml2int.__doc__)
        print(TestValidator.test_validate_saml2int.__doc__)
        PROJROOT = os.path.dirname(os.path.dirname(__file__))
        logging.info('PROJROOT=' + PROJROOT)
        md_fname = os.path.join(PROJROOT, 'testdata', 'idp_incomplete.xml')
        #profile_fname = os.path.join(PROJROOT, 'rules', 'profiles', 'saml2int.json')
        import pkgdata
        profile_fname =  pkgdata.get_path('rules', os.path.join('profiles', 'saml2int.json'))
        validator = Validator(ApiArgs(md_xml=md_fname, profile=profile_fname).cliInvocation)
        val_result = validator.validate()

        workdir = os.path.join(PROJROOT, 'work')
        if not os.path.exists(workdir):
            os.makedirs(workdir)
        fname = os.path.join(workdir, 'saml2int.json')
        with open(fname, 'w') as fd:
            fd.write(val_result.get_json())
        try:
            assertNoDiff(fname)
        except (AssertionError, FileNotFoundError) as e:
            print(e)


    def test_list_profiles(self):
        """ -- List profiles """
        logging.info(TestValidator.test_list_profiles.__doc__)
        print(TestValidator.test_list_profiles.__doc__)
        # print('Profile Key | Profile Display Name')
        for (profile, display_name) in Validator.get_profiles().items():
            # print(profile + ' | ' + display_name)
            pass


if __name__ == '__main__':
    unittest.main(warnings='ignore')
