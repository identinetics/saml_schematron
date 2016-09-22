#!/usr/bin/env bash

# Execute rule_expand.sh for all relevant files in current directory

for file in *.sch; do
    if [[ ! "$file" =~ "_exp.sch" ]]; then
        ./rule_expand.sh $file
    fi
done