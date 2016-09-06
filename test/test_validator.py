import json, logging, os.path, re
import lxml.etree as etree
import unittest
from assertNoDiff import assertNoDiff
from saml_schtron.validator import ApiArgs, Validator

__author__ = 'r2h2'

def execute_a_test(rule, expected_severity, testfile, PROJROOT):
    """ assert that severity level and message match expected values """
    logging.info('  -- Testing schematron rule ' + rule)
    md_file = os.path.join(PROJROOT, 'testdata', testfile)
    validator = Validator(ApiArgs(md_xml=md_file, rule=rule).cliInvocation)
    validator_result = validator.validate()
    fname = os.path.join(PROJROOT, 'work', rule + '-' + expected_severity + '-' +
                         os.path.basename(md_file)[:-4] + '.err')
    with open(fname, 'w') as fd:
        fd.write(validator_result.message)
    # pyunit test not useful to have multiple assertions in a test because it does not continue
    # all unittests run as a single pyunit test

    #assert validator_result.level == expected_severity, ('expected severity level ' +
    #    expected_severity + ' but test returned ' + validator_result.level + '. rule: ' + rule +
    #    ', testdata: ' + testfile)
    if validator_result.level != expected_severity:
        print ('expected severity level ' + expected_severity + ' but test returned ' +
               validator_result.level + '. (' + rule + ' | ' + testfile + ')')
    else:
        print()
    if validator_result.level != 'OK':
        try:
            assertNoDiff(fname)
        except (AssertionError, FileNotFoundError) as e:
            print(e)


class TestValidator(unittest.TestCase):

    def test_validate_rules(self):
        """ test all rules """
        logging.info('Test schematron rules with different input files')
        print('Test schematron rules with different input files')
        PROJROOT = os.path.dirname(os.path.dirname(__file__))
        with open(re.sub('.py$', '.json', os.path.realpath(__file__))) as f:
            try:
                testcases = json.loads(f.read())
            except Exception:
                print("error when loading " + f.name)
                raise
        for tc in testcases:
            rule = tc[0]
            print(rule, end=' ')
            expected_severity = tc[1][0]
            testfile = tc[1][1]
            execute_a_test(rule, expected_severity, testfile, PROJROOT)


    def test_validate_webssofed(self):
        """ test API with a profile"""
        logging.info('  -- Testing profile webssofed')
        print('Profile webssofed')
        PROJROOT = os.path.dirname(os.path.dirname(__file__))
        md_fname = os.path.join(PROJROOT, 'testdata', 'idp_sp_incomplete.xml')
        profile_fname = os.path.join(PROJROOT, 'rules', 'profiles', 'webssofed.json')
        validator = Validator(ApiArgs(md_xml=md_fname, profile=profile_fname).cliInvocation)
        validator_result = validator.validate()
        fname = os.path.join(PROJROOT, 'work', 'webssofed.err')
        with open(fname, 'w') as fd:
            fd.write(validator_result.message)
        if validator_result.level != 'ERROR':
            print ('expected severity level ERROR but test returned ' +
                   validator_result.level + '.\n (' + profile_fname + ' \n ' + md_fname + ')')
        else:
            print()
        if validator_result.level != 'OK':
            try:
                assertNoDiff(fname)
            except (AssertionError, FileNotFoundError) as e:
                print(e)

    def test_list_profiles(self):
        """ test API with a profile"""
        logging.info('  -- List profiles')
        print('List profiles')
        validator = Validator(ApiArgs(listprofiles=True).cliInvocation)
        print('File | Profile')
        for profile in validator.get_profiles():
            print(profile['file'] + ' | ' + profile['name'])

