<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 11" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">
    <iso:assert test="md:AssertionConsumerService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST']">
Error (11): SPSSODescriptor must contain an AssertionConsumerService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
    </iso:assert>
  </iso:rule>
</iso:pattern>