#!/bin/bash
# define system-dependend file locations

if [[ "$ostype" == "linux-gnu" ]]; then
    #  tested with CentOS7
    export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
    export RUNXSLTPROC='/usr/bin/xsltproc'
    export RUNXMLLINT='/usr/bin/xmllint'
    export RUNXMLCOREUTILS='/usr/bin/'
elif [[ "$ostype" == "linux" ]]; then
    #  tested with RHEL6
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
    export RUNXSLTPROC='/usr/bin/xsltproc'
    export RUNXMLLINT='/usr/bin/xmllint'
    export RUNXMLCOREUTILS='/usr/bin/'
elif [[ "$ostype" == "darwin" ]]; then   #  used for OSX development env
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
    export RUNXSLTPROC='/opt/local/bin/xsltproc'  # Macports
    export RUNXMLLINT='/opt/local/bin/xmllint'  # Macports
    export RUNXMLCOREUTILS='/opt/local/bin/' # Macports
else
    echo "no environment defined for $ostype"
    exit 1
fi

