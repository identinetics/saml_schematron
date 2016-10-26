#!/usr/bin/env bash

SCRIPTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
PROJ_HOME=$(cd $(dirname $SCRIPTDIR) && pwd)
source $PROJ_HOME/scripts/init.sh
export PYTHONPATH=test:saml_schtron

sum=0

$PYTHON test/test_validator.py
sum=$(($sum+$?))

$PYTHON test/testXsdValidator.py
sum=$(($sum+$?))

exit $sum