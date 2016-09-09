<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule04" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
    <iso:rule context="//md:IDPSSODescriptor">                                  
         <iso:assert test="md:KeyDescriptor[@use='signing' or not(@use)]/ds:KeyInfo/ds:X509Data/ds:X509Certificate">
"04a": { "Severity": "Error",
         "Message": "Each IDPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)",
        </iso:assert> 
    </iso:rule>
        
    <iso:rule context="//md:SPSSODescriptor">                                  
        <iso:assert test="descendant::ds:X509Data/ds:X509Certificate">
"04b": { "Severity": "Error",
         "Message": "Each SPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)",
        </iso:assert>          
    </iso:rule>
</iso:pattern>