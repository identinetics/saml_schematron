<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata" md:dummy-for-xmlns="" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" ds:dummy-for-xmlns="" xmlns:rpi="urn:oasis:names:tc:SAML:metadata:rpi" rpi:dummy-for-xmlns="" xmlns:mdui="urn:oasis:names:tc:SAML:metadata:ui" mdui:dummy-for-xmlns="" xmlns:alg="urn:oasis:names:tc:SAML:metadata:algsupport" alg:dummy-for-xmlns="" xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion" saml:dummy-for-xmlns="" xmlns:idpdisc="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol" idpdisc:dummy-for-xmlns="" xmlns:mdattr="urn:oasis:names:tc:SAML:metadata:attribute" mdattr:dummy-for-xmlns="" xmlns:init="urn:oasis:names:tc:SAML:profiles:SSO:request-init" init:dummy-for-xmlns="" version="1.0">
<!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<axsl:param name="archiveDirParameter"/>
<axsl:param name="archiveNameParameter"/>
<axsl:param name="fileNameParameter"/>
<axsl:param name="fileDirParameter"/>

<!--PHASES-->


<!--PROLOG-->
<axsl:output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" indent="yes" standalone="yes" omit-xml-declaration="no" method="xml"/>

<!--KEYS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<axsl:template mode="schematron-select-full-path" match="*">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<axsl:template mode="schematron-get-full-path" match="*">
<axsl:apply-templates mode="schematron-get-full-path" select="parent::*"/>
<axsl:text>/</axsl:text>
<axsl:choose>
<axsl:when test="namespace-uri()=''">
<axsl:value-of select="name()"/>
<axsl:variable select="1+    count(preceding-sibling::*[name()=name(current())])" name="p_1"/>
<axsl:if test="$p_1&gt;1 or following-sibling::*[name()=name(current())]">[<axsl:value-of select="$p_1"/>]</axsl:if>
</axsl:when>
<axsl:otherwise>
<axsl:text>*[local-name()='</axsl:text>
<axsl:value-of select="local-name()"/>
<axsl:text>' and namespace-uri()='</axsl:text>
<axsl:value-of select="namespace-uri()"/>
<axsl:text>']</axsl:text>
<axsl:variable select="1+   count(preceding-sibling::*[local-name()=local-name(current())])" name="p_2"/>
<axsl:if test="$p_2&gt;1 or following-sibling::*[local-name()=local-name(current())]">[<axsl:value-of select="$p_2"/>]</axsl:if>
</axsl:otherwise>
</axsl:choose>
</axsl:template>
<axsl:template mode="schematron-get-full-path" match="@*">
<axsl:text>/</axsl:text>
<axsl:choose>
<axsl:when test="namespace-uri()=''">@<axsl:value-of select="name()"/>
</axsl:when>
<axsl:otherwise>
<axsl:text>@*[local-name()='</axsl:text>
<axsl:value-of select="local-name()"/>
<axsl:text>' and namespace-uri()='</axsl:text>
<axsl:value-of select="namespace-uri()"/>
<axsl:text>']</axsl:text>
</axsl:otherwise>
</axsl:choose>
</axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<axsl:template mode="schematron-get-full-path-2" match="node() | @*">
<axsl:for-each select="ancestor-or-self::*">
<axsl:text>/</axsl:text>
<axsl:value-of select="name(.)"/>
<axsl:if test="preceding-sibling::*[name(.)=name(current())]">
<axsl:text>[</axsl:text>
<axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
<axsl:text>]</axsl:text>
</axsl:if>
</axsl:for-each>
<axsl:if test="not(self::*)">
<axsl:text/>/@<axsl:value-of select="name(.)"/>
</axsl:if>
</axsl:template>

<!--MODE: GENERATE-ID-FROM-PATH -->
<axsl:template mode="generate-id-from-path" match="/"/>
<axsl:template mode="generate-id-from-path" match="text()">
<axsl:apply-templates mode="generate-id-from-path" select="parent::*"/>
<axsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
</axsl:template>
<axsl:template mode="generate-id-from-path" match="comment()">
<axsl:apply-templates mode="generate-id-from-path" select="parent::*"/>
<axsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
</axsl:template>
<axsl:template mode="generate-id-from-path" match="processing-instruction()">
<axsl:apply-templates mode="generate-id-from-path" select="parent::*"/>
<axsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
</axsl:template>
<axsl:template mode="generate-id-from-path" match="@*">
<axsl:apply-templates mode="generate-id-from-path" select="parent::*"/>
<axsl:value-of select="concat('.@', name())"/>
</axsl:template>
<axsl:template priority="-0.5" mode="generate-id-from-path" match="*">
<axsl:apply-templates mode="generate-id-from-path" select="parent::*"/>
<axsl:text>.</axsl:text>
<axsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
</axsl:template>
<!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<axsl:template mode="schematron-get-full-path-3" match="node() | @*">
<axsl:for-each select="ancestor-or-self::*">
<axsl:text>/</axsl:text>
<axsl:value-of select="name(.)"/>
<axsl:if test="parent::*">
<axsl:text>[</axsl:text>
<axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
<axsl:text>]</axsl:text>
</axsl:if>
</axsl:for-each>
<axsl:if test="not(self::*)">
<axsl:text/>/@<axsl:value-of select="name(.)"/>
</axsl:if>
</axsl:template>

<!--MODE: GENERATE-ID-2 -->
<axsl:template mode="generate-id-2" match="/">U</axsl:template>
<axsl:template priority="2" mode="generate-id-2" match="*">
<axsl:text>U</axsl:text>
<axsl:number count="*" level="multiple"/>
</axsl:template>
<axsl:template mode="generate-id-2" match="node()">
<axsl:text>U.</axsl:text>
<axsl:number count="*" level="multiple"/>
<axsl:text>n</axsl:text>
<axsl:number count="node()"/>
</axsl:template>
<axsl:template mode="generate-id-2" match="@*">
<axsl:text>U.</axsl:text>
<axsl:number count="*" level="multiple"/>
<axsl:text>_</axsl:text>
<axsl:value-of select="string-length(local-name(.))"/>
<axsl:text>_</axsl:text>
<axsl:value-of select="translate(name(),':','.')"/>
</axsl:template>
<!--Strip characters-->
<axsl:template priority="-1" match="text()"/>

<!--SCHEMA METADATA-->
<axsl:template match="/">
<svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" schemaVersion="ISO19757-3" title="">
<axsl:comment>
<axsl:value-of select="$archiveDirParameter"/>   
		 <axsl:value-of select="$archiveNameParameter"/>  
		 <axsl:value-of select="$fileNameParameter"/>  
		 <axsl:value-of select="$fileDirParameter"/>
</axsl:comment>
<svrl:ns-prefix-in-attribute-values prefix="md" uri="urn:oasis:names:tc:SAML:2.0:metadata"/>
<svrl:ns-prefix-in-attribute-values prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>
<svrl:ns-prefix-in-attribute-values prefix="rpi" uri="urn:oasis:names:tc:SAML:metadata:rpi"/>
<svrl:ns-prefix-in-attribute-values prefix="mdui" uri="urn:oasis:names:tc:SAML:metadata:ui"/>
<svrl:ns-prefix-in-attribute-values prefix="alg" uri="urn:oasis:names:tc:SAML:metadata:algsupport"/>
<svrl:ns-prefix-in-attribute-values prefix="saml" uri="urn:oasis:names:tc:SAML:2.0:assertion"/>
<svrl:ns-prefix-in-attribute-values prefix="idpdisc" uri="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol"/>
<svrl:ns-prefix-in-attribute-values prefix="mdattr" uri="urn:oasis:names:tc:SAML:metadata:attribute"/>
<svrl:ns-prefix-in-attribute-values prefix="init" uri="urn:oasis:names:tc:SAML:profiles:SSO:request-init"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 1</axsl:attribute>
<axsl:attribute name="name">Rule 1</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">rule 2</axsl:attribute>
<axsl:attribute name="name">rule 2</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 3</axsl:attribute>
<axsl:attribute name="name">Rule 3</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 4</axsl:attribute>
<axsl:attribute name="name">Rule 4</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 5</axsl:attribute>
<axsl:attribute name="name">Rule 5</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 6</axsl:attribute>
<axsl:attribute name="name">Rule 6</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 7</axsl:attribute>
<axsl:attribute name="name">Rule 7</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Entity rules</axsl:attribute>
<axsl:attribute name="name">Entity rules</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">single sign on</axsl:attribute>
<axsl:attribute name="name">single sign on</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 10</axsl:attribute>
<axsl:attribute name="name">Rule 10</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 11</axsl:attribute>
<axsl:attribute name="name">Rule 11</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 12</axsl:attribute>
<axsl:attribute name="name">Rule 12</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 13</axsl:attribute>
<axsl:attribute name="name">Rule 13</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 14</axsl:attribute>
<axsl:attribute name="name">Rule 14</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 15</axsl:attribute>
<axsl:attribute name="name">Rule 15</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 16</axsl:attribute>
<axsl:attribute name="name">Rule 16</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 17</axsl:attribute>
<axsl:attribute name="name">Rule 17</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 18</axsl:attribute>
<axsl:attribute name="name">Rule 18</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 19</axsl:attribute>
<axsl:attribute name="name">Rule 19</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 20</axsl:attribute>
<axsl:attribute name="name">Rule 20</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 21</axsl:attribute>
<axsl:attribute name="name">Rule 21</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 22</axsl:attribute>
<axsl:attribute name="name">Rule 22</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 23</axsl:attribute>
<axsl:attribute name="name">Rule 23</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 24</axsl:attribute>
<axsl:attribute name="name">Rule 24</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 25</axsl:attribute>
<axsl:attribute name="name">Rule 25</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 26</axsl:attribute>
<axsl:attribute name="name">Rule 26</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 27</axsl:attribute>
<axsl:attribute name="name">Rule 27</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 28</axsl:attribute>
<axsl:attribute name="name">Rule 28</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 29</axsl:attribute>
<axsl:attribute name="name">Rule 29</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 30</axsl:attribute>
<axsl:attribute name="name">Rule 30</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
<svrl:active-pattern>
<axsl:attribute name="id">Rule 31</axsl:attribute>
<axsl:attribute name="name">Rule 31</axsl:attribute>
<axsl:apply-templates/>
</svrl:active-pattern>
<axsl:apply-templates mode="M0" select="/"/>
</svrl:schematron-output>
</axsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema"/>
<axsl:template name="bryansgeneratedtemplate" match="/">
<axsl:apply-templates mode="M10"/>
</axsl:template>
<axsl:template mode="M10" match="text()"/>
<axsl:template mode="M10" priority="1007" match="md:EntityDescriptor">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="md:EntityDescriptor"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="starts-with(@entityID,'https://')"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="starts-with(@entityID,'https://')">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (1): @entityID values must start with “https://”
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:Organization"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:Organization">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (5): EntityDescriptor should have an Organization
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:ContactPerson[normalize-space(@contactType)='support'][md:EmailAddress]"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:ContactPerson[normalize-space(@contactType)='support'][md:EmailAddress]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (6): EntityDescriptor should contain ContactPerson with a contactType of "support" and at least one EmailAddress
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:ContactPerson[normalize-space(@contactType)='technical'][md:EmailAddress]"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:ContactPerson[normalize-space(@contactType)='technical'][md:EmailAddress]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (7): EntityDescriptor should contain ContactPerson with a contactType of "technical" and at least one EmailAddress
     </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--REPORT -->
<axsl:if test="descendant::rpi:*">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::rpi:*">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (8): EntityDescriptor created by the entity operator must not contain elements from the mdrpi namespace (urn:oasis:names:tc:SAML:metadata:rpi)
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="string-length(@entityID) &lt; 10"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="string-length(@entityID) &lt; 10">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (31): @entityID lenght not &lt; 10”
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1006" match="md:NameIDFormat">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="md:NameIDFormat"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'                 or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient'                or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified'                or normalize-space(text()) = '' "/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent' or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient' or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified' or normalize-space(text()) = ''">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (2): NameIDFormat may contain only zero or more for following values: 
    urn:oasis:names:tc:SAML:2.0:nameid-format:persistent 
    urn:oasis:names:tc:SAML:2.0:nameid-format:transient 
    urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1005" match="md:IDPSSODescriptor">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="md:IDPSSODescriptor"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:NameIDFormat[text() != '']"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:NameIDFormat[text() != '']">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (3): Each IDPSSODescriptor should contain NameIDFormatwith one or more values  
      </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:KeyDescriptor/ds:KeyInfo/ds:X509Data/ds:X509Certificate"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:KeyDescriptor/ds:KeyInfo/ds:X509Data/ds:X509Certificate">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (4): Each IDPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)         
        </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect']"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect']">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (9): IDPSSODescriptor must contain SingleSignOnService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect“
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--REPORT -->
<axsl:if test="descendant::saml:Attribute">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::saml:Attribute">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (10): IDPSSODescriptor may contain &lt;saml2:Attribute&gt; elements; but their interpretation is not supported.
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="descendant::alg:DigestMethod"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::alg:DigestMethod">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (12): IDPSSODescriptor must contain alg:DigestMethod
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="descendant::alg:SigningMethod"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::alg:SigningMethod">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (13): IDPSSODescriptor must contain SigningMethod
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:Extensions/mdui:DiscoHints/mdui:DomainHint"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:Extensions/mdui:DiscoHints/mdui:DomainHint">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (14): IDPSSODescriptor should contain DiscoHints including mdui:DomainHint
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1004" match="md:SPSSODescriptor">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="md:SPSSODescriptor"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:NameIDFormat[text() != '']"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:NameIDFormat[text() != '']">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (3): Each SPSSODescriptor should contain NameIDFormat with one or more values
      </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="descendant::ds:X509Data/ds:X509Certificate"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::ds:X509Data/ds:X509Certificate">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (4): Each SPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)
        </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:AssertionConsumerService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST']"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:AssertionConsumerService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST']">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (11): SPSSODescriptor must contain an AssertionConsumerService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="descendant::alg:DigestMethod"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::alg:DigestMethod">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (12): SPSSODescriptor must contain alg:DigestMethod
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="descendant::alg:SigningMethod"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::alg:SigningMethod">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (13): SPSSODescriptor must contain SigningMethod
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:SingleLogoutService"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:SingleLogoutService">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (15): SPSSODescriptor should contain SingleLogoutService
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--REPORT -->
<axsl:if test="md:AttributeConsumingService">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:AttributeConsumingService">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (16): AttributeConsumingService is deprecated. Use EntityCategories instead.
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--REPORT -->
<axsl:if test="md:Extensions[not(idpdisc:DiscoveryResponse)]">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:Extensions[not(idpdisc:DiscoveryResponse)]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (17): SPSSODescriptor should include DiscoveryResponse in Extensions
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (18): SPSSODescriptor must contain EntityAttributes with an AttributeValue of http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--REPORT -->
<axsl:if test="descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text())            != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'            and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken' and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (19): SPSSODescriptor EntityAttributes are allowed to have on or more of the following attribute values: 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken, 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:Extensions/init:RequestInitiator"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:Extensions/init:RequestInitiator">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (20): SPSSODescriptor should include init:RequestInitiator
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="md:Extensions/mdui:UIInfo"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="md:Extensions/mdui:UIInfo">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (21): SPSSODescriptor should include &lt;mdui:UIInfo&gt;
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1003" match="mdui:UIInfo">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="mdui:UIInfo"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="mdui:DisplayName[string-length() &gt; 0]"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="mdui:DisplayName[string-length() &gt; 0]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (22a): UIInfo must include a non-empty DisplayName
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="mdui:Description[string-length() &gt; 0]"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="mdui:Description[string-length() &gt; 0]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (22b): UIInfo must include a non-empty Description
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="mdui:Logo[string-length() &gt; 0]"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="mdui:Logo[string-length() &gt; 0]">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (22c): UIInfo must include a non-empty Logo
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1002" match="alg:DigestMethod">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="alg:DigestMethod"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256'                     or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1'                    or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512'                    or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160' "/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256' or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1' or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512' or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160'">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (23): alg:DigestMethod element may only contain following @Algorithm values: 
    http://www.w3.org/2000/09/xmldsig#sha1 
    http://www.w3.org/2001/04/xmlenc#sha256 
    http://www.w3.org/2001/04/xmlenc#sha512 
    http://www.w3.org/2001/04/xmlenc#ripemd160
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1'"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1'">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (25): DigestMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#sha1
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1001" match="alg:SigningMethod">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="alg:SigningMethod"/>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test=" @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'                      or @Algorithm='http://www.w3.org/2000/09/xmldsig#rsa-sha1'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha384'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384'                     or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512'     "/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="@Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256' or @Algorithm='http://www.w3.org/2000/09/xmldsig#rsa-sha1' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha384' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512'">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (24): Each alg:SigningMethod may only contain following @Algorithm values: 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha256 
    http://www.w3.org/2000/09/xmldsig#rsa-sha1 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha384 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha512 
    http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256 
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384 
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512    
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#rsa-sha1'"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#rsa-sha1'">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (26): SigningMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#rsa-sha1
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>

		<!--REPORT -->
