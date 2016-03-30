#!/bin/sh
# validate using schematron - this script is used by the webapp

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/init.sh

# security notice: input arguments are sanitized by surrounding them with double quotes

echo "=== validate XML Schema using ${XMLSECTOOLDIR}"
$XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile "$1"  2>&1
echo "\n=== validate schema file against Schematron rules using libxml2/xsltproc"
if [ "$2" == 'PVP2_V01' ]; then
    md_profile='pvp2.xsl'
elif [ "$2" == 'SAML2INT_V02' ]; then
    md_profile='saml2int.xsl'
fi
xsltproc $PROJROOT/rules/${md_profile} "$1" 2>&1

sleep 3  # better-than-nothing DoS mitigation
exit 0