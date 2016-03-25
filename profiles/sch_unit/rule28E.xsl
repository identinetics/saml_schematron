<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 28-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="alg:SigningMethod" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256"><axsl:message>
Error (28): MinKeySize must be greater or equal to 256 if Algorithm starts with "http://www.w3.org/2001/04/xmldsig-more#ecdsa"
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256)</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
