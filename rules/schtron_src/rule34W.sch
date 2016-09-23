<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule34_ALGsign" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:Extensions/alg:SigningMethod">
"rule34aW": { "Severity": "Warning",
         "Message": "IDPSSODescriptor should contain alg:SigningMethod",
    </iso:assert>
 </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="md:Extensions/alg:SigningMethod">
"rule34bW": { "Severity": "Warning",
         "Message": "SPSSODescriptor should contain alg:SigningMethod",
    </iso:assert>
 </iso:rule>
</iso:pattern>
