<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule13_ALGSIGN" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="descendant::alg:SigningMethod">
Error (13): IDPSSODescriptor must contain SigningMethod
    </iso:assert> 
  </iso:rule>
        
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="descendant::alg:SigningMethod">
Error (13): SPSSODescriptor must contain SigningMethod
    </iso:assert>
  </iso:rule>
</iso:pattern>
