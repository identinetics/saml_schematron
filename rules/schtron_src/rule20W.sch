<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule20_RIP" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="md:Extensions/init:RequestInitiator">
"rule20W": { "Severity": "Warning",
         "Message": "SPSSODescriptor should include init:RequestInitiator",
    </iso:assert>
  </iso:rule>
</iso:pattern>
