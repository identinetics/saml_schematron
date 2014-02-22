#!/bin/sh
# validate using schematron

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJROOT="$(dirname "$SCRIPTDIR")"

source $PROJROOT/scripts/init.sh

${RUNXSLTPROC} $PROJROOT/validate/allrules.xsl $1 2>&1

sleep 2  # primitive DoS mitigation
exit 0