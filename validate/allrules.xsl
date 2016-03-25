<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:rpi="urn:oasis:names:tc:SAML:metadata:rpi" xmlns:mdui="urn:oasis:names:tc:SAML:metadata:ui" xmlns:alg="urn:oasis:names:tc:SAML:metadata:algsupport" xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion" xmlns:idpdisc="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol" xmlns:mdattr="urn:oasis:names:tc:SAML:metadata:attribute" xmlns:init="urn:oasis:names:tc:SAML:profiles:SSO:request-init" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<axsl:param name="archiveDirParameter"/><axsl:param name="archiveNameParameter"/><axsl:param name="fileNameParameter"/><axsl:param name="fileDirParameter"/>

<!--PHASES-->


<!--PROLOG-->
<axsl:output method="text"/><axsl:template name="xpathgetter"><axsl:variable name="name" select="name()"/><axsl:apply-templates select="parent::*" mode="xpathgetter"/>/<axsl:value-of select="$name"/>[<axsl:value-of select="count(preceding-sibling::*[name() = $name]) + 1"/>]
   </axsl:template><axsl:template match="*" mode="xpathgetter"><axsl:call-template name="xpathgetter"/></axsl:template>

<!--KEYS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<axsl:template match="*" mode="schematron-select-full-path"><axsl:apply-templates select="." mode="schematron-get-full-path"/></axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<axsl:template match="*" mode="schematron-get-full-path"><axsl:apply-templates select="parent::*" mode="schematron-get-full-path"/><axsl:text>/</axsl:text><axsl:choose><axsl:when test="namespace-uri()=''"><axsl:value-of select="name()"/><axsl:variable name="p_1" select="1+    count(preceding-sibling::*[name()=name(current())])"/><axsl:if test="$p_1&gt;1 or following-sibling::*[name()=name(current())]">[<axsl:value-of select="$p_1"/>]</axsl:if></axsl:when><axsl:otherwise><axsl:text>*[local-name()='</axsl:text><axsl:value-of select="local-name()"/><axsl:text>' and namespace-uri()='</axsl:text><axsl:value-of select="namespace-uri()"/><axsl:text>']</axsl:text><axsl:variable name="p_2" select="1+   count(preceding-sibling::*[local-name()=local-name(current())])"/><axsl:if test="$p_2&gt;1 or following-sibling::*[local-name()=local-name(current())]">[<axsl:value-of select="$p_2"/>]</axsl:if></axsl:otherwise></axsl:choose></axsl:template><axsl:template match="@*" mode="schematron-get-full-path"><axsl:text>/</axsl:text><axsl:choose><axsl:when test="namespace-uri()=''">@<axsl:value-of select="name()"/></axsl:when><axsl:otherwise><axsl:text>@*[local-name()='</axsl:text><axsl:value-of select="local-name()"/><axsl:text>' and namespace-uri()='</axsl:text><axsl:value-of select="namespace-uri()"/><axsl:text>']</axsl:text></axsl:otherwise></axsl:choose></axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<axsl:template match="node() | @*" mode="schematron-get-full-path-2"><axsl:for-each select="ancestor-or-self::*"><axsl:text>/</axsl:text><axsl:value-of select="name(.)"/><axsl:if test="preceding-sibling::*[name(.)=name(current())]"><axsl:text>[</axsl:text><axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/><axsl:text>]</axsl:text></axsl:if></axsl:for-each><axsl:if test="not(self::*)"><axsl:text/>/@<axsl:value-of select="name(.)"/></axsl:if></axsl:template>

<!--MODE: GENERATE-ID-FROM-PATH -->
<axsl:template match="/" mode="generate-id-from-path"/><axsl:template match="text()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/></axsl:template><axsl:template match="comment()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/></axsl:template><axsl:template match="processing-instruction()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/></axsl:template><axsl:template match="@*" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.@', name())"/></axsl:template><axsl:template match="*" mode="generate-id-from-path" priority="-0.5"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:text>.</axsl:text><axsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/></axsl:template><!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<axsl:template match="node() | @*" mode="schematron-get-full-path-3"><axsl:for-each select="ancestor-or-self::*"><axsl:text>/</axsl:text><axsl:value-of select="name(.)"/><axsl:if test="parent::*"><axsl:text>[</axsl:text><axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/><axsl:text>]</axsl:text></axsl:if></axsl:for-each><axsl:if test="not(self::*)"><axsl:text/>/@<axsl:value-of select="name(.)"/></axsl:if></axsl:template>

