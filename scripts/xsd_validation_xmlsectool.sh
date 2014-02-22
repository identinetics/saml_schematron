#!/bin/bash
# validate saml md schema. wrapper for xmlsectool

XMLSECTOOL='/usr/local/xmlsectool-1.2.0/xmlsectool.sh'
SAMLMETAXMLSCHEMAPATH='/usr/local/saml-schematron/xmlschema/'
if [ -z "$JAVA_HOME" ]; then
    export JAVA_HOME=/etc/alternatives/jre
fi  

echo "=== validate using xmlsectool"
$XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile $0 2>&1

exit 0