<axsl:if test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#rsa') and @MinKeySize &lt; 2048">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#rsa') and @MinKeySize &lt; 2048">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (27): MinKeySize must be greater or equal to 2048 if Algorithm starts with "http://www.w3.org/2001/04/xmldsig-more#rsa"
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--REPORT -->
<axsl:if test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (28): MinKeySize must be greater or equal to 256 if Algorithm starts with "http://www.w3.org/2001/04/xmldsig-more#ecdsa"
    </svrl:text>
</svrl:successful-report>
</axsl:if>

		<!--ASSERT -->
<axsl:choose>
<axsl:when test="@MaxKeySize"/>
<axsl:otherwise>
<svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="@MaxKeySize">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Error (29): alg:SigningMethod must have an attribute MaxKeySize
    </svrl:text>
</svrl:failed-assert>
</axsl:otherwise>
</axsl:choose>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
<axsl:template mode="M10" priority="1000" match="md:AssertionConsumerService">
<svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" context="md:AssertionConsumerService"/>

		<!--REPORT -->
<axsl:if test="normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact'">
<svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" test="normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact'">
<axsl:attribute name="location">
<axsl:apply-templates mode="schematron-get-full-path" select="."/>
</axsl:attribute>
<svrl:text>
Warning (30): AssertionConsumerService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact" is deprecated
    </svrl:text>
</svrl:successful-report>
</axsl:if>
<axsl:apply-templates mode="M10" select="*|comment()|processing-instruction()"/>
</axsl:template>
</axsl:stylesheet>
