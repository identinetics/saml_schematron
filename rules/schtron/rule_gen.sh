#!/usr/bin/env bash

sed -e "s/||schematronrule||/$1/" rule_template.schtron > rule_exec.schtron
xsltproc ../../lib/message.xsl rule_exec.schtron > $2
