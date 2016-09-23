<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule34_ALGsign" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
    <iso:assert test="md:Extensions/alg:SigningMethod">
"rule34W": { "Severity": "Warning",
         "Message": "IDPSSODescriptor/SPSSODescriptor should contain alg:SigningMethod",
    </iso:assert>
 </iso:rule>
</iso:pattern>
