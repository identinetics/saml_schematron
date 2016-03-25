<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 24-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="alg:SigningMethod" priority="1000" mode="M0">

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
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (@Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256' or @Algorithm='http://www.w3.org/2000/09/xmldsig#rsa-sha1' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha384' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384' or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
