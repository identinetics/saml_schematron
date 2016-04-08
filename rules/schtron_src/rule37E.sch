<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule37_EAval" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >

<!-- untested -->
<!-- improve selection: select only ED with SPSSODscriptor, but not if explicit attribute values are given (EC is optional with IDPs) -->
  <iso:rule context="md:EntityDescriptor">
    <iso:assert test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]">
Warning (37): EntityDescriptor should contain EntityAttributes with an AttributeValue of http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken
    </iso:assert>
  </iso:rule>
</iso:pattern>
