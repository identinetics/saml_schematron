#!/bin/bash
# validate saml md schema. wrapper for xmlsectool

XMLSECTOOLDIR='xmlsectool-1.2.0'
XMLSECTOOL="/usr/local/${XMLSECTOOLDIR}/xmlsectool.sh"
SAMLMETAXMLSCHEMAPATH='/usr/local/saml_schematron/xmlschema/'
if [ -z "$JAVA_HOME" ]; then
    export JAVA_HOME=/etc/alternatives/jre
fi  

echo "=== validate using ${XMLSECTOOLDIR}"
$XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile $1  2>&1

exit 0
