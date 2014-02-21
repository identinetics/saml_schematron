#!/bin/sh
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJROOT="$(dirname "$SCRIPTDIR")"

source $PROJROOT/scripts/init.sh

${RUNXMLCOREUTILS}xml-strings $PROJROOT/profiles/single_schematron_schemas/rule* :/ | grep -v '^\s*$' |sort -k 2
