<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule03"  xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
   <iso:rule context="//md:IDPSSODescriptor">                                  
      <iso:assert 
         test="md:NameIDFormat[text() != '']">
"03a": { "Severity": "Warning",
         "Message": "Each IDPSSODescriptor should contain NameIDFormat with one or more values",
      </iso:assert>   
   </iso:rule>
        
   <iso:rule context="//md:SPSSODescriptor">                                  
      <iso:assert 
         test="md:NameIDFormat[text() != '']">
"03b": { "Severity": "Warning",
         "Message": "Each SPSSODescriptor should contain NameIDFormat with one or more values",
      </iso:assert>  
   </iso:rule>
</iso:pattern>
