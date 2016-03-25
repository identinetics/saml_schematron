== Purpose
SAML-Schematron provides additional rules to OASIS SSTC XML schemas to validate metadata against specific 
profiles. Users may want to define their own profile-specific rule set reusing existing rules.
In addition it makes standard XSD validation easy.

== Prerequisites
XMl style sheet processor compliant to XSLT version 1, with support for the exsl:node-set extension.
These schematron rules were tested with xalan and libxslt.

xml-coreutils (only for the generation of doc/messages.txt)

== Contents

lib/base.xsl
    Extension of iso_schematron_skeleton_for_xslt1.xsl. Note that the extensions will definitely require 
    an xslt processor with support for exsl:node-set, although this is pretty universal for xslt 1.0 processors. 

lib/svrl.xsl
    Outputs svrl schematron validation report language report of validation results - a renderer for the report format 
    can be found at http://code.google.com/p/schematron/source/browse/trunk/converters/code/FromSVRL/SVRLReportRender.xsl?r=9eb8e4e286619a1dfb9c21a7e1010f07a5e73975 
    svrl.xsl can be used from the command line to output a validating stylesheet in the same way as the other xslt 
    implementations of schematron, so the step would be to
    1. run svrl.xsl as the xslt against a schematron schema and output a validating xslt. 
       java -jar xalan.jar -OUT validate/svrlval.xsl -IN profiles/allrules.sch -XSL lib/svrl.xsl
    2. after which you would run svrlval.xsl against a saml file to output the schematron validation rules language report. 
       java -jar xalan.jar -OUT reports/svrl2014_03_27_299949.xml -IN samldocument.saml -XSL validate/svrlval.xsl 

lib/message.xsl     
    Modified version of iso_schematron_message.xsl, outputting messages and xpath for the elements in the 
    instance document causing the message.
    
profiles
    Directory with saml md validation profiles. A profile is a set of extra validation rules.

profiles/allrules.sch
    Example that executes all rules contained in sch_unit

profiles/saml2int.sch
    Example that executes some rules specified by saml2int.org chapter 5

profiles/sch_unit
    Elementary schematron rules for extended SAML metadata validation
    
reports
    Output directory for validations
    
scripts
    Sample command line invocations (using bourne shell) and those called from the webapp
    
testdata
    SAML metadata instance documents that are valid to XML Schema. Some contain violations of schematron rules to be
    used for testing.
    
validate
    Style sheets generated from schematron for step 2 of the validator.

webapp
    simple stand-alon web server to upload files for xsd and schematron validation
    
xmlschema
    SAML metdata schema files modified to be read from local directory instead of URLs.

== Usage
=== Run the validator as a web application
   Build a docker container as in docker/Dockerfile, or use the Dockerfile for your custom 
   installation. It execute the simple web application in the webapp directory currently only German).
   The default configuration assumes the you connect the container's webserver to a HTTP reverse 
   proxy such as Apache/mod_proxy or nginx.
   Configure your settings in conf.sh
   Execute the container using run.sh
      
=== Run the validator using libxslt (encapsulated in make)
   1. Generate the validation style sheet from schematron rules (see Makefile for other make targets)
      make genall
   2. Execute the validation style sheet 
      make valall IN=testdata/idp5_valid.xml
   Note: if all validation rules pass, the output will contain "Validating entityID https://idp5.test.example.org/idp.xml"
   if the ruleset includes reportEntity.sch; otherwise it will be empty.
      
=== Run the validator using xalan
   1. Generate the validation stylesheet from schematron rules 
      java -jar xalan.jar -OUT validate/allrules.xsl -IN profiles/allrules.sch -XSL lib/message.xsl
   2. Execute the validation stylesheet
      java -jar xalan.jar -XSL validate/allrules.xsl -IN testdata/idp5_invalid.xml 

=== Use the validator using the Python API
    t.b.d.

==  Reference
Following files were used as a template:

iso_schematron_message.xsl
    ISO Schematron validators, generating XSLT1 from Schematron (http://code.google.com/p/schematron/)

iso_schematron_skeleton_for_xslt1.xsl
    'skeleton' XSLT scripts which implements Schematron (http://code.google.com/p/schematron/)
