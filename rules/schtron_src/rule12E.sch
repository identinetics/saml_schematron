<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule12_ALGDIGEST" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
    <iso:assert test="descendant::alg:DigestMethod">
"rule12E": { "Severity": "Error",
         "Message": "IDPSSODescriptor/SPSSODescriptor must contain alg:DigestMethod",
    </iso:assert> 
  </iso:rule>
</iso:pattern>