<!--MODE: GENERATE-ID-2 -->
<axsl:template match="/" mode="generate-id-2">U</axsl:template><axsl:template match="*" mode="generate-id-2" priority="2"><axsl:text>U</axsl:text><axsl:number level="multiple" count="*"/></axsl:template><axsl:template match="node()" mode="generate-id-2"><axsl:text>U.</axsl:text><axsl:number level="multiple" count="*"/><axsl:text>n</axsl:text><axsl:number count="node()"/></axsl:template><axsl:template match="@*" mode="generate-id-2"><axsl:text>U.</axsl:text><axsl:number level="multiple" count="*"/><axsl:text>_</axsl:text><axsl:value-of select="string-length(local-name(.))"/><axsl:text>_</axsl:text><axsl:value-of select="translate(name(),':','.')"/></axsl:template><!--Strip characters--><axsl:template match="text()" priority="-1"/>

<!--SCHEMA METADATA-->
<axsl:template match="/"><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/><axsl:apply-templates select="/" mode="M0"/></axsl:template>

<!--SCHEMATRON PATTERNS-->
<axsl:template match="/" name="bryansgeneratedtemplate"><axsl:apply-templates mode="M10"/></axsl:template><axsl:template match="text()" mode="M10"/><axsl:template match="md:EntityDescriptor" priority="1008" mode="M10">

		<!--REPORT -->
<axsl:if test="@entityID"><axsl:message>
Validating entityID <axsl:text/><axsl:value-of select="@entityID"/><axsl:text/>
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@entityID)</axsl:message></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="starts-with(@entityID,'https://')"/><axsl:otherwise><axsl:message>
Error (01): @entityID values must start with “https://”
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (starts-with(@entityID,'https://'))</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Organization"/><axsl:otherwise><axsl:message>
Warning (05): EntityDescriptor should contain an Organization
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Organization)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:ContactPerson[normalize-space(@contactType)='support'][md:EmailAddress]"/><axsl:otherwise><axsl:message>
Warning (06): EntityDescriptor should contain ContactPerson with a contactType of "support" and at least one EmailAddress
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:ContactPerson[normalize-space(@contactType)='support'][md:EmailAddress])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:ContactPerson[normalize-space(@contactType)='technical'][md:EmailAddress]"/><axsl:otherwise><axsl:message>
Warning (07): EntityDescriptor should contain ContactPerson with a contactType of "technical" and at least one EmailAddress
      XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:ContactPerson[normalize-space(@contactType)='technical'][md:EmailAddress])</axsl:message></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="descendant::rpi:*"><axsl:message>
Error (08): EntityDescriptor created by the entity operator must not contain elements from the mdrpi namespace (urn:oasis:names:tc:SAML:metadata:rpi); this is reserved for metadata publishers.
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::rpi:*)</axsl:message></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@entityID) &lt; 81"/><axsl:otherwise><axsl:message>
Warning (31): @entityID length should not exceed 80 characters”
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (string-length(@entityID) &lt; 81)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]"/><axsl:otherwise><axsl:message>
Warning (37): EntityDescriptor should contain EntityAttributes with an AttributeValue of http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']])</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="md:NameIDFormat" priority="1007" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'                 or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient'                or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified'                or normalize-space(text()) = '' "/><axsl:otherwise><axsl:message>
Warnung (02): This NameIDFormat may not be supported. Supported values for NameIDFormat are:
    urn:oasis:names:tc:SAML:2.0:nameid-format:persistent 
    urn:oasis:names:tc:SAML:2.0:nameid-format:transient 
    urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent' or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient' or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified' or normalize-space(text()) = '')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="//md:IDPSSODescriptor" priority="1006" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:NameIDFormat[text() != '']"/><axsl:otherwise><axsl:message>
Warning (03): Each IDPSSODescriptor should contain NameIDFormat with one or more values
       XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:NameIDFormat[text() != ''])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:KeyDescriptor[@use='signing' or not(@use)]/ds:KeyInfo/ds:X509Data/ds:X509Certificate"/><axsl:otherwise><axsl:message>
Error (04): Each IDPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)         
         XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:KeyDescriptor[@use='signing' or not(@use)]/ds:KeyInfo/ds:X509Data/ds:X509Certificate)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:SingleSignOnService"/><axsl:otherwise><axsl:message>
