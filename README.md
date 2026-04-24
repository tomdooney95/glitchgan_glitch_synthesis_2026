# GlitchGAN: Realistic Synthesis of Gravitational-Wave Detector Glitches

**Tom Dooney, Mees de Boer, Harsh Narola, Melissa Lopez, Stefano Bromuri, Daniel Stanley Tan, Chris Van Den Broeck**

Nikhef / Utrecht University / Open Universiteit

---

## Overview

This repository contains the LaTeX source for the GlitchGAN paper. GlitchGAN is a class-conditional generative model built on the cDVGAN architecture that synthesizes realistic LIGO detector glitches directly in the time domain, trained on DeepExtractor reconstructions of seven glitch classes from LIGO O3.

## Reading the paper

A compiled PDF is included in the repository:

```bash
git clone git@github.com:tomdooney95/glitchgan_glitch_synthesis_2026.git
cd glitchgan_glitch_synthesis_2026
open main.pdf          # macOS
xdg-open main.pdf      # Linux
```

## Building from source

Requires a full LaTeX installation (e.g. TeX Live or MacTeX) with `revtex4-2`.

```bash
pdflatex main
bibtex main
pdflatex main
pdflatex main
```

Or with `latexmk`:

```bash
latexmk -pdf main
```

## Repository structure

```
main.tex          — LaTeX source
main.pdf          — Compiled PDF
references.bib    — Bibliography
figures/          — All figures
```

## Related code

The GlitchGAN training code (PyTorch implementation) is available at:
[https://github.com/tomdooney95/cDVGAN_for_DeepExtractor](https://github.com/tomdooney95/cDVGAN_for_DeepExtractor)
