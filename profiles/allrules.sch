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
 
        <iso:include href="single_schematron_schemas/rule1E.sch" />
        <iso:include href="single_schematron_schemas/rule2E.sch" />
        <iso:include href="single_schematron_schemas/rule3W.sch" />
        <iso:include href="single_schematron_schemas/rule4E.sch" />
        <iso:include href="single_schematron_schemas/rule5W.sch" />
        <iso:include href="single_schematron_schemas/rule6W.sch" />
        <iso:include href="single_schematron_schemas/rule7W.sch" />
        <iso:include href="single_schematron_schemas/rule8E.sch" />
        <iso:include href="single_schematron_schemas/rule9E.sch" />

        <iso:include href="single_schematron_schemas/rule10W.sch" />
        <iso:include href="single_schematron_schemas/rule11E.sch" />
        <iso:include href="single_schematron_schemas/rule12E.sch" />
        <iso:include href="single_schematron_schemas/rule13E.sch" />
        <iso:include href="single_schematron_schemas/rule14E.sch" />
        <iso:include href="single_schematron_schemas/rule15W.sch" />
        <iso:include href="single_schematron_schemas/rule16W.sch" />
        <iso:include href="single_schematron_schemas/rule17W.sch" />
        <iso:include href="single_schematron_schemas/rule18E.sch" />
        <iso:include href="single_schematron_schemas/rule19W.sch" />

        <iso:include href="single_schematron_schemas/rule20W.sch" />
        <iso:include href="single_schematron_schemas/rule21W.sch" />
        <iso:include href="single_schematron_schemas/rule22E.sch" />
        <iso:include href="single_schematron_schemas/rule23E.sch" />
        <iso:include href="single_schematron_schemas/rule24E.sch" />
        <iso:include href="single_schematron_schemas/rule25W.sch" />
        <iso:include href="single_schematron_schemas/rule26W.sch" />
        <iso:include href="single_schematron_schemas/rule27E.sch" />
        <iso:include href="single_schematron_schemas/rule28E.sch" />
        <iso:include href="single_schematron_schemas/rule29E.sch" />
        <iso:include href="single_schematron_schemas/rule30W.sch" />

        <iso:include href="single_schematron_schemas/rule31W.sch" />
        <iso:include href="single_schematron_schemas/rule32E.sch" />
        <iso:include href="single_schematron_schemas/rule33W.sch" />
        <iso:include href="single_schematron_schemas/rule34W.sch" />
        <iso:include href="single_schematron_schemas/rule35E.sch" />
        <iso:include href="single_schematron_schemas/rule36E.sch" />
    
    </iso:include-set>
</iso:schema>