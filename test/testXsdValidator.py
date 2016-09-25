import logging
import logging.config
import loggingconfig
import os
import re
import shutil
import unittest

__author__ = 'r2h2'

def setUpModule():
    try:
        os.environ['PYJNIUS_ACTIVATE']
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
    def runTest(self):
        logging.info('  -- Test XSD01: testing schema validation/expecting OK')
        from jnius import autoclass
        self.assertIsNone(retmsg, msg=retmsg)
        #print ('need pvzdValidateXsd.jar: CLASSPATH=' + os.environ['CLASSPATH'])
        pvzd_verify_sig = 'at/wien/ma14/pvzd/validatexsd/XSDValidator'
        pyjnius_xsdvalidator = autoclass(pvzd_verify_sig)
        saml_xsd_validator = pyjnius_xsdvalidator('xmlschema', False)
        saml_xsd_validator.validateSchema('testdata/idp_incomplete.xml')

class Test02_xsdval_invalid(unittest.TestCase):
    def runTest(self):
        logging.info('  -- Test XSD02: test calling schema validation/expecting invalid schema')
        with self.assertRaises(InputValueError) as context:
            with open(os.path.abspath('testdata/idp_invomplete.xml')) as f:
                ed = SAMLEntityDescriptor(f)
                retmsg = ed.validate_xsd()

if __name__ == '__main__':
    unittest.main()
