<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule17_MDext" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:report test="not(md:Extensions) or 
                      md:Extensions[not(idpdisc:DiscoveryResponse)]">
"rule17W": { "Severity": "Warning",
         "Message": "SPSSODescriptor should include Extensions/DiscoveryResponse",
    </iso:report>
  </iso:rule>
</iso:pattern>  
