<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule16_ACS_depr" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:EntityDescriptor">
    <iso:report test="md:SPSSODescriptor/md:AttributeConsumingService and //saml:AttributeValue[normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'
                                 or normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
"16": { "Severity": "Warning",
         "Message": "AttributeConsumingService is deprecated if EntityCategory has an fixed set of RequestedAttributes.",
    </iso:report>
  </iso:rule>
</iso:pattern>
