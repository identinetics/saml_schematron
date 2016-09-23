<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule13_ALGSIGN" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
    <iso:assert test="descendant::alg:SigningMethod">
"rule13E": { "Severity": "Error",
         "Message": "IDPSSODescriptor/SPSSODescriptor must contain SigningMethod",
    </iso:assert> 
  </iso:rule>
</iso:pattern>
