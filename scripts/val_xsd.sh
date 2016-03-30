#!/bin/bash
# validate saml md schema (wrapper for xmlsectool)

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/init.sh

runopt='xmlsectool'
verbose=false

read -r -d '' usage << EOM
Validate a SAML metadata file against XML Schema
usage: $0 [-h] [-l] xml-file
   -h  print this help text
   -l  use libxml2/xmllint instead of java/xerces (not fully XSD compliant!!)
   -v  verbose
EOM

while getopts ":hlv" opt; do
  case $opt in
    l)
      runopt='xmllint'
      ;;
    v)
      verbose=true
      ;;
    *)
      echo $usage
      exit 0
      ;;
  esac
done

shift $((OPTIND-1))

[ -z "$1" ] && echo "missing argument\n$usage" && exit 1

xmlfile=$1
$verbose && echo "xmlfile: $xmlfile"

# security notice: input arguments are sanitized by surrounding them with double quotes

if [ "$runopt" == "xmlsectool" ]; then
        $verbose && echo "executing: $XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile $1  2>&1"
                                     $XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile "$1"  2>&1

else
        $verbose && echo "executing: xmllint --noout --schema $PROJROOT/xmlschema/saml-schema-metadata-2.0.xsd $1 2>&1"
                                     xmllint --noout --schema $PROJROOT/xmlschema/saml-schema-metadata-2.0.xsd "$1" 2>&1
fi





exit 0
