#!/bin/sh
# validate using xslt based on schematron definition

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/init.sh

runopt='xsltproc'
outform='long'
verbose=false

read -r -d '' usage << EOM
Validate a SAML metadata file against a rule set (xslt generated from schematron)
usage: $0 [-h] [-j] xml-file xslt-file
   -h  print this help text
   -j  use Java/Xalan instead of libxml2/xsltproc
   -s  output short form (message text only, no xpath and document location)
   -v  verbose
EOM

while getopts ":hjsv" opt; do
  case $opt in
    j)
      runopt='xalan'
      ;;
    s)
      outform='short'
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

[ -z "$1" ] && [ -z "$2" ] && echo "missing argument\n$usage" && exit 1

xmlfile=$1
xsltfile=$2
$verbose && echo "xmlfile:  $xmlfile"
$verbose && echo "xsltfile: $xsltfile"

if [ "$runopt" == "xalan" ]; then
    if [ $outform == 'short' ]; then
        $verbose && echo "executing: java -jar $XALAN_JAR -IN $xmlfile -XSL $xsltfile 2>&1 | grep '^[IWE]' | sort -u -k 2"
                                     java -jar $XALAN_JAR -IN $xmlfile -XSL $xsltfile 2>&1 | grep '^[IWE]' | sort -u -k 2
    else
        $verbose && echo "executing: java -jar $XALAN_JAR -IN $xmlfile -XSL $xsltfile"
                                     java -jar $XALAN_JAR -IN $xmlfile -XSL $xsltfile
    fi
else
    if [ $outform == 'short' ]; then
        $verbose && echo "executing: xsltproc $xmlfile $xsltfile 2>&1 | grep '^[IWE]' | sort -u -k 2"
                                     xsltproc $xmlfile $xsltfile 2>&1 | grep '^[IWE]' | sort -u -k 2
    else
        $verbose && echo "executing: xsltproc $xmlfile $xsltfile"
                                     xsltproc $xmlfile $xsltfile
    fi
fi
