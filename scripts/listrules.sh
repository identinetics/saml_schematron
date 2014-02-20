#!/bin/sh
xml-strings profiles/single_schematron_schemas/rule* :/ | grep -v '^\s*$' |sort -k 2