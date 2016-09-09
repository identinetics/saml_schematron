<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule19_EAval" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:EntityDescriptor/md:Extensions/mdattr:EntityAttributes/saml:Attribute">
    <iso:assert
          test="saml:AttributeValue[normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'
                                 or normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
"19": { "Severity": "Warning",
         "Message": "EntityCategories should be restricted to these values:\n  http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken,\n  http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge",
    </iso:assert>
  </iso:rule>
</iso:pattern>


<!--          test="//mdattr:EntityAttributes/saml:Attribute/saml:AttributeValue[
                    normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'
                and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
                 or normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge'
  <iso:rule context="//md:EntityDescriptor/md:Extensions/mdattr:EntityAttributes/saml:Attribute">
-->