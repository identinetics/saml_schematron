<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule14_discoHint" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:Extensions/mdui:DiscoHints">
Warning (14): IDPSSODescriptor should contain discovery hints
    </iso:assert>
  </iso:rule>
</iso:pattern>
