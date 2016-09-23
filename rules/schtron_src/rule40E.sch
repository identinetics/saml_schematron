<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule40_Enc_PVP" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="md:EncryptionMethod">
    <iso:assert test="normalize-space(text())='http://www.w3.org/2001/04/xmlenc#aes128-cbc'
                   or normalize-space(text())='http://www.w3.org/2001/04/xmlenc#aes256-cbc'
                   or normalize-space(text())='http://www.w3.org/2009/xmlenc11#aes128-gcm'
                   or normalize-space(text())='http://www.w3.org/2009/xmlenc11#aes256-gcm'
                   or normalize-space(text())='http://www.w3.org/2001/04/xmlenc#rsa-oaep-mgf1p'
                   or normalize-space(text())='http://www.w3.org/2009/xmlenc11#ECDH-ES' ">
"rule40E": { "Severity": "Error",
         "Message": "md:EncryptionMethod element may only contain following  values:\n    http://www.w3.org/2001/04/xmlenc#aes128-cbc\n    http://www.w3.org/2001/04/xmlenc#aes256-cbc\n    http://www.w3.org/2009/xmlenc11#aes128-gcm\n    http://www.w3.org/2009/xmlenc11#aes256-gcm\n    http://www.w3.org/2001/04/xmlenc#rsa-oaep-mgf1p\n    http://www.w3.org/2009/xmlenc11#ECDH-ES",
    </iso:assert>
  </iso:rule>
</iso:pattern>
