import os.path
from constants import PROJDIR_ABS

__author__ = 'r2h2'


class XmlSchemaValidator:
    """
    Validates XML schema using Xerces/Java
    """
    def __init__(self, xsd_schema_dir):
        self.saml_xsd_dir = os.path.join(PROJDIR_ABS, xsd_schema_dir)
        # name of class in foo/bar/Baz form (not foo.bar.Baz)
        pvzd_verify_sig = 'at/wien/ma14/pvzd/validatexsd/XSDValidator'
        try:
            os.environ['PYJNIUS_ACTIVATE']
            from jnius import autoclass
            self.pyjnius_xsdvalidator = autoclass(pvzd_verify_sig)
            self.saml_xsd_validator = self.pyjnius_xsdvalidator(self.saml_xsd_dir, False)
        except KeyError:
            import javabridge
            # constructor takes a string and a boolean
            self.saml_xsd_validator = javabridge.make_instance(pvzd_verify_sig,
                "(Ljava/lang/String;Z)V",self.saml_xsd_dir, False)


    def validate_xsd(self, filename_abs):
        try:
            os.environ['PYJNIUS_ACTIVATE']
            return self.saml_xsd_validator.validateSchema(filename_abs)
        except KeyError:
            import javabridge
            # method takes a string and returns a string
            return javabridge.call(self.saml_xsd_validator, "validateSchema",
                "(Ljava/lang/String;)Ljava/lang/String;", filename_abs)

    def validate_schematron(self):
        pass  # TODO: implement

