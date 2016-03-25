<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 25-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="alg:DigestMethod" priority="1000" mode="M0">

		<!--ASSERT -->
<axsl:choose><axsl:when test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1'"/><axsl:otherwise><axsl:message>
Warning (25): DigestMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#sha1
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
