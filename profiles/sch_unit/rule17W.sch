<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 17" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:report test="not(md:Extensions) or 
                      md:Extensions[not(idpdisc:DiscoveryResponse)]">
Warning (17): SPSSODescriptor should include Extensions/DiscoveryResponse
    </iso:report>
  </iso:rule>
</iso:pattern>  
