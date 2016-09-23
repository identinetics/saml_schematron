<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule30_Artifact" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:AssertionConsumerService">
    <iso:report test="normalize-space(@Binding)='urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact'">
"rule30W": { "Severity": "Warning",
         "Message": "AssertionConsumerService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact is deprecated\"",
    </iso:report>
  </iso:rule>
</iso:pattern>
