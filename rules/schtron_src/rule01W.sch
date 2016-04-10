<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule01" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:assert test="starts-with(@entityID,'https://') or starts-with(@entityID,'http://') or starts-with(@entityID,'urn:')">
Warning (01): @entityID values should start with “http://”, “https://” or “urn:”
    </iso:assert>  
  </iso:rule>     
</iso:pattern>
