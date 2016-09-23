<?xml version="1.0" encoding="utf-8"?>
<iso:pattern id="Rule29_maxkeysize" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
  <iso:rule context="alg:SigningMethod">
    <iso:assert test="@MaxKeySize">
"rule29W": { "Severity": "Warning",
         "Message": "alg:SigningMethod must have an attribute MaxKeySize",
    </iso:assert>
  </iso:rule>
</iso:pattern>
