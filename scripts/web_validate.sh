#!/usr/bin/env bash

# validate a file using the web service

MD_INSTANCE=$1
MD_PROFILE=$2

curl \
  -F "md_instance=@${MD_INSTANCE}" \
  -F "md_profile_key=${MD_PROFILE}" \
  http://localhost:8080/