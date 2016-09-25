import os
from jnius import autoclass
print ('need pvzdValidateXsd.jar: CLASSPATH=' + os.environ['CLASSPATH'])
pvzd_verify_sig = 'at/wien/ma14/pvzd/validatexsd/XSDValidator'
pyjnius_xsdvalidator = autoclass(pvzd_verify_sig)
saml_xsd_validator = pyjnius_xsdvalidator('xmlschema', False)
saml_xsd_validator.validateSchema('testdata/idp_incomplete.xml')