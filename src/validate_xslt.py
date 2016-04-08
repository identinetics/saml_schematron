import argparse
import logging, os, re, sys
import lxml.etree as etree
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

class ValidatorResult:
    def __init__(self):
        pass


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
        xslt_fname = os.path.join(self.xsltdir, self.args.rule[0] + '.xsl')
        xslt = etree.parse(xslt_fname)
        transform = etree.XSLT(xslt)
        md_dom = etree.parse(self.args.metadatafile.name)
        for e in md_dom.findall('{urn:oasis:names:tc:SAML:2.0:metadata}EntitiesDescriptor'):
            if self.args.verbose: print('entityID: ' + e.attrib['entityID'])
        out_dom = transform(md_dom)
        validator_result = ValidatorResult()
        m_unformatted = transform.error_log.last_error.message.lstrip()
        validator_result.message_one_line = ' '.join(m_unformatted.split())
        if re.search('Error', m_unformatted):
            validator_result.level = 'ERROR'
        elif m_unformatted.startswith('Warning'):
            validator_result.level = 'WARNING'
        elif re.match('Info', m_unformatted ):
            validator_result.level = 'OK'
        elif re.match('unknown error', m_unformatted):
            validator_result.level = 'OK'
            validator_result.message_one_line = ''
        else:
            print('message unformatted:')
            print(m_unformatted )
            raise Exception('cannot parse Schematon output message to get severity level')
        m1 = re.sub('XPATH:', '\n    XPATH:', validator_result.message_one_line)
        validator_result.message_formatted = re.sub('validation rule:', '\n    validation rule:', m1)
        return validator_result


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
    val_result = run_me()
    print(val_result.level)
    print(val_result.message_formatted)
    print(val_result.message_one_line)
