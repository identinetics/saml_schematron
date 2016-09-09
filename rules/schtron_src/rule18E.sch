<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule18_EA" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken']]">
"18a": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken)",
    </iso:report>
  </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']]">
"18b": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge)",
    </iso:report>
  </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.geant.net/uri/dataprotection-code-of-conduct/v1']]">
"18c": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.geant.net/uri/dataprotection-code-of-conduct/v1)",
    </iso:report>
  </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/research-and-education']]">
"18d": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.swamid.se/category/research-and-education)",
    </iso:report>
  </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://www.swamid.se/category/sfs-1993-1153']]">
"18e": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://www.swamid.se/category/sfs-1993-1153)",
    </iso:report>
  </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://refeds.org/category/research-and-scholarship']]">
"18f": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://refeds.org/category/research-and-scholarship)",
    </iso:report>
  </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">
    <iso:report test="descendant::mdattr:EntityAttributes[saml:Attribute[normalize-space(saml:AttributeValue)='http://id.incommon.org/category/research-and-scholarship']]">
"18g": { "Severity": "Error",
         "Message": "EntityAttributes containing an EntityCategory need to be direct descendants of EntitDescriptor (found http://id.incommon.org/category/research-and-scholarship)",
    </iso:report>
  </iso:rule>
</iso:pattern>
