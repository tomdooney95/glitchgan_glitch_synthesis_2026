#!/bin/bash
set -e
cd "$(dirname "$0")"

# Check for duplicate bib keys before doing anything
dupes=$(grep -h '^@' references.bib | grep -v '^@string' | sed 's/@[^{]*{//' | sed 's/,.*//' | sort | uniq -d)
if [ -n "$dupes" ]; then
    echo "ERROR: Duplicate bib keys found in references.bib:" >&2
    echo "$dupes" >&2
    exit 1
fi

# Clean auxiliary files
rm -f *.aux *.bbl *.blg *.log *.toc *.out *.fdb* *.fls *.synctex.gz *.dvi

# Full pass: pdflatex → bibtex → pdflatex → pdflatex
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex

open main.pdf
