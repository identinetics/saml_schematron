#!/bin/sh
# to be called from the project root
SCRIPTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
source $SCRIPTDIR/../../scripts/init.sh

runopt='xsltproc'
verbose=false

read -r -d '' usage << EOM
usage: $0 [-h] [-j] schematron-source-file
   -h  print this help text
   -j  use Java/Xalan instead of libxml2/xsltproc
   -v  verbose
EOM

while getopts ":hjv" opt; do
  case $opt in
    j)
      runopt='xalan'
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

if [ -z "$1" ]; then
    echo "missing argument\n$usage"
    exit 1
fi

infile=$1
outfile=${infile/.sch/.xsl}
$verbose && echo "input:  $infile"
$verbose && echo "output: $outfile"

if [ "$runopt" == "xalan" ]; then
    exec="java -jar $XALAN_JAR -OUT $outfile -IN $infile -XSL $PROJROOT/lib/message.xsl"
    $verbose && echo "executing: $exec"
    $exec
else
    exec="xsltproc --output $outfile $PROJROOT/lib/message.xsl $infile"
    $verbose && echo "executing: $exec"
    $exec
fi