Error (09): IDPSSODescriptor does not contain a SingleSignOnService“
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:SingleSignOnService)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect']"/><axsl:otherwise><axsl:message>
Error (09): IDPSSODescriptor must contain a SingleSignOnService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect“
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::alg:DigestMethod"/><axsl:otherwise><axsl:message>
Error (12): IDPSSODescriptor must contain alg:DigestMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::alg:DigestMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::alg:SigningMethod"/><axsl:otherwise><axsl:message>
Error (13): IDPSSODescriptor must contain SigningMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::alg:SigningMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/mdui:DiscoHints"/><axsl:otherwise><axsl:message>
Warning (14): IDPSSODescriptor should contain discovery hints
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/mdui:DiscoHints)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:SingleLogoutService"/><axsl:otherwise><axsl:message>
Warning (15): IDPSSODescriptor should contain SingleLogoutService
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:SingleLogoutService)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/mdui:UIInfo"/><axsl:otherwise><axsl:message>
Error (32): IDPSSODescriptor  must contain a mdui:UIInfo element
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/mdui:UIInfo)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/alg:DigestMethod"/><axsl:otherwise><axsl:message>
Warning (33): IDPSSODescriptor should contain alg:DigestMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/alg:DigestMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/alg:SigningMethod"/><axsl:otherwise><axsl:message>
Warning (34): IDPSSODescriptor should contain alg:SigningMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/alg:SigningMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="normalize-space(@protocolSupportEnumeration)='urn:oasis:names:tc:SAML:2.0:protocol'"/><axsl:otherwise><axsl:message>
Error (35): protocolSupportEnumeration may contain only "urn:oasis:names:tc:SAML:2.0:protocol"
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(@protocolSupportEnumeration)='urn:oasis:names:tc:SAML:2.0:protocol')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="//md:SPSSODescriptor" priority="1005" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:NameIDFormat[text() != '']"/><axsl:otherwise><axsl:message>
Warning (03): Each SPSSODescriptor should contain NameIDFormat with one or more values
       XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:NameIDFormat[text() != ''])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::ds:X509Data/ds:X509Certificate"/><axsl:otherwise><axsl:message>
Error (04): Each SPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)
         XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::ds:X509Data/ds:X509Certificate)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:AssertionConsumerService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST']"/><axsl:otherwise><axsl:message>
Warning (11): SPSSODescriptor should contain an AssertionConsumerService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:AssertionConsumerService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::alg:DigestMethod"/><axsl:otherwise><axsl:message>
Error (12): SPSSODescriptor must contain alg:DigestMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::alg:DigestMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="descendant::alg:SigningMethod"/><axsl:otherwise><axsl:message>
Error (13): SPSSODescriptor must contain SigningMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::alg:SigningMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:SingleLogoutService"/><axsl:otherwise><axsl:message>
Warning (15): SPSSODescriptor should contain SingleLogoutService
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:SingleLogoutService)</axsl:message></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="md:AttributeConsumingService"><axsl:message>
Warning (16): AttributeConsumingService is deprecated. Use EntityCategories instead.
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:AttributeConsumingService)</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="not(md:Extensions) or                        md:Extensions[not(idpdisc:DiscoveryResponse)]"><axsl:message>
Warning (17): SPSSODescriptor should include Extensions/DiscoveryResponse
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (not(md:Extensions) or md:Extensions[not(idpdisc:DiscoveryResponse)])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]"><axsl:message>
Error (18a): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']]"><axsl:message>
Error (18b): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.geant.net/uri/dataprotection-code-of-conduct/v1']]"><axsl:message>
Error (18c): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.geant.net/uri/dataprotection-code-of-conduct/v1)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.geant.net/uri/dataprotection-code-of-conduct/v1']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/research-and-education']]"><axsl:message>
Error (18d): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.swamid.se/category/research-and-education)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/research-and-education']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/sfs-1993-1153']]"><axsl:message>
Error (18e): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.swamid.se/category/sfs-1993-1153)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/sfs-1993-1153']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://refeds.org/category/research-and-scholarship']]"><axsl:message>
Error (18f): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://refeds.org/category/research-and-scholarship)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://refeds.org/category/research-and-scholarship']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://id.incommon.org/category/research-and-scholarship']]"><axsl:message>
Error (18g): EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://id.incommon.org/category/research-and-scholarship)
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://id.incommon.org/category/research-and-scholarship']])</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text())            != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'            and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']"><axsl:message>
Warning (19): SPSSODescriptor EntityAttributes are allowed to have on or more of the following attribute values: 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken, 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken' and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge'])</axsl:message></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/init:RequestInitiator"/><axsl:otherwise><axsl:message>
Warning (20): SPSSODescriptor should include init:RequestInitiator
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/init:RequestInitiator)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/mdui:UIInfo"/><axsl:otherwise><axsl:message>
Warning (21): SPSSODescriptor should include a mdui:UIInfo element
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/mdui:UIInfo)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/alg:DigestMethod"/><axsl:otherwise><axsl:message>
Warning (33): SPSSODescriptor should contain alg:DigestMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/alg:DigestMethod)</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:Extensions/alg:SigningMethod"/><axsl:otherwise><axsl:message>
Warning (34): SPSSODescriptor should contain alg:SigningMethod
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:Extensions/alg:SigningMethod)</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="md:IDPSSODescriptor" priority="1004" mode="M10">

		<!--REPORT -->
