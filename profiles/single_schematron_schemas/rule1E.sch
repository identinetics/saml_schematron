<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 1" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:assert test="starts-with(@entityID,'https://')">
Error (01): @entityID values must start with “https://”
    </iso:assert>  
  </iso:rule>     
</iso:pattern>
