<?xml version="1.0" encoding="utf-8"?>
<!--
Enforce "use" attribute in KeyDescriptor (Requirement in PVP profile)
-->

<iso:pattern id="Rule37" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
    <iso:rule context="//md:IDPSSODescriptor">
         <iso:assert test="md:KeyDescriptor[@use='signing']">
"37a": { "Severity": "Error",
         "Message": "Each IDPSSODescriptor must contain at least one KeyDescriptor with a use=\"signing\" attribute",
        </iso:assert>
    </iso:rule>

    <iso:rule context="//md:SPSSODescriptor">
         <iso:assert test="md:KeyDescriptor[@use='signing']">
"37b": { "Severity": "Error",
         "Message": "Each SPSSODescriptor must contain at least one KeyDescriptor with a use=\"signing\" attribute",
        </iso:assert>
    </iso:rule>
</iso:pattern>