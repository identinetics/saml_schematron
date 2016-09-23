#!/usr/bin/env bash

# generate xslt files from schematron sources

in=$1
out=${in/.sch/.xsl}
echo "generating $in to ../schtron_xsl/$out"

sed -e "s/||schematronrule||/$1/" rule_template.schtron > rule_exec.schtron.$$
xsltproc ../../lib/message.xsl rule_exec.schtron.$$ > $out.$$
# lxml chokes if there is a newline after the <axsl:message> tag. Remove it:
perl -pe "chomp if /<axsl:message>/" $out.$$ > ../schtron_xsl/$out
rm rule_exec.schtron.$$ $out.$$


