#!/usr/bin/env bash

# Expand Schematron rules (<iso:pattern>) to complete schematron documents

in=$1
out=${in/.sch/_exp.sch}
echo "expanding $in to $out"
sed -e "s/||schematronrule||/$1/" rule_template.schtron > ../schtron_exp/$out
