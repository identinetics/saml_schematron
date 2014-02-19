<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 12" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="descendant::alg:DigestMethod">
Error (12): IDPSSODescriptor must contain alg:DigestMethod
    </iso:assert> 
  </iso:rule>
        
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="descendant::alg:DigestMethod">
Error (12): SPSSODescriptor must contain alg:DigestMethod
    </iso:assert>
  </iso:rule>
</iso:pattern>
