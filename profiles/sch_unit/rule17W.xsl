<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 17-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="not(md:Extensions) or                        md:Extensions[not(idpdisc:DiscoveryResponse)]"><axsl:message>
Warning (17): SPSSODescriptor should include Extensions/DiscoveryResponse
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (not(md:Extensions) or md:Extensions[not(idpdisc:DiscoveryResponse)])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
