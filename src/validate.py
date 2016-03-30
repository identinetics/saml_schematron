import argparse
import logging, os, sys
import lxml.etree as ET
import abstract_invocation

class CliParser(abstract_invocation.AbstractInvocation):
    """ define CLI invocation for validate.  Test runner can use this by passing testargs """
    def __init__(self, testargs=None):
        self._parser = argparse.ArgumentParser(description='SAML metadata validation')
        self._parser.add_argument('-r', '--ruledir', dest='ruledir',
            help='directory to find rule xsl file')
        self._parser.add_argument('-p', '--profile', dest='profile',
            help='profile defining a set of rules')
        self._parser.add_argument('-v', '--verbose', dest='verbose', action="store_true")
        self._parser.add_argument('metadatafile', type=argparse.FileType('r'),
            help='metadata file name')
        self._parser.add_argument('rule', nargs='*',
            help='rule name (schematron file name, without extension')

        if (testargs):
            self.args = self._parser.parse_args(testargs)
        else:
            self.args = self._parser.parse_args()  # regular case: use sys.argv



class Validator:

    def __init__(self, invocation):
        self.args = invocation.args
        self.projdir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
        if self.args.verbose:
            print('self.projdir = ' + self.projdir)
            print('metadatafile = ' + self.args.metadatafile.name)
            print('rules: ' + ', '.join(self.args.rule))
        if getattr(self.args, 'ruledir', None):
            self.xsltdir = self.args.ruledir
        else:
            self.xsltdir = os.path.join(self.projdir, 'rules', 'schtron')

    def validate(self) -> str:
        md_dom = ET.parse(self.args.metadatafile.name)
        if self.args.verbose: print('entityID: ' + md_dom.getroot().attrib['entityID'])
        with open(os.path.join(self.xsltdir, self.args.rule[0] + '.xsl')) as xslt_fd:
            xslt = ET.fromstring(xslt_fd.read())
        transform = ET.XSLT(xslt)
        out_dom = transform(md_dom)
        out_bytes = ET.tostring(out_dom,
                                xml_declaration=False,
                                encoding='utf-8')
        if out_bytes is None:
            out_str = ""
        else:
            out_str = out_bytes.decode('utf-8')
        return out_str


def run_me(testrunnerInvocation=None):
    if testrunnerInvocation:
        # CLI args and logger set by unit test
        invocation = testrunnerInvocation
    else:
        invocation = CliParser()
    validator = Validator(invocation)
    return validator.validate()


if __name__ == '__main__':
    if sys.version_info < (3, 4):
        raise "must use python 3.4 or higher"
    print(run_me())
