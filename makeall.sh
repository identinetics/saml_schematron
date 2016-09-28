# listrules:
./scripts/listrules.sh > doc/messages.json

# html:
export PYTHONPATH=$PATHONPATH:saml_schematron && python3.5 scripts/listrules_html.py

# xslt:
cd rules/schtron_src && make
