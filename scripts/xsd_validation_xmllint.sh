#!/bin/sh
# run this script from project root
# arg 1: SAML metadata instance document
xmllint --noout --schema ./xmlschema/saml-schema-metadata-2.0.xsd $1