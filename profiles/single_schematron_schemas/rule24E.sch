<?xml version="1.0" encoding="utf-8"?> 
<iso:pattern id="Rule 24" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:SigningMethod">
    <iso:assert test=" @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256' 
                    or @Algorithm='http://www.w3.org/2000/09/xmldsig#rsa-sha1'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha384'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512'
    ">
Error (24): Each alg:SigningMethod may only contain following @Algorithm values: 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha256 
    http://www.w3.org/2000/09/xmldsig#rsa-sha1 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha384 
    http://www.w3.org/2001/04/xmldsig-more#rsa-sha512 
    http://www.w3.org/2001/04/xmldsig-more#rsa-ripemd160
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256 
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384 
    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512    
    </iso:assert>
  </iso:rule>
</iso:pattern>
