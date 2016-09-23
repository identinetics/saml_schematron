<?xml version="1.0" encoding="utf-8"?>
<!--
Enforce "use" attribute in KeyDescriptor (Requirement in PVP profile)
-->

<iso:pattern id="Rule37" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
    <iso:rule context="//md:IDPSSODescriptor|//md:SPSSODescriptor">
         <iso:assert test="md:KeyDescriptor[@use='signing']">
"rule37E": { "Severity": "Error",
         "Message": "Each IDPSSODescriptor/SPSSODescriptor must contain at least one KeyDescriptor with a use=\"signing\" attribute",
        </iso:assert>
    </iso:rule>
</iso:pattern>