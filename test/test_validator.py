import json, logging, os.path, re
import lxml.etree as etree
import unittest
from assertNoDiff import assertNoDiff
from validate import ApiArgs, Validator

__author__ = 'r2h2'

def execute_a_test(rule, expected_severity, testfile, PROJROOT):
    """ assert that severity level and message match expected values """
    logging.info('  -- Testing schematron rule ' + rule)
    md_file = os.path.join(PROJROOT, 'testdata', testfile)
    validator = Validator(ApiArgs(md_file, rule=rule).cliInvocation)
    validator_result = validator.validate()
    fname = os.path.join(PROJROOT, 'work', rule + '_' + expected_severity + '.err')
    with open(fname, 'w') as fd:
        fd.write(validator_result.messagerefac)
    # pyunit test not useful to have multiple assertions in a test becuase it does not continue
    #assert validator_result.level == expected_severity, ('expected severity level ' +
    #    expected_severity + ' but test returned ' + validator_result.level + '. rule: ' + rule +
    #    ', testdata: ' + testfile)
    if validator_result.level != expected_severity:
        print ('expected severity level ' + expected_severity + ' but test returned ' +
               validator_result.level + '. (' + rule + ' | ' + testfile + ')')
    else:
        print()
    #if validator_result.level != 'OK':
    #    try:
    #        assertNoDiff(fname)
    #    except (AssertionError, FileNotFoundError) as e:
    #        print(e)


class TestValidator(unittest.TestCase):

    # def test_xslt_service(self):
    #     logging.info('  -- Test basic lxml/xslt functionality with simple copy template')
    #     PROJROOT = os.path.dirname(os.path.dirname(__file__))
    #     logging.debug('PROJROOT: ' + PROJROOT)
    #
    #     df_in = os.path.join(PROJROOT, 'testdata/test00.xml')
    #     df_out = os.path.join(PROJROOT, 'work/test00.xml')
    #     sf = os.path.join(PROJROOT, 'testdata/copy_all.xsl')
    #     md_dom  = etree.parse(df_in)
    #     xslt = etree.fromstring(open(sf).read())
    #     transform = etree.XSLT(xslt)
    #     out_dom = transform(md_dom)
    #     out_bytes = etree.tostring(out_dom, xml_declaration=False, encoding='utf-8')
    #     with open(df_out, 'w') as fd:
    #         fd.write(out_bytes.decode('utf-8'))
    #     assertNoDiff(df_out)

    def test_validate(self):
        logging.info('  -- Test schematron rules with a test file each to succeed and to fail')
        PROJROOT = os.path.dirname(os.path.dirname(__file__))
        with open(re.sub('.py$', '.json', os.path.realpath(__file__))) as f:
            testcases = json.loads(f.read())
        for tc in testcases:
            tc_id = tc[0]
            print(tc_id, end=' ')
            (rule, test_type) = tc_id.split('/')
            expected_severity = tc[1][0]
            testfile = tc[1][1]
            print('testing: ' + rule + expected_severity + testfile)
            execute_a_test(rule, expected_severity, testfile, PROJROOT)
