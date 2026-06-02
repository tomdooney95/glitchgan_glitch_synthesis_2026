#!/bin/bash
cd "$(dirname "$0")"

# Check for duplicate bib keys before doing anything
dupes=$(grep -h '^@' references.bib | grep -v '^@string' | sed 's/@[^{]*{//' | sed 's/,.*//' | sort | uniq -d)
if [ -n "$dupes" ]; then
    echo "ERROR: Duplicate bib keys found in references.bib:" >&2
    echo "$dupes" >&2
    exit 1
fi

# Clean aux files — but NOT main.bbl (preserving it avoids a pdflatex/revtex
# bug that truncates the aux on a fresh start when no .bbl exists yet)
rm -f main.aux main.out main.blg main.log main.toc main.synctex.gz

# Full 4-pass build
pdflatex -interaction=nonstopmode main.tex || true
bibtex main || true
pdflatex -interaction=nonstopmode main.tex || true
pdflatex -interaction=nonstopmode main.tex || true

open main.pdf
