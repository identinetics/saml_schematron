#!/bin/bash
# set paths for devl and test systems

PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

TESTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
PROJ_HOME=$(cd $(dirname $TESTDIR) && pwd)
source $PROJ_HOME/test/setEnv.sh


#echo $CLASSPATH
#echo

cd $TESTDIR

export CLASSPATH="$CLASSPATH:\
$PROJ_HOME/lib/unittests/hamcrest-core-1.3.jar:\
$PROJ_HOME/lib/unittests/hamcrest-library-1.3.jar"

export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/saml_schtron/test

# remove following line to use javabridge
export PYJNIUS_ACTIVATE=
