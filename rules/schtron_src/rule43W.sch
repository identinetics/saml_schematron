<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule43" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:assert test="translate(@entityID, ' &#9;&#10;&#13;', '') = @entityID">
"rule43W": { "Severity": "Warning",
         "Message": "@entityID values should not containe whitespace (some implementations may not normalize this)",
    </iso:assert>  
  </iso:rule>     
</iso:pattern>
