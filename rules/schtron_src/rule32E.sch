<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule32_UUInfo" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:Extensions/mdui:UIInfo">
Error (32): IDPSSODescriptor  must contain a mdui:UIInfo element
    </iso:assert>
 </iso:rule>
</iso:pattern>
