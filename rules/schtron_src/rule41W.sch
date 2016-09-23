<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule41_EAval_WPV" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:EntityDescriptor/md:Extensions/mdattr:EntityAttributes/saml:Attribute">
    <iso:assert
          test="saml:AttributeValue[normalize-space(text()) = 'http://wirtschaftsportalverbund.at/ns/ec/attributebundle-wkis']">
"rule41W": { "Severity": "Warning",
         "Message": "EntityCategories understood in this federation are:\n    http://wirtschaftsportalverbund.at/ns/ec/attributebundle-wkis",
    </iso:assert>
  </iso:rule>
</iso:pattern>


<!--          test="//mdattr:EntityAttributes/saml:Attribute/saml:AttributeValue[
                    normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken'
                and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
                 or normalize-space(text()) = 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge'
  <iso:rule context="//md:EntityDescriptor/md:Extensions/mdattr:EntityAttributes/saml:Attribute">
-->