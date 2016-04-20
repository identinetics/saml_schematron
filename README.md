## Purpose

SAML-Schematron provides additional rules to OASIS SSTC XML schemas to validate metadata against specific 
profiles. Users may want to define their own profile-specific rule set reusing existing rules.
In addition it makes standard XSD validation easy.

## Installation
Use the provided docker installation (see below), or install using these steps:

Prepare a python environment >= 3.4

    
    pip install saml_schematron
    
or
    
    git clone https://github.com/rhoerbe/saml_schematron.git
    cd saml_schematron
    python setup.py install


## Usage

### Command Line

    cd $PROJROOT
    validate.py --rule rule11W testdata/sp_valid.xml  # test against a single rule 
    validate.py --listprofiles dummy # list available profiles
    validate.py --profile webssofed testdata/sp_valid.xml  # test against a profile (set of rules)

### Python API

Validating an EntityDescriptor against a single rule:

    from saml_schtron.validate import ApiArgs, Validator
    md_file = "testdata/idp_incomplete.xml"
    rule='rule06W'
    validator = Validator(ApiArgs(md_file, rule=rule).cliInvocation)
    validator_result = validator.validate()
    print(validator_result.message)
    
    > 'Warning (06): EntityDescriptor should contain ContactPerson with a contactType of "support" and at least one EmailAddress\n    \nINFO: 0, WARNING: 1, ERROR: 0'

Validating an EntityDescriptor against a profile:

    sys.path.append('src')
    from saml_schtron.validate import ApiArgs, Validator
    md_file = "testdata/idp_incomplete.xml"
    profile='rules/saml2int.json'
    validator = Validator(ApiArgs(md_file, profile=profile).cliInvocation)
    validator_result = validator.validate()
    print(validator_result.message)
    
    > Error (04): Each IDPSSODescriptor must contain a signing key as X509Certificate (child element of X509Data)         
    > Warning (06): EntityDescriptor should contain ContactPerson with a contactType of "support" and at least one EmailAddress
    > Warning (07): EntityDescriptor should contain ContactPerson with a contactType of "technical" and at least one EmailAddress
    > INFO: 0, WARNING: 2, ERROR: 1


### XSL Processor
Validate using either xsltproc of Xalan:

    scripts/val_schtron.sh [-j] xslt-file xml-file
       -j  use Java/Xalan instead of libxml2/xsltproc
       -s  output short form (message text only, no xpath and document location)
       -v  verbose



### Web Application

Build a docker container as in docker/Dockerfile, or use the Dockerfile for your custom 
installation. It executes the simple web application in the webapp directory (currently only German).
The default configuration assumes the you connect the container's webserver to a HTTP reverse 
proxy such as Apache/mod_proxy or nginx.
Configure your settings in docker/conf.sh
Execute the container using docker/run.sh


## Contents

#### lib/base.xsl

Extension of iso_schematron_skeleton_for_xslt1.xsl. Note that the extensions will definitely require 
an xslt processor with support for exsl:node-set, although this is pretty universal for xslt 1.0 processors. 

#### lib/svrl.xsl

Outputs SVRL (schematron validation report language) report of validation results - a renderer for 
the report format can be found at http://code.google.com/p/schematron/source/browse/trunk/converters/code/FromSVRL/SVRLReportRender.xsl?r=9eb8e4e286619a1dfb9c21a7e1010f07a5e73975 
svrl.xsl can be used from the command line to output a validating stylesheet in the same way as 
the other xslt implementations of schematron, so the step would be to
1. run svrl.xsl as the xslt against a schematron schema and output a validating xslt. 
   java -jar xalan.jar -OUT validate/svrlval.xsl -IN profiles/allrules.sch -XSL lib/svrl.xsl
2. after which you would run svrlval.xsl against a saml file to output the schematron validation rules language report. 
   java -jar xalan.jar -OUT reports/svrl2014_03_27_299949.xml -IN samldocument.saml -XSL validate/svrlval.xsl 

#### lib/message.xsl
     
Modified version of iso_schematron_message.xsl, outputting messages and xpath for the elements in the 
instance document causing the message.

#### lib/xalan, lib/xmlsectool
Library dependencies installed here
    
#### reports

Output directory for validations
    
#### rules
Directory with saml metadata validation profiles. A profile is a set of validation rules in the
form <profilename.json>. The  profile JSON file contains an array of rule name from the schtron
directory (filenames wihtout extension).

* rules/schtron_src
  Directory with schematron rules (<iso:pattern>)
  Makefile (make all) and accompaning scripts and templates.
   
* rules/schtron_src
  Each rule file is a expanded into a complete schematron document

* rules/schtron_xsl
  Each rule file is generated into a style scheet that ca be executed with xsltproc or xerces

* rules/allrules.sch
  Example that executes all rules contained in sch_unit

* rules/*.json
  Rule listing for unit tests

#### saml_schtron
 
The python application (API, CLI, web)   

##### xmlschema
    SAML metdata schema files modified to be read from local directory instead of URLs.

   
#### scripts

Sample command line invocations 
    
#### test

Unit tests
    
#### testdata

SAML metadata instance documents that are valid to XML Schema. Some contain violations of 
schematron rules to be used for testing.
    
##  Reference

Following files were used as a template:

[[iso_schematron_message.xsl]]
    ISO Schematron validators, generating XSLT1 from Schematron (http://code.google.com/p/schematron/)

[[iso_schematron_skeleton_for_xslt1.xsl]]
    'skeleton' XSLT scripts which implements Schematron (http://code.google.com/p/schematron/)
