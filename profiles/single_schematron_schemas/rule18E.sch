<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 18" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]">
Error (18): SPSSODescriptor must contain EntityAttributes with an AttributeValue of http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken
    </iso:assert>
  </iso:rule>
</iso:pattern>
