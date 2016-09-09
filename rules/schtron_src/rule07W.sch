<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule07" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
   <iso:rule context="md:EntityDescriptor">                                  
     <iso:assert 
         test="md:ContactPerson[normalize-space(@contactType)='technical'][md:EmailAddress]">
"07": { "Severity": "Warning",
         "Message": "EntityDescriptor should contain ContactPerson with a contactType of \"technical\" and at least one EmailAddress",
     </iso:assert>
   </iso:rule>
</iso:pattern>
