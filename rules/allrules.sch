<?xml version="1.0" encoding="utf-8"?>
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

            <iso:include href="schtron/reportEntity.sch" />

        <iso:include href="schtron/rule01E.sch" />
        <iso:include href="schtron/rule02W.sch" />
        <iso:include href="schtron/rule03W.sch" />
        <iso:include href="schtron/rule04E.sch" />
        <iso:include href="schtron/rule05W.sch" />
        <iso:include href="schtron/rule06W.sch" />
        <iso:include href="schtron/rule07W.sch" />
        <iso:include href="schtron/rule08E.sch" />
        <iso:include href="schtron/rule09E.sch" />

        <iso:include href="schtron/rule10W.sch" />
        <iso:include href="schtron/rule11W.sch" />
        <iso:include href="schtron/rule12E.sch" />
        <iso:include href="schtron/rule13E.sch" />
        <iso:include href="schtron/rule14W.sch" />
        <iso:include href="schtron/rule15W.sch" />
        <iso:include href="schtron/rule16W.sch" />
        <iso:include href="schtron/rule17W.sch" />
        <iso:include href="schtron/rule18E.sch" />
        <iso:include href="schtron/rule19W.sch" />

        <iso:include href="schtron/rule20W.sch" />
        <iso:include href="schtron/rule21W.sch" />
        <iso:include href="schtron/rule22E.sch" />
        <iso:include href="schtron/rule23E.sch" />
        <iso:include href="schtron/rule24E.sch" />
        <iso:include href="schtron/rule25W.sch" />
        <iso:include href="schtron/rule26W.sch" />
        <iso:include href="schtron/rule27E.sch" />
        <iso:include href="schtron/rule28E.sch" />
        <iso:include href="schtron/rule29E.sch" />
        <iso:include href="schtron/rule30W.sch" />

        <iso:include href="schtron/rule31W.sch" />
        <iso:include href="schtron/rule32E.sch" />
        <iso:include href="schtron/rule33W.sch" />
        <iso:include href="schtron/rule34W.sch" />
        <iso:include href="schtron/rule35E.sch" />
        <iso:include href="schtron/rule36E.sch" />
        <iso:include href="schtron/rule37E.sch" />

    </iso:include-set>
</iso:schema>