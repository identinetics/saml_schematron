#!/bin/sh
# validate using schematron

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJROOT="$(dirname "$SCRIPTDIR")"

source $PROJROOT/scripts/init.sh

file=`/bin/echo $1 | /usr/bin/sed -e 's/.xml$/.txt/'`
${RUNXSLTPROC} $PROJROOT/validate/rule$2.xsl $1 
