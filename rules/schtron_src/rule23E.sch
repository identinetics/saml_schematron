<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule23_ALGDigest" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:DigestMethod">
    <iso:assert test="normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256'
                   or normalize-space(@alg:Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256'
                   or normalize-space(@Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1'
                   or normalize-space(@alg:Algorithm)='http://www.w3.org/2000/09/xmldsig#sha1'
                   or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512'
                   or normalize-space(@alg:Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512'
                   or normalize-space(@Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160'
                   or normalize-space(@alg:Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160' ">
"rule23E": { "Severity": "Error",
         "Message": "alg:DigestMethod element may only contain following @Algorithm values:\n    http://www.w3.org/2000/09/xmldsig#sha1\n    http://www.w3.org/2001/04/xmlenc#sha256\n    http://www.w3.org/2001/04/xmlenc#sha512\n    http://www.w3.org/2001/04/xmlenc#ripemd160",
    </iso:assert>
  </iso:rule>
</iso:pattern>
