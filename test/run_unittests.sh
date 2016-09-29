#!/usr/bin/env bash

export PYTHONPATH=test:saml_schtron

set -e
python test/test_validator.py
python test/testXsdValidator.py

