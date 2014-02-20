#!/bin/sh
# validate and filter output for Error/Warning lines; sort by error number
xsltproc validate/allrules.xsl $1 2>&1 | grep '^[EW]' | sort -u -k 2