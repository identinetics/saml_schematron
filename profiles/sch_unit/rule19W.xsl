<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 19-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text())            != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'            and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']"><axsl:message>
Warning (19): SPSSODescriptor EntityAttributes are allowed to have on or more of the following attribute values: 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken, 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken' and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge'])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
