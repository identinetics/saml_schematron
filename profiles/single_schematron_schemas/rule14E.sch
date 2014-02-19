<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 14" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:Extensions/mdui:DiscoHints/mdui:DomainHint">
Warning (14): IDPSSODescriptor should contain DiscoHints including mdui:DomainHint
    </iso:assert>
  </iso:rule>
</iso:pattern>
