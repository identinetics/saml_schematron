<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 1-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="md:EntityDescriptor" priority="1000" mode="M0">

		<!--ASSERT -->
<axsl:choose><axsl:when test="starts-with(@entityID,'https://')"/><axsl:otherwise><axsl:message>
Error (01): @entityID values must start with “https://”
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (starts-with(@entityID,'https://'))</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
