#       all      - Will produce the main paper and the revision paper
#       clean    - Will remove any intermediate products

NAME          = main
REVISION_NAME = main_revision_4AUG
BIBLIOGRAPHY  = references.bib

PDF          = $(NAME).pdf
REVISION_PDF = $(REVISION_NAME).pdf
TEXFILE      = $(NAME).tex
SUPPORTING_TEXFILES = $(wildcard *.tex)

# Setting parameters for running of latexmk by the gitlab runner
LATEXMK = latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode"

#All Target is equivalent to making both PDFs
all: $(PDF) $(REVISION_PDF)

#PDF Targets
$(PDF): $(TEXFILE) $(SUPPORTING_TEXFILES)
	$(LATEXMK) $(TEXFILE)

$(REVISION_PDF): $(REVISION_NAME).tex $(SUPPORTING_TEXFILES)
	$(LATEXMK) $(REVISION_NAME).tex

#Cleaning Target
.PHONY: clean
clean:
	rm -rf *.aux *.bbl *.blg *.log *.toc *.out *.fdb* *.fls gitID.txt


