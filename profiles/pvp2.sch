<?xml version="1.0" encoding="utf-8"?>

<!--
  Selection of rules for PVP2-S-Profile (AT government SAML profile, a profile of Kantara eGov profile)
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

        <iso:include href="sch_unit/reportEntity.sch" />

        <iso:include href="sch_unit/rule1E.sch" />
        <iso:include href="sch_unit/rule2W.sch" />
        <iso:include href="sch_unit/rule3W.sch" />
        <!-- rule 4E replaced by 42E -->
        <iso:include href="sch_unit/rule5W.sch" />
        <iso:include href="sch_unit/rule6W.sch" />
        <iso:include href="sch_unit/rule7W.sch" />
        <iso:include href="sch_unit/rule8E.sch" />
        <iso:include href="sch_unit/rule9E.sch" />

        <iso:include href="sch_unit/rule10W.sch" />
        <iso:include href="sch_unit/rule11W.sch" />
        <iso:include href="sch_unit/rule12E.sch" />
        <iso:include href="sch_unit/rule13E.sch" />
        <iso:include href="sch_unit/rule15W.sch" />
        <iso:include href="sch_unit/rule16W.sch" />
        <iso:include href="sch_unit/rule17W.sch" />
        <iso:include href="sch_unit/rule18E.sch" />
        <iso:include href="sch_unit/rule19W.sch" />

        <iso:include href="sch_unit/rule20W.sch" />
        <iso:include href="sch_unit/rule21W.sch" />
        <iso:include href="sch_unit/rule22E.sch" />
        <iso:include href="sch_unit/rule23E.sch" />
        <iso:include href="sch_unit/rule24E.sch" />
        <iso:include href="sch_unit/rule25W.sch" />
        <iso:include href="sch_unit/rule26W.sch" />
        <iso:include href="sch_unit/rule27E.sch" />
        <iso:include href="sch_unit/rule28E.sch" />
        <iso:include href="sch_unit/rule29E.sch" />
        <iso:include href="sch_unit/rule30W.sch" />

        <iso:include href="sch_unit/rule31W.sch" />
        <iso:include href="sch_unit/rule32E.sch" />
        <iso:include href="sch_unit/rule33W.sch" />
        <iso:include href="sch_unit/rule34W.sch" />
        <iso:include href="sch_unit/rule35E.sch" />
        <iso:include href="sch_unit/rule36E.sch" />

        <iso:include href="sch_unit/rule37E.sch" />
        <iso:include href="sch_unit/rule38E.sch" />
        <iso:include href="sch_unit/rule39E.sch" />
        <iso:include href="sch_unit/rule40E.sch" />
        <iso:include href="sch_unit/rule41E.sch" />
        <iso:include href="sch_unit/rule42E.sch" />
        <iso:include href="sch_unit/rule43E.sch" />
        <!--iso:include href="sch_unit/rule44E.sch" not mandatory on deployment level/-->

    
    </iso:include-set>
</iso:schema>