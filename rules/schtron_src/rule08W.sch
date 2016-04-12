<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule08_MDRPI" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EntityDescriptor">                                  
    <iso:report test="descendant::rpi:*">
Warning (08): EntityDescriptor created by the entity operator should not contain elements from the mdrpi namespace (urn:oasis:names:tc:SAML:metadata:rpi); this is reserved for metadata publishers.
    </iso:report>   
  </iso:rule>
</iso:pattern>
