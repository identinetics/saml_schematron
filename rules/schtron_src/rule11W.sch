<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule11_ACS_HTTPPOST" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">
    <iso:assert test="md:AssertionConsumerService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST']">
"rule11W": { "Severity": "Warning",
         "Message": "SPSSODescriptor should contain an AssertionConsumerService with Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\"",
    </iso:assert>
  </iso:rule>
</iso:pattern>
