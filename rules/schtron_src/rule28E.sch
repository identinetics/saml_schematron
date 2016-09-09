<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule28_ECDSAkeysize" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:SigningMethod">
    <iso:report test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#ecdsa') and number(@MinKeySize) &lt; 256">
"28": { "Severity": "Error",
         "Message": "MinKeySize must be greater or equal to 256 if Algorithm starts with http://www.w3.org/2001/04/xmldsig-more#ecdsa",
    </iso:report>
  </iso:rule>
</iso:pattern>
