import os.path
from jnius import autoclass

__author__ = 'r2h2'


class Py2JavaTest:
    """
    Used to test java interface and call libraries
    Validates XML schema using Xerces/Java
    Validates XML signature using MOA-ID
    """
    def __init__(self, xsd_schema_dir):
        self.PROJROOT = os.path.dirname(os.path.dirname(__file__))
        self.pyjnius_xsdvalidator = autoclass('at.wien.ma14.pvzd.validatexsd.XSDValidator')
        self.saml_xsd_validator = self.pyjnius_xsdvalidator(xsd_schema_dir, False)

    def validate_xsd(self, filename_abs):
        return self.saml_xsd_validator.validateSchema(filename_abs)

    def validate_schematron(self):
        pass  # TODO: implement


    def verify_xmlsig(self, xml_file_name):
            verifier = self.pyjnius_verfiy_sig(
                os.path.join(self.PROJROOT, 'conf/moa-spss/MOASPSSConfiguration.xml'),
                os.path.join(self.PROJROOT, 'conf/log4j.properties'),
                xml_file_name)
            response  = verifier.verify()
            if response.pvzdCode != 'OK':
                raise ValidationError("Signature verification failed, code=" +
                                      response.pvzdCode + "; " + response.pvzdMessage)


if __name__ == '__main__':
    scriptpath = os.path.dirname(os.path.realpath(__file__))
    PROJROOT = os.path.dirname(scriptpath)

    print("== 1 == Testing Pthon/Java Interface (pyjnius) with built-in class")
    Stack = autoclass('java.util.Stack')
    stack = Stack()
    stack.push('OK')
    print(stack.pop())

    print("== 2 == Testing Pthon/Java Interface (pyjnius) with XSDValidator")
    schema_dir_abs = os.path.join(PROJROOT, 'xmlschema')
    py2java_test = Py2JavaTest(schema_dir_abs)
    retmsg = py2java_test.validate_xsd(os.path.join(PROJROOT, 'testdata/idp_valid.xml'))
    if retmsg is None:
        print('Schema validated')
    else:
        print('Schema validation failed: ' + retmsg)


