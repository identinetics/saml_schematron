<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule26_RSASHA1" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:SigningMethod">
    <iso:assert test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#rsa-sha1'">
"rule26W": { "Severity": "Warning",
         "Message": "SigningMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#rsa-sha1",
    </iso:assert>
  </iso:rule>
</iso:pattern>
