all: genall genpvp2 gensaml2int

genall: profiles/allrules.sch profiles/sch_unit/*.sch
	xsltproc lib/message.xsl profiles/allrules.sch > validate/allrules.xsl
	
genpvp2: profiles/allrules.sch profiles/sch_unit/*.sch
	xsltproc lib/message.xsl profiles/allrules.sch > validate/allrules.xsl

# TODO: dependency rule coud be improved by something like:
# egrep 'sch_unit/rule\d+[EW]\.sch' saml2int.sch |perl -pe 's/^.+(rule\d+[EW]\.sch).+$/profiles\/sch_unit\/\1/'
gensaml2int: profiles/saml2int.sch profiles/sch_unit/rule4E.sch profiles/sch_unit/rule6W.sch profiles/sch_unit/rule7W.sch
	xsltproc lib/message.xsl profiles/allrules.sch > validate/allrules.xsl

valall: genall
	scripts/val_allrules_libxslt_long.sh $(IN) 

valallshort:
	scripts/val_allrules_libxslt_short.sh $(IN) 

listrules: profiles/sch_unit/*.sch
	./scripts/listrules.sh > doc/messages.txt
