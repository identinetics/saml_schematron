<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule35_SAML20" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="normalize-space(@protocolSupportEnumeration)='urn:oasis:names:tc:SAML:2.0:protocol'">
Error (35): protocolSupportEnumeration may contain only "urn:oasis:names:tc:SAML:2.0:protocol"
    </iso:assert>  
  </iso:rule>     
</iso:pattern>
