#!/bin/bash
# define system-dependend file locations (development only - in prod user needs to set this)
# all-or-nothing: set only if SAMLSCHTRON_SETTINGS is not set


if [[ ! -z ${SAMLSCHTRON_SETTINGS+x} ]]; then
    exit 0
fi

ostype=${OSTYPE//[0-9.]/}
if [[ "$ostype" == "linux-gnu" ]]; then
    #  tested with CentOS7
    export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    export RUNXSLTPROC='/usr/bin/xsltproc'
    export RUNXMLLINT='/usr/bin/xmllint'
    export XMLSTARLET='xmlstarlet'
    if [ -z "$JAVA_HOME" ]; then
        export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    fi
elif [[ "$ostype" == "linux" ]]; then
    #  tested with RHEL6
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
    export RUNXSLTPROC='/usr/bin/xsltproc'
    export RUNXMLLINT='/usr/bin/xmllint'
    export XMLSTARLET='xmlstarlet'
    if [ -z "$JAVA_HOME" ]; then
        export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
    fi
elif [[ "$ostype" == "darwin" ]]; then   #  used for OSX development env
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    export RUNXSLTPROC='/opt/local/bin/xsltproc'  # Macports
    export RUNXMLLINT='/opt/local/bin/xmllint'  # Macports
    export XMLSTARLET='/opt/local/bin/xmlstarlet' # Macports
    if [ -z "$JAVA_HOME" ]; then
        export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    fi
else
    echo "no environment defined for $ostype"
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

# switch between javabridge and pyjnius
export PYJNIUS_ACTIVATE=

# uncomment this if installing the package from pypi
#export SAMLSCHTRON_SETTINGS=