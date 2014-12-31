__author__ = 'rhoerbe'
import unittest, subprocess, os, re
from os.path import abspath, dirname, getsize, join
from tempfile import NamedTemporaryFile

class StopAction(Exception):
    pass


class TestRule11(unittest.TestCase):

    def setUp(self):
        wrapper = '''<?xml version="1.0" encoding="utf-8"?>
            <iso:schema
                xmlns="http://purl.oclc.org/dsdl/schematron"
                xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                queryBinding='xslt'
                schemaVersion='ISO19757-3'>
                <iso:title></iso:title>
                <iso:ns prefix='md' uri='urn:oasis:names:tc:SAML:2.0:metadata'/>
                <iso:ns prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>
                <iso:ns prefix="rpi" uri="urn:oasis:names:tc:SAML:metadata:rpi"/>
                <iso:ns prefix="mdui" uri="urn:oasis:names:tc:SAML:metadata:ui"/>
                <iso:ns prefix="alg" uri="urn:oasis:names:tc:SAML:metadata:algsupport"/>
                <iso:ns prefix="saml" uri="urn:oasis:names:tc:SAML:2.0:assertion"/>
                <iso:ns prefix="idpdisc" uri="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol"/>
                <iso:ns prefix="mdattr" uri="urn:oasis:names:tc:SAML:metadata:attribute"/>
                <iso:ns prefix="init" uri="urn:oasis:names:tc:SAML:profiles:SSO:request-init"/>
                <iso:include-set>
                    <iso:include href="{projroot}/profiles/sch_unit/rule{r}.sch" />
                </iso:include-set>
            </iso:schema>
        '''

        self.projroot = abspath(dirname(dirname(__file__)))
        self.rule = "11W"
        # xsltproc needs files - create a temporary file with the string as content
        rule_wrapper = wrapper.format(projroot = self.projroot, r = self.rule)
        ntf = NamedTemporaryFile(suffix='', delete=False)
        rule_wrapper_filename = ntf.name
        ntf.write(rule_wrapper)
        ntf.close()

        # create xslt from schematron
        self.schematronrule_filename = join(self.projroot, 'profiles/sch_unit/rule{r}.sch'.format(r = self.rule))
        xsltrule_filename = join(self.projroot, 'validate/rule{r}.xsl'.format(r = self.rule))
        xslt_filename = join(self.projroot, 'validate/rule{r}.xsl'.format(r = self.rule))
        xslt_file = open(xslt_filename, "w")

        self.xslt_stderr_filename = join(self.projroot, 'reports/testdata/rule{r}_invalid.err'.format(r = self.rule))
        try:
            os.unlink(self.xslt_stderr_filename)
        except OSError:
            pass
        self.xslt_stderr_file = open(self.xslt_stderr_filename, "w")
        cmd1 = ['/usr/bin/env', 'xsltproc',
                join(self.projroot, 'lib/message.xsl'),
                rule_wrapper_filename, ]

        rc = subprocess.call(cmd1, stdout=xslt_file, stderr=self.xslt_stderr_file)
        print 'schematron to xslt: ' + ' '.join(cmd1) + ' returned ' + str(rc)
        if getsize(self.xslt_stderr_filename) > 0:
            if not re.match('pydev debugger: process \d+ is connecting\s',
                            open(self.xslt_stderr_filename, 'r').read()):
                print "schematron to xslt: execution of xsltproc failed, see %s" % self.xslt_stderr_file
                raise StopAction

    def test_rule_invalid(self):
        #  apply xslt on saml metadata test target (expect rule to fire message)
        testtarget_filename = join(self.projroot, 'testdata/rule{r}_invalid.xml'.format(r = self.rule))
        ref_output_filename = join(self.projroot, 'testdata/rule{r}_invalid.stderr'.format(r = self.rule))
        xslt_stdout_filename = join(self.projroot, 'reports/testdata/rule{r}_invalid.txt'.format(r = self.rule))
        xslt_stdout_file = open(xslt_stdout_filename, "w")
        cmd2 = ["/usr/bin/env", "xsltproc",
                "{projroot}/validate/rule{r}.xsl".format(projroot = self.projroot, r = self.rule),
                self.schematronrule_filename,
                testtarget_filename, ]
        rc = subprocess.call(cmd2, shell=False, stdout=xslt_stdout_file, stderr=self.xslt_stderr_file)
        print 'metadata validation: ' + ' '.join(cmd2) + ' returned ' + str(rc)
        if getsize(xslt_stdout_filename) > 0:
                print "metadata validation: xsltproc should not produce output on stdout, see %s" % xslt_output_filename
                raise StopAction

        self.assertEqual(open(self.xslt_stderr_filename, 'r').read(),
                         open(ref_output_filename, 'r').read(),
                         'Rule {r}: Generated output in {f1} does not match reference in {f2}'.format(r = self.rule, f1 = xslt_stdout_filename, f2 = ref_output_filename))

    def test_rule_valid(self):
        #  apply xslt on saml metadata test target (expect rule to be silent)
        testtarget_filename = join(self.projroot, 'testdata/rule{r}_valid.xml'.format(r = self.rule))
        xslt_stdout_filename = join(self.projroot, 'reports/testdata/rule{r}_valid.txt'.format(r = self.rule))
        xslt_stdout_file = open(xslt_stdout_filename, "w")
        cmd2 = ["/usr/bin/env", "xsltproc",
                "{projroot}/validate/rule{r}.xsl".format(projroot = self.projroot, r = self.rule),
                self.schematronrule_filename,
                testtarget_filename, ]
        rc = subprocess.call(cmd2, shell=False, stdout=xslt_stdout_file, stderr=self.xslt_stderr_file)
        print 'metadata validation: ' + ' '.join(cmd2) + ' returned ' + str(rc)
        if getsize(xslt_stdout_filename) > 0:
                print "metadata validation: xsltproc should not produce output on stdout, see %s" % xslt_output_filename
                raise StopAction

        self.assertEqual(open(xslt_stdout_filename, 'r').read(),
                         '',
                         'Rule {r}: Generated output in {f1} should be empty'.format(r = self.rule, f1 = xslt_stdout_filename))

    def tearDown(self):
        try:
            os.unlink(self.rule_wrapper_filename)
        except:
            pass



if __name__ == '__main__':
    unittest.main()