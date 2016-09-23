<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule33_ALGdigest" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
    <iso:assert test="md:Extensions/alg:DigestMethod">
"rule33W": { "Severity": "Warning",
         "Message": "IDPSSODescriptor/SPSSODescriptor should contain alg:DigestMethod",
    </iso:assert>
 </iso:rule>
</iso:pattern>
