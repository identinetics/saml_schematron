<?xml version="1.0" standalone="yes"?>


<!--PATTERN rule 2-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="md:NameIDFormat" priority="1000" mode="M0">

		<!--ASSERT -->
<axsl:choose><axsl:when test="normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'                 or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient'                or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified'                or normalize-space(text()) = '' "/><axsl:otherwise><axsl:message>
Warnung (02): This NameIDFormat may not be supported. Supported values for NameIDFormat are:
    urn:oasis:names:tc:SAML:2.0:nameid-format:persistent 
    urn:oasis:names:tc:SAML:2.0:nameid-format:transient 
    urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent' or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient' or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified' or normalize-space(text()) = '')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
