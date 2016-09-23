<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule60" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
    <iso:rule context="//md:IDPSSODescriptor">                                  
         <iso:assert test="md:KeyDescriptor[@use='signing' or not(@use)]/ds:KeyInfo/ds:X509Data/ds:X509Certificate">
"rule60E": { "Severity": "Error",
         "Message": "Each IDPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)",
        </iso:assert> 
    </iso:rule>
</iso:pattern>