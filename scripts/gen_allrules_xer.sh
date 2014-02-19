#!/bin/sh
# adapt CLASSPATH for xalan
java -jar /Applications/3rd\ Party/oxygen/lib/xalan.jar -OUT validate/allrules.xsl -IN profiles/allrules.sch -XSL lib/message.xsl
