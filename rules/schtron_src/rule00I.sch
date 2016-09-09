<?xml version="1.0" encoding="utf-8"?>
<!--
Report the entityID
-->
<iso:pattern id="Rule00" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:report test="@entityID">
"00": { "Severity": "Info",
         "Message": "Validating entityID <iso:value-of select="@entityID"/>",
    </iso:report>
  </iso:rule>     
</iso:pattern>
