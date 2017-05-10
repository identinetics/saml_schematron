#!/bin/bash

# test script for the Python/Java interface with same CLASSPATH settings
# 1. inspect CLASSPATH with jhades
# 2. call xsdValidator from Java
# 3. call verify_xmlsig from Java
# 4. As in 3 + 4, but from Python
#

TESTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
PROJ_HOME=$(dirname $TESTDIR)

source $PROJ_HOME/test/setTestEnv.sh

echo "$0 (1): Calling xsdValidator/Jhades"
$JAVA_HOME/bin/java at.wien.ma14.pvzd.validatexsd.cli.XSDValidatorCLI

echo "$0 (2):Calling xsdValidator (from Java)"
#$JAVA_HOME/bin/java at.wien.ma14.pvzd.validatexsd.cli.XSDValidatorCLI \
#    $PROJ_HOME/testdata/idp_valid.xml \
#    $PROJ_HOME/xmlschema

echo
cd $PROJ_HOME && echo $PWD
cd -
echo "If the message 'Could not find or load main class' occures, this can be misleading and actually a library it is relying on was not found"
echo

echo "$0 (3):Calling xsdValidator (from Python)"
source ~/virtualenvs/samlschtron35/bin/activate

echo $PYTHONPATH

python $TESTDIR/py2java_test.py


