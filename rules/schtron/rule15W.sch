<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule15_SSOService" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="md:SingleLogoutService">
Warning (15): IDPSSODescriptor should contain SingleLogoutService
    </iso:assert>
 </iso:rule>
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="md:SingleLogoutService">
Warning (15): SPSSODescriptor should contain SingleLogoutService
    </iso:assert>
 </iso:rule>
</iso:pattern>
