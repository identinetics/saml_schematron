<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 16-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="md:AttributeConsumingService"><axsl:message>
Warning (16): AttributeConsumingService is deprecated. Use EntityCategories instead.
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:AttributeConsumingService)</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
