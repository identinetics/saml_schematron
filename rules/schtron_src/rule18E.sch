<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule18_EntityCat" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.geant.net/uri/dataprotection-code-of-conduct/v1']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://refeds.org/category/research-and-scholarship']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://wirtschaftsportalverbund.at/ns/ec/attributebundle-wkis']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/research-and-education']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/sfs-1993-1153']] or
                      descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://id.incommon.org/category/research-and-scholarship']]
                      ">
"rule18E": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntityDescriptor",
    </iso:report>
  </iso:rule>
</iso:pattern>
