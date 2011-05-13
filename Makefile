# mrepper@sandia.gov

# so latex can find the Sandia beamer theme (assumes redsky-tools layout)
#export TEXINPUTS = .:../beamerthemes:

ifdef DEBUG
   ECHO = echo
endif

# extensions for files that will be used as source code
source_types := tex
source_files := $(foreach ext, $(source_types), $(wildcard *.$(ext)))

# extensions for files that will be generated
#output_types := dvi pdf ps
output_types := pdf
output_files := $(foreach ext, $(output_types), $(addsuffix .$(ext), $(basename $(source_files))))

# extensions for files that will get removed on a 'make clean'
extra_types := aux log out idx ilg ind bbl blg nav snm toc vrb
extra_files := $(foreach ext, $(extra_types), $(addsuffix .$(ext), $(basename $(source_files))))

# all graphics, listings, etc from *.tex
#DEPS = $(shell ./list_dependencies)
DEPS = $(shell find resources/logos/* figures/* listings/* -type f 2>/dev/null)

all: $(output_files)

%.dvi: %.tex $(DEPS)
	@$(ECHO) latex $* </dev/null
	@$(ECHO) makeindex hw $* </dev/null || :
	@$(ECHO) bibtex $* </dev/null || :
	@$(ECHO) latex $* </dev/null
	@$(ECHO) latex $* </dev/null
	@echo "$@ is ready"

#%.pdf: %.dvi
#	@$(ECHO) dvips -Ppdf $< -o $(basename $<)_for_pdf.ps
#	@$(ECHO) ps2pdf $(basename $<)_for_pdf.ps $@
%.pdf: %.tex $(DEPS)
	@$(ECHO) pdflatex $< </dev/null
	@$(ECHO) pdflatex $< </dev/null
	@$(ECHO) pdflatex $< </dev/null

%.ps: %.dvi
	@$(ECHO) dvips -t letter $<

clean:
	@$(ECHO) rm -fv $(output_files) $(extra_files) *_for_pdf.ps
