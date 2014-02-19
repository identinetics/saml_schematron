<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 22" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="mdui:UIInfo">
    <iso:assert test="mdui:DisplayName[string-length() &gt; 0]">
Error (22a): UIInfo must include a non-empty DisplayName
    </iso:assert>
    <iso:assert test="mdui:Description[string-length() &gt; 0]">
Error (22b): UIInfo must include a non-empty Description
    </iso:assert>
    <iso:assert test="mdui:Logo[string-length() &gt; 0]">
Error (22c): UIInfo must include a non-empty Logo URL
    </iso:assert>
  </iso:rule>
</iso:pattern>
