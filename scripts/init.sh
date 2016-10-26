#!/bin/bash

# define system-dependend file locations (development only - in prod user needs to set this)
# all-or-nothing: set only if SAMLSCHTRON_SETTINGS is not set
if [[ ! -z ${SAMLSCHTRON_SETTINGS+x} ]]; then
    exit 0
fi


if [[ "$HOSTNAME" == "samlschtron" ]]; then
    # container from docker-samlschtron project
    export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0_openjdk
    export PROJ_HOME=/opt/PVZDpolman
    if [[ ! -x "$PYTHON" ]]; then
        echo "PYTHON must point to an excutable; but value=$PYTHON"
    fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    #  tested with CentOS7
    export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    export RUNXSLTPROC='/usr/bin/xsltproc'
    export RUNXMLLINT='/usr/bin/xmllint'
    export XMLSTARLET='xmlstarlet'
    if [ -z "$JAVA_HOME" ]; then
        export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    fi
elif [[ "$OSTYPE" == "linux" ]]; then
    #  tested with RHEL6
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
    export RUNXSLTPROC='/usr/bin/xsltproc'
    export RUNXMLLINT='/usr/bin/xmllint'
    export XMLSTARLET='xmlstarlet'
    if [ -z "$JAVA_HOME" ]; then
        export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then   #  used for OSX development env
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    export RUNXSLTPROC='/opt/local/bin/xsltproc'  # Macports
    export RUNXMLLINT='/opt/local/bin/xmllint'  # Macports
    export XMLSTARLET='/opt/local/bin/xmlstarlet' # Macports
    if [ -z "$JAVA_HOME" ]; then
        export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    fi
    PYTHON='/Users/admin/virtualenvs/saml_schematron34_dev/bin/python'
else
    echo "no environment defined for $OSTYPE"
    exit 1
fi

workdir=$(dirname "$BASH_SOURCE")
export PROJROOT=$(dirname "$workdir")
export SAMLMETAXMLSCHEMAPATH="$PROJROOT/xmlschema/"
export XALAN_JAR=$PROJROOT/lib/xalan-j_2_7_2/xalan.jar
export XMLSECTOOLDIR="$PROJROOT/lib/xmlsectool-1.2.0"
export XMLSECTOOL="${XMLSECTOOLDIR}/xmlsectool.sh"
export DYLD_LIBRARY_PATH=$JAVA_HOME/jre/lib/server
export CLASSPATH=$PROJROOT/lib/pvzdValidateXsd.jar

# switch between javabridge and pyjnius: uncomment if using PYJNIUS
export PYJNIUS_ACTIVATE=
