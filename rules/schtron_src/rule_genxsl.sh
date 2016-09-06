#!/usr/bin/env bash

# generate xslt files from schematron sources

in=$1
out=${in/.sch/.xsl}
echo "generating $in to ../schtron_xsl/$out"

sed -e "s/||schematronrule||/$1/" rule_template.schtron > rule_exec.schtron.tmp
xsltproc ../../lib/message.xsl rule_exec.schtron.tmp > ../schtron_xsl/$out
