#!/bin/sh

#!/bin/sh
# validate using schematron

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJROOT="$(dirname "$SCRIPTDIR")"

source $PROJROOT/scripts/init.sh

xmllint --noout --schema $PROJROOT/xmlschema/saml-schema-metadata-2.0.xsd $1 2>&1

sleep 2  # primitive DoS mitigation
exit 0  # a non-zero exit code would fail subprocess.check_ouput and discard stdout