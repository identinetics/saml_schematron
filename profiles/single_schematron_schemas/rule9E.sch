<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="single sign on" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:SingleSignOnService">
Error (09): IDPSSODescriptor does not contain a SingleSignOnService“
    </iso:assert>
  </iso:rule>
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:SingleSignOnService[normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect']">
Error (09): IDPSSODescriptor must contain a SingleSignOnService with Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect“
    </iso:assert>
  </iso:rule>
</iso:pattern>