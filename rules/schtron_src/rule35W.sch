<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule35_SAML20" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="normalize-space(@protocolSupportEnumeration)='urn:oasis:names:tc:SAML:2.0:protocol'">
"35": { "Severity": "Warning",
         "Message": "protocolSupportEnumeration should contain only \"urn:oasis:names:tc:SAML:2.0:protocol\" (-> remove support for legacy protocols)",
    </iso:assert>  
  </iso:rule>     
</iso:pattern>
