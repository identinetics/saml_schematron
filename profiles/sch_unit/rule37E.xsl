<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 37-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="md:EntityDescriptor" priority="1000" mode="M0">

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]"/><axsl:otherwise><axsl:message>
Warning (37): EntityDescriptor should contain EntityAttributes with an AttributeValue of http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']])</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
