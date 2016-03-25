<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 18-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1006" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]"><axsl:message>
Error (18a): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template>

	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1005" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']]"><axsl:message>
Error (18b): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template>

	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1004" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.geant.net/uri/dataprotection-code-of-conduct/v1']]"><axsl:message>
Error (18c): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.geant.net/uri/dataprotection-code-of-conduct/v1)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.geant.net/uri/dataprotection-code-of-conduct/v1']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template>

	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1003" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/research-and-education']]"><axsl:message>
Error (18d): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.swamid.se/category/research-and-education)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/research-and-education']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template>

	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1002" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/sfs-1993-1153']]"><axsl:message>
Error (18e): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.swamid.se/category/sfs-1993-1153)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/sfs-1993-1153']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template>

	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1001" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://refeds.org/category/research-and-scholarship']]"><axsl:message>
Error (18f): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://refeds.org/category/research-and-scholarship)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://refeds.org/category/research-and-scholarship']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template>

	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="//md:SPSSODescriptor" priority="1000" mode="M0">

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://id.incommon.org/category/research-and-scholarship']]"><axsl:message>
Error (18g): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://id.incommon.org/category/research-and-scholarship)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://id.incommon.org/category/research-and-scholarship']])</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
