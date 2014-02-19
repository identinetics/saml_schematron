<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule 4" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
    <iso:rule context="//md:IDPSSODescriptor">                                  
         <iso:assert test="md:KeyDescriptor/ds:KeyInfo/ds:X509Data/ds:X509Certificate">
Error (04): Each IDPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)         
        </iso:assert> 
    </iso:rule>
        
    <iso:rule context="//md:SPSSODescriptor">                                  
        <iso:assert test="descendant::ds:X509Data/ds:X509Certificate">
Error (04): Each SPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)
        </iso:assert>          
    </iso:rule>
</iso:pattern>