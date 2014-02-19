<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 19" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:report 
          test="descendant::mdattr:EntityAttributes//saml:AttributeValue[normalize-space(text()) 
          != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken' 
          and normalize-space(text()) != 'http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge']">
Warning (19): SPSSODescriptor EntityAttributes are allowed to have on or more of the following attribute values: 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken, 
http://www.ref.gv.at/ns/names/agiz/pvp/egovtoken-charge
    </iso:report>
  </iso:rule>
</iso:pattern>
 