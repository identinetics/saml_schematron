#!/bin/bash
#
# Startup script for the saml schematron validation web app

cd /opt/saml_schematron/webapp/
start_srv.py > /var/log/access.log 2> /var/log/error.log
