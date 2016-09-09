<?xml version="1.0" encoding="utf-8"?> 
<iso:pattern id="Rule38_ALGSign" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:SigningMethod">
    <iso:assert test=" @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha256' 
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#rsa-sha512'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256'
                    or @Algorithm='http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512'
    ">
"38": { "Severity": "Error",
         "Message": "Each alg:SigningMethod may only contain following @Algorithm values:\n    http://www.w3.org/2001/04/xmldsig-more#rsa-sha256\n    http://www.w3.org/2001/04/xmldsig-more#rsa-sha512\n    http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256\nhttp://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512",
    </iso:assert>
  </iso:rule>
</iso:pattern>
