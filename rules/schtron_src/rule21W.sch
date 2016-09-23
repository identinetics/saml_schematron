<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule21_UUInfo" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="md:Extensions/mdui:UIInfo">
"rule21W": { "Severity": "Warning",
         "Message": "SPSSODescriptor should include a mdui:UIInfo element",
    </iso:assert>
  </iso:rule>
</iso:pattern>  
