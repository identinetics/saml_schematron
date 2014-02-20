all: genall genpvp2 gensaml2int

genall: profiles/allrules.sch profiles/single_schematron_schemas/*.sch
	xsltproc lib/message.xsl profiles/allrules.sch > validate/allrules.xsl
	
genpvp2: profiles/allrules.sch profiles/single_schematron_schemas/*.sch
	xsltproc lib/message.xsl profiles/allrules.sch > validate/allrules.xsl

# TODO: dependency rule coud be improved by something like:
# egrep 'single_schematron_schemas/rule\d+[EW]\.sch' saml2int.sch |perl -pe 's/^.+(rule\d+[EW]\.sch).+$/profiles\/single_schematron_schemas\/\1/'
gensaml2int: profiles/saml2int.sch profiles/single_schematron_schemas/rule4E.sch profiles/single_schematron_schemas/rule6W.sch profiles/single_schematron_schemas/rule7W.sch
	xsltproc lib/message.xsl profiles/allrules.sch > validate/allrules.xsl

valall: genall
	scripts/val_allrules_libxslt_long.sh $(IN) 

valallshort:
	scripts/val_allrules_libxslt_short.sh $(IN) 

listrules: profiles/single_schematron_schemas/*.sch
	./scripts/listrules.sh > doc/messages.txt
