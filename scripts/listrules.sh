#!/bin/sh

SCRIPTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
source $SCRIPTDIR/init.sh

${XMLSTARLET} sel -t -c '//text()'  $PROJROOT/rules/schtron/rule*.sch :/ | grep -v '^\s*$' |sort -k 2
