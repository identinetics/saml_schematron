#!/bin/sh
# validate and filter output for Info/Warning/Error lines; sort by error number
xsltproc validate/allrules.xsl $1 2>&1 | grep '^[IWE]' | sort -u -k 2