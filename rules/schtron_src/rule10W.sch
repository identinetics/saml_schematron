<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule10_MDATTR" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:IDPSSODescriptor">                                  
    <iso:report test="descendant::saml:Attribute">
"rule10W": { "Severity": "Warning",
         "Message": "IDPSSODescriptor contains saml2:Attribute elements; but some implementations may not understand this.",
    </iso:report>
  </iso:rule>
</iso:pattern>
