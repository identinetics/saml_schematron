<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule39_ALGDigest_PVP" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:DigestMethod">
    <iso:assert test="normalize-space(@alg:Algorithm)='http://www.w3.org/2001/04/xmlenc#sha256'
                   or normalize-space(@alg:Algorithm)='http://www.w3.org/2001/04/xmlenc#sha512'
                   or normalize-space(@alg:Algorithm)='http://www.w3.org/2001/04/xmlenc#ripemd160' ">
Error (39): alg:DigestMethod element may only contain following @Algorithm values:
    http://www.w3.org/2001/04/xmlenc#sha256
    http://www.w3.org/2001/04/xmlenc#sha512 
    http://www.w3.org/2001/04/xmlenc#ripemd160
    </iso:assert>
  </iso:rule>
</iso:pattern>
