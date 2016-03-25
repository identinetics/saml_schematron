SRC=$(wildcard *.sch)
TARG=$(SRC:.sch=.xsl)

all: $(TARG)
	xsltproc ../../lib/message.xsl $< > $@


%.xsl: %.sch
	xsltproc ../../lib/message.xsl $< > $@
