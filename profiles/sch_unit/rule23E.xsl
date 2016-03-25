<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 23-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="alg:DigestMethod" priority="1000" mode="M0">

		<!--ASSERT -->
<axsl:choose><axsl:when test="normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256'                     or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1'                    or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512'                    or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160' "/><axsl:otherwise><axsl:message>
Error (23): alg:DigestMethod element may only contain following @Algorithm values: 
    http://www.w3.org/2000/09/xmldsig#sha1 
    http://www.w3.org/2001/04/xmlenc#sha256 
    http://www.w3.org/2001/04/xmlenc#sha512 
    http://www.w3.org/2001/04/xmlenc#ripemd160
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256' or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1' or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512' or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160')</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
