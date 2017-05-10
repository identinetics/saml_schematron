#!/bin/bash
# set paths for devl and test systems

SCRIPTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
export PROJ_HOME=$(dirname $SCRIPTDIR)

if  [[ "$HOSTNAME" == "devl10.local" || "$HOSTNAME" == "devl10.shared" ]]; then
    export devlhome=~/devl
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    export py3='~/virtualenvs/samlschtron35/bin/python'
elif [[ "$HOSTNAME" == "kalypso" ]]; then
    export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    export py3='/usr/bin/python3.4'
else
    echo "no environment defined for this host"
    exit 1
fi

export PYJNIUS_ACTIVATE=     # remove this line to use javabridge instead of pyjnius

# --- do not change below this line for target system configuration
export CLASSPATH="\
$PROJ_HOME/lib/unittests/junit-4.11.jar:\
$PROJ_HOME/lib/*"

export DYLD_LIBRARY_PATH=$JAVA_HOME/jre/lib/server
export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/saml_schtron
export PATH=$PATH:$PROJ_HOME/PolicyManager/bin

export SAMLSCHTRON_VERSION=$(echo "SAML Schematron Version $(cat $PROJ_HOME/VERSION)")