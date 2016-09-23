import lxml.etree as etree

with open('rules/schtron_xsl/rule00I.xsl') as fd:
    transform = etree.XSLT(etree.XML(''.join(fd.readlines())))
with open('testdata/rule03W_idp_fail.xml') as fd:
    md_dom = etree.parse(fd)
transform(md_dom)
print(str(transform.error_log).replace('<string>:0:0:ERROR:XSLT:ERR_OK:', ''))
