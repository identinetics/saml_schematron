#!/bin/bash
# validate saml md schema. wrapper for xmlsectool

workdir=$(dirname "$0")
source "$workdir/init.sh"

echo "=== validate using ${XMLSECTOOLDIR}"
$XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile $1  2>&1

exit 0
