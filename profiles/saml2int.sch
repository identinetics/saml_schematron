<?xml version="1.0" encoding="utf-8"?>

<!--
  Selection of rules for SAML2INT.
  Status: incomplete 
  Rainer Hoerbe, 2014-02-19
-->

<iso:schema
        xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:dp="http://www.dpawson.co.uk/ns#"
        queryBinding='xslt'
        schemaVersion='ISO19757-3'>
    <iso:title></iso:title>
    <iso:ns prefix='md' uri='urn:oasis:names:tc:SAML:2.0:metadata'/>
    <iso:ns prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>
    <iso:ns prefix="rpi" uri="urn:oasis:names:tc:SAML:metadata:rpi"/>
    <iso:ns prefix="mdui" uri="urn:oasis:names:tc:SAML:metadata:ui"/>

    <iso:ns prefix="alg" uri="urn:oasis:names:tc:SAML:metadata:algsupport"/>
    <iso:ns prefix="saml" uri="urn:oasis:names:tc:SAML:2.0:assertion"/>
    <iso:ns prefix="idpdisc" uri="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol"/>
    <iso:ns prefix="mdattr" uri="urn:oasis:names:tc:SAML:metadata:attribute"/>
    <iso:ns prefix="init" uri="urn:oasis:names:tc:SAML:profiles:SSO:request-init"/>
    <iso:include-set>

        <iso:include href="single_schematron_schemas/reportEntity.sch" />

        <!-- CAVEAT: changing the rule set requires adaptaion of Makefile -->
        <iso:include href="single_schematron_schemas/rule4E.sch"/>
        <iso:include href="single_schematron_schemas/rule6W.sch"/>
        <iso:include href="single_schematron_schemas/rule7W.sch"/>
    </iso:include-set>
</iso:schema>