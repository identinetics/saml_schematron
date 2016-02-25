class Config(object):
    def __init__(self):
        self.HttpServer = {
            'port': 8080,
            'listen': '0.0.0.0'
        }
        self.Backend = {
            # Note: always include trailing slash in directory definitions
            # Directory where files are temporarily stored for valdation
            'tempdir': '/tmp/',
            'templatedir': './',
            'scriptdir': '../scripts/',

            # Scripts for XSD validation
            'xsdxmllint': 'xsd_validation_xmllint.sh',
            'xsdxmlsectool': 'xsd_validation_xmlsectool.sh',

            # Scripts for Schematron validation
            'pvp2schematron': 'val_pvp2_libxslt_stdout.sh',
            'saml2intschematron': 'val_saml2int_libxslt_stdout.sh',
        }