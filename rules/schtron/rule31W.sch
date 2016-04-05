<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule31_entityIDlen" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:assert test="string-length(@entityID) &lt; 81">
Warning (31): @entityID length should not exceed 80 characters”
    </iso:assert>  
  </iso:rule>     
</iso:pattern>
