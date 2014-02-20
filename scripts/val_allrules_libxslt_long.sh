#!/bin/sh
# validate and filter output for Error/Warning lines; sort by error number
file=`/bin/echo $1 | /usr/bin/sed -e 's/.xml$/.txt/'`
xsltproc validate/allrules.xsl $1 >reports/$file 2>&1
echo "output written to reports/$file"