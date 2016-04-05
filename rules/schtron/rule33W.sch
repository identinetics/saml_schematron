<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule33_ALGdigest" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:Extensions/alg:DigestMethod">
Warning (33): IDPSSODescriptor should contain alg:DigestMethod
    </iso:assert>
 </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="md:Extensions/alg:DigestMethod">
Warning (33): SPSSODescriptor should contain alg:DigestMethod
    </iso:assert>
 </iso:rule>
</iso:pattern>
