<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="rule02" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:NameIDFormat">                                  
    <iso:assert 
         test="normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent' 
               or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient'
               or normalize-space(text()) = '' ">
"02": { "Severity": "Warning",
         "Message": "This NameIDFormat may not be supported. Supported values for NameIDFormat are:\n    urn:oasis:names:tc:SAML:2.0:nameid-format:persistent\n    urn:oasis:names:tc:SAML:2.0:nameid-format:transient",
    </iso:assert>                
  </iso:rule>
</iso:pattern>
