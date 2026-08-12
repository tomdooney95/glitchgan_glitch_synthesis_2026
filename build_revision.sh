#!/bin/bash
cd "$(dirname "$0")"

NAME=main_revision_4AUG

# Check for duplicate bib keys before doing anything
dupes=$(grep -h '^@' references.bib | grep -v '^@string' | sed 's/@[^{]*{//' | sed 's/,.*//' | sort | uniq -d)
if [ -n "$dupes" ]; then
    echo "ERROR: Duplicate bib keys found in references.bib:" >&2
    echo "$dupes" >&2
    exit 1
fi

# Clean aux files — but NOT the .bbl (preserving it avoids a pdflatex/revtex
# bug that truncates the aux on a fresh start when no .bbl exists yet)
rm -f "$NAME.aux" "$NAME.out" "$NAME.blg" "$NAME.log" "$NAME.toc" "$NAME.synctex.gz"

# Full 4-pass build
pdflatex -interaction=nonstopmode "$NAME.tex" || true
bibtex "$NAME" || true
pdflatex -interaction=nonstopmode "$NAME.tex" || true
pdflatex -interaction=nonstopmode "$NAME.tex" || true

open "$NAME.pdf"
