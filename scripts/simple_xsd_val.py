import lxml.etree as etree
import os


class Validator:

    def __init__(self):
        xsd_path = os.path.abspath('all-saml-meta.xsd')
        xmlschema_doc = etree.parse(xsd_path)
        self.xmlschema = etree.XMLSchema(xmlschema_doc)

    def validate(self, xml_path: str) -> bool:
        xml_doc = etree.parse(xml_path)
        result = self.xmlschema.validate(xml_doc)

        return result




validator = Validator()

# The directory with XML files
XML_DIR = "/Users/admin/devl/pycharm/rhoerbe/saml_schematron/testdata"

for file_name in os.listdir(XML_DIR):
    if file_name.endswith('.xml'):
        next
    print('{}: '.format(file_name), end='')

    file_path = '{}/{}'.format(XML_DIR, file_name)

    if validator.validate(file_path):
        print('Valid! :)')
    else:
        print('Not valid! :(')