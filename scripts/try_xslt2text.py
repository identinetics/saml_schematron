import lxml.etree as etree
with open('rules/schtron_xsl/rule00I.xsl') as fd:
    transform = etree.XSLT(etree.XML(''.join(fd.readlines())))
with open('testdata/idp_valid.xml') as fd:
    md_dom = etree.parse(fd)
result_xml = (transform(md_dom))
print(etree.tostring(result_xml))
