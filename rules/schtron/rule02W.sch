<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="rule02" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:NameIDFormat">                                  
    <iso:assert 
         test="normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent' 
               or normalize-space(text()) = 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient'
               or normalize-space(text()) = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified'
               or normalize-space(text()) = '' ">
Warnung (02): This NameIDFormat may not be supported. Supported values for NameIDFormat are:
    urn:oasis:names:tc:SAML:2.0:nameid-format:persistent 
    urn:oasis:names:tc:SAML:2.0:nameid-format:transient 
    urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified
    </iso:assert>                
  </iso:rule>
</iso:pattern>
