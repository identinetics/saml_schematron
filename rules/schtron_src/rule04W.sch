<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule04"  xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
   <iso:rule context="//md:SPSSODescriptor">
      <iso:assert 
         test="md:NameIDFormat[text() != '']">
"rule04W": { "Severity": "Warning",
         "Message": "Each SPSSODescriptor should contain NameIDFormat with one or more values",
      </iso:assert>  
   </iso:rule>
</iso:pattern>
