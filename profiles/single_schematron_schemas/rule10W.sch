<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 10" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:IDPSSODescriptor">                                  
    <iso:report test="descendant::saml:Attribute">
Warning (10): IDPSSODescriptor may contain &lt;saml2:Attribute&gt; elements; but their interpretation is not supported.
    </iso:report>
  </iso:rule>
</iso:pattern>
