<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule12_ALGDIGEST" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="//md:IDPSSODescriptor">                                  
    <iso:assert test="descendant::alg:DigestMethod">
"12a": { "Severity": "Error",
         "Message": "IDPSSODescriptor must contain alg:DigestMethod",
    </iso:assert> 
  </iso:rule>
        
  <iso:rule context="//md:SPSSODescriptor">                                  
    <iso:assert test="descendant::alg:DigestMethod">
"12b": { "Severity": "Error",
         "Message": "SPSSODescriptor must contain alg:DigestMethod",
    </iso:assert>
  </iso:rule>
</iso:pattern>
