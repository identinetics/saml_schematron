#!/usr/bin/env bash

export PYTHONPATH=test:saml_schtron

sum=0

python test/test_validator.py
sum=$(($sum+$?))

python test/testXsdValidator.py
sum=$(($sum+$?))

exit $sum