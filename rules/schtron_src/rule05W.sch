<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule05" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:assert 
         test="md:Organization">
"rule05W": { "Severity": "Warning",
         "Message": "EntityDescriptor should contain an Organization",
    </iso:assert> 
  </iso:rule>
</iso:pattern>
