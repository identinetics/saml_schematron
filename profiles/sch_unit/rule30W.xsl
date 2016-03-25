<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 30-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="md:AssertionConsumerService" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact'"><axsl:message>
Warning (30): AssertionConsumerService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact" is deprecated
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact')</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
