#!/bin/sh
# adapt path for xerces
java -jar /Applications/3rd\ Party/oxygen/lib/xalan.jar -IN testdata/idp5_invalid.xml -XSL validate/allrules.xsl
