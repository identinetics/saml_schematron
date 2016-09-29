import logging
import logging.config
import loggingconfig
import os
import re
import sys
import unittest

__author__ = 'r2h2'

def setUpModule():
    try:
        os.environ['PYJNIUS_ACTIVATE']
        from jnius import autoclass
    except KeyError:
        import javabridge
        try:
            # include user added classpath
            classpath = os.environ['CLASSPATH']
            classpath = classpath.split(os.pathsep)
            javabridge.JARS.extend(classpath)
        except KeyError:
            None

        javabridge.start_vm()
        javabridge.attach()


def tearDownModule():
    try:
        os.environ['PYJNIUS_ACTIVATE']
    except KeyError:
        import javabridge
        javabridge.detach()
        javabridge.kill_vm()

# Logging setup for unit tests
logbasename = re.sub(r'\.py$', '', os.path.basename(__file__))
logging_config = loggingconfig.LoggingConfig(logbasename)
logging.info('DEBUG log: ' + logging_config.LOGFILENAME)


def make_dirs(path, dir=False) -> str:
    """ create directories in the path that do not exist (if path is directory, it must have a trailing / """
    if dir:
        os.makedirs(path, exist_ok=True)
    else:
        os.makedirs(os.path.dirname(path), exist_ok=True)
    return path


class Test01_xsdval_valid(unittest.TestCase):

    def setUp(self):
        pvzd_verify_sig = 'at/wien/ma14/pvzd/validatexsd/XSDValidator'
        from jnius import autoclass   # TODO: move to setup class
        #print ('need pvzdValidateXsd.jar: CLASSPATH=' + os.environ['CLASSPATH'])
        pyjnius_xsdvalidator = autoclass(pvzd_verify_sig)
        self.saml_xsd_validator = pyjnius_xsdvalidator('xmlschema', False)

    def test_OK(self):
        logging.info('  -- Test XSD01: testing schema validation/expecting OK')
        retmsg = self.saml_xsd_validator.validateSchema('testdata/idp_valid.xml')
        self.assertIsNone(retmsg, msg=retmsg)

    def test_NotOK(self):
        logging.info('  -- Test XSD02: test calling schema validation/expecting invalid schema')
        retmsg = self.saml_xsd_validator.validateSchema('testdata/idp_not_schema_valid.xml')
        self.assertTrue(str(retmsg).startswith('ERROR: Validation of testdata/idp_not_schema_valid.xml failed'), retmsg)

if __name__ == '__main__':
    sys.exit(unittest.main())
