import logging, os.path, re
import lxml.etree as ET
from unittest import TestCase

from assertNoDiff import assertNoDiff
from validate import CliParser, Validator

__author__ = 'r2h2'

class TestValidator(TestCase):

    def test_xslt_service(self):
        logging.info('  -- Test basic lxml/xslt functionality with simple copy template')
        PROJ_DIR = os.path.dirname(os.path.dirname(__file__))
        logging.debug('PROJ_DIR: ' + PROJ_DIR)

        df_in = os.path.join(PROJ_DIR, 'testdata/test00.xml')
        df_out = os.path.join(PROJ_DIR, 'work/test00.xml')
        sf = os.path.join(PROJ_DIR, 'testdata/copy_all.xsl')
        md_dom  = ET.parse(df_in)
        xslt = ET.fromstring(open(sf).read())
        transform = ET.XSLT(xslt)
        out_dom = transform(md_dom)
        out_bytes = ET.tostring(out_dom, xml_declaration=False, encoding='utf-8')
        with open(df_out, 'w') as fd:
            fd.write(out_bytes.decode('utf-8'))
        assertNoDiff(df_out)



    def test_validate(self):
        logging.info('  -- Test validate')
        PROJ_DIR = os.path.dirname(os.path.dirname(__file__))
        logging.debug('PROJ_DIR: ' + PROJ_DIR)
        cliParser = CliParser(['-v', PROJ_DIR + '/testdata/idp5_incomplete.xml', 'rule04E'])
        validator = Validator(cliParser)
        fname = os.path.join(PROJ_DIR, 'work/rule04E_1.err')
        with open(fname, 'w') as fd:
            fd.write(validator.validate())
        assertNoDiff(fname)
