SRC=$(wildcard *.sch)
TARG=$(SRC:.sch=.xsl)
TARGDIR=../xslt


%.xsl: %.sch rule_template.schtron
	$(CURDIR)/rule_genxsl.sh $< ../schtron_xsl/$@


all: $(TARG)

