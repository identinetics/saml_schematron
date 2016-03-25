<?xml version="1.0" standalone="yes"?>


<!--PATTERN Entity rules-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="md:EntityDescriptor" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::rpi:*"><axsl:message>
Error (08): EntityDescriptor created by the entity operator must not contain elements from the mdrpi namespace (urn:oasis:names:tc:SAML:metadata:rpi); this is reserved for metadata publishers.
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::rpi:*)</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
