#!/bin/bash
cd "$(dirname "$0")"

SRC=main_revision_4AUG
NAME="${1:-$SRC}"

# Check for duplicate bib keys before doing anything
dupes=$(grep -h '^@' references.bib | grep -v '^@string' | sed 's/@[^{]*{//' | sed 's/,.*//' | sort | uniq -d)
if [ -n "$dupes" ]; then
    echo "ERROR: Duplicate bib keys found in references.bib:" >&2
    echo "$dupes" >&2
    exit 1
fi

# Compiling under a new name: seed the .tex (and .bbl, to dodge the same
# fresh-start bug noted below) from the source revision
if [ "$NAME" != "$SRC" ]; then
    cp -n "$SRC.tex" "$NAME.tex"
    [ -f "$SRC.bbl" ] && [ ! -f "$NAME.bbl" ] && cp "$SRC.bbl" "$NAME.bbl"
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