<axsl:if test="descendant::saml:Attribute"><axsl:message>
Warning (10): IDPSSODescriptor contains &lt;saml2:Attribute&gt; elements; but implementations may not understand this.
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (descendant::saml:Attribute)</axsl:message></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST']"/><axsl:otherwise><axsl:message>
Error (36): IDPSSODescriptor must contain a SingleSignOnService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST“
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'])</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="mdui:UIInfo" priority="1003" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="mdui:DisplayName[string-length() &gt; 0]"/><axsl:otherwise><axsl:message>
Error (22a): UIInfo must include a non-empty DisplayName
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (mdui:DisplayName[string-length() &gt; 0])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="mdui:Description[string-length() &gt; 0]"/><axsl:otherwise><axsl:message>
Error (22b): UIInfo must include a non-empty Description
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (mdui:Description[string-length() &gt; 0])</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="mdui:Logo[string-length() &gt; 0]"/><axsl:otherwise><axsl:message>
Error (22c): UIInfo must include a non-empty Logo URL
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (mdui:Logo[string-length() &gt; 0])</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="alg:DigestMethod" priority="1002" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256'                     or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1'                    or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512'                    or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160' "/><axsl:otherwise><axsl:message>
Error (23): alg:DigestMethod element may only contain following @Algorithm values: 
    http://www.w3.org/2000/09/xmldsig#sha1 
    http://www.w3.org/2001/04/xmlenc#sha256 
    http://www.w3.org/2001/04/xmlenc#sha512 
    http://www.w3.org/2001/04/xmlenc#ripemd160
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256' or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1' or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512' or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160')</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1'"/><axsl:otherwise><axsl:message>
Warning (25): DigestMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#sha1
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="alg:SigningMethod" priority="1001" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test=" @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'                      or @Algorithm='http://www.w3.org/2000/09/xmldsig#rsa-sha1'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha384'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512'     "/><axsl:otherwise><axsl:message>
Error (24): Each alg:SigningMethod may only contain following @Algorithm values: 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha256 
    http://www.w3.org/2000/09/xmldsig#rsa-sha1 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha384 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha512 
    http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256 
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384 
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512    
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256' or @Algorithm='http://www.w3.org/2000/09/xmldsig#rsa-sha1' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha384' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512')</axsl:message></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#rsa-sha1'"/><axsl:otherwise><axsl:message>
Warning (26): SigningMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#rsa-sha1
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@Algorithm !='http://www.w3.org/2000/09/xmldsig#rsa-sha1')</axsl:message></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#rsa') and @MinKeySize &lt; 2048"><axsl:message>
Error (27): MinKeySize must be greater or equal to 2048 if Algorithm starts with "http://www.w3.org/2001/04/xmldsig-more#rsa"
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#rsa') and @MinKeySize &lt; 2048)</axsl:message></axsl:if>

		<!--REPORT -->
<axsl:if test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256"><axsl:message>
Error (28): MinKeySize must be greater or equal to 256 if Algorithm starts with "http://www.w3.org/2001/04/xmldsig-more#ecdsa"
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256)</axsl:message></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="@MaxKeySize"/><axsl:otherwise><axsl:message>
Error (29): alg:SigningMethod must have an attribute MaxKeySize
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@MaxKeySize)</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="md:AssertionConsumerService" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact'"><axsl:message>
Warning (30): AssertionConsumerService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact" is deprecated
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact')</axsl:message></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template></axsl:stylesheet>
