<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule15_SSOService" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
    <iso:assert test="md:SingleLogoutService">
"rule15W": { "Severity": "Warning",
         "Message": "IDPSSODescriptor/SPSSODescriptor should contain SingleLogoutService",
    </iso:assert>
 </iso:rule>
</iso:pattern>
