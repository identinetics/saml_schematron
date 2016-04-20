#!/bin/bash
#
# validate_srv.py        Startup script for the saml schematron validation web app

cd /opt/saml_schematron/webapp/
validate_srv.py > /var/log/access.log 2> /var/log/error.log
