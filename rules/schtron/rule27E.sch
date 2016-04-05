<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule27_RSAkeysize" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:SigningMethod">
    <iso:report test="starts-with(@Algorithm, 'http://www.w3.org/2001/04/xmldsig-more#rsa') and @MinKeySize &lt; 2048">
Error (27): MinKeySize must be greater or equal to 2048 if Algorithm starts with "http://www.w3.org/2001/04/xmldsig-more#rsa"
    </iso:report>
  </iso:rule>
</iso:pattern>
