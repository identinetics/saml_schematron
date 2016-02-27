#!/bin/sh
# validate using schematron

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJROOT="$(dirname "$SCRIPTDIR")"

source $PROJROOT/scripts/init.sh

echo "=== validate XML Schema using ${XMLSECTOOLDIR}"
$XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile $1  2>&1
echo "\n=== validate Schematron rules using ${RUNXSLTPROC}"
if [ $2 == 'PVP2_V01' ]; then
    md_profile='allrules.xsl'
elif [ $2 == 'SAML2INT_V02' ]; then
    md_profile='saml2int.xsl'
fi
${RUNXSLTPROC} $PROJROOT/validate/${md_profile} $1 2>&1

sleep 3  # better-than-nothing DoS mitigation
exit 0