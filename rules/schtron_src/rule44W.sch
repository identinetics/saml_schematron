<?xml version="1.0" encoding="utf-8"?>
<!--
  Test if an SPSSODescriptor has an EntityCategory in the PVP2 profile (TODO: refactor test for !IDPSSODescriptor to SPSSODescriptor)
-->
<iso:pattern id="Rule44" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:EntityDescriptor">
    <iso:assert
          test="md:Extensions/mdattr:EntityAttributes/saml:Attribute/saml:AttributeValue[normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'] or
                md:Extensions/mdattr:EntityAttributes/saml:Attribute/saml:AttributeValue[normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge'] or
                md:IDPSSODescriptor">
"rule44W": { "Severity": "Warning",
         "Message": "EntityDescriptor should contain an EntityCategory of this list:\n  http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken,\n  http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge",
    </iso:assert>
  </iso:rule>
</iso:pattern>
