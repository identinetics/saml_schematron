#!/bin/bash
# validate saml md schema. wrapper for xmlsectool

workdir=$(dirname "$0")
source "$workdir/init.sh"

ostype=${OSTYPE//[0-9.]/}
if [ -z "$JAVA_HOME" ]; then
    if [ "$ostype" == "linux-gnu" ]; then #  tested with CentOS7
        export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    elif [ "$ostype" == "linux" ]; then #  tested with RHEL6
        export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
    elif [ "$ostype" == "darwin" ]; then #  used for OSX development env
        export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    else
        echo "no environment defined for $ostype"
        exit 1
    fi
fi

echo "=== validate using ${XMLSECTOOLDIR}"
$XMLSECTOOL --validateSchema --schemaDirectory $SAMLMETAXMLSCHEMAPATH --inFile $1  2>&1

exit 0
