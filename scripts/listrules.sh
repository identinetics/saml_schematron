#!/bin/sh

SCRIPTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
source $SCRIPTDIR/init.sh

echo '{'
${XMLSTARLET} sel -t -c '//text()'  $PROJROOT/rules/schtron_src/rule*.sch | \
   perl -ne 's/,$/},/ if /"Message":/; s/^("rule[^"]*": \{)/\1\n        /; print unless /^\s*$/ '
echo '"end of listing": {}'
echo '}'
