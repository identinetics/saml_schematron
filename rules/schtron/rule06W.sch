<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule06" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:assert 
         test="md:ContactPerson[normalize-space(@contactType)='support'][md:EmailAddress]">
Warning (06): EntityDescriptor should contain ContactPerson with a contactType of "support" and at least one EmailAddress
    </iso:assert>
  </iso:rule>
</iso:pattern>
