#!/bin/sh
# validate using schematron

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJROOT="$(dirname "$SCRIPTDIR")"

source $PROJROOT/scripts/init.sh

file=`/bin/echo $1 | /usr/bin/sed -e 's/.xml$/.txt/'`
${RUNXSLTPROC}xsltproc $PROJROOT/validate/allrules.xsl $1 >$PROJROOT/reports/$file 2>&1
echo "output written to reports/$file"