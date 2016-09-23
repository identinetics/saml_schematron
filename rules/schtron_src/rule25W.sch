<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule25_SHA1" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="alg:DigestMethod">
    <iso:assert test="@Algorithm !='http://www.w3.org/2000/09/xmldsig#sha1'">
"rule25W": { "Severity": "Warning",
         "Message": "DigestMethod element should not contain @Algorithm value http://www.w3.org/2000/09/xmldsig#sha1",
    </iso:assert>
  </iso:rule>
</iso:pattern>
