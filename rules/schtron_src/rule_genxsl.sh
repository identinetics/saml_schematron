#!/usr/bin/env bash

# generate xslt files from schematron sources

in=$1
out=${in/.sch/.xsl}
echo "generating $in to ../schtron_xsl/$out"

sed -e "s/||schematronrule||/$1/" rule_template.schtron > /tmp/rule_exec.schtron
xsltproc ../../lib/message.xsl /tmp/rule_exec.schtron > ../schtron_xsl/$out
