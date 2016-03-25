<?xml version="1.0" standalone="yes"?>


<!--PATTERN Rule 22-->



	<!--RULE -->

<axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xalan="http://xml.apache.org/xalan" match="mdui:UIInfo" priority="1000" mode="M0">

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
     XPATH: <axsl:call-template name="xpathgetter"/> validation rule: (mdui:Logo[string-length() &gt; 0])</axsl:message></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/></axsl:template><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="text()" priority="-1" mode="M0"/><axsl:template xmlns:axsl="http://www.w3.org/1999/XSL/Transform" match="@*|node()" priority="-2" mode="M0">
  <axsl:apply-templates select="*|comment()|processing-instruction()" mode="M0"/>
</axsl:template>
