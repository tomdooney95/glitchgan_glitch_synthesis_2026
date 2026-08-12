# GlitchGAN: Realistic Synthesis of Gravitational-Wave Detector Glitches

**Tom Dooney, Mees de Boer, Harsh Narola, Melissa Lopez, Stefano Bromuri, Daniel Stanley Tan, Chris Van Den Broeck**

Nikhef / Utrecht University / Open Universiteit

---

## Overview

This repository contains the LaTeX source for the GlitchGAN paper. GlitchGAN is a class-conditional generative model built on the cDVGAN architecture that synthesizes realistic LIGO detector glitches directly in the time domain, trained on DeepExtractor reconstructions of seven glitch classes from LIGO O3.

## Reading the paper

The latest version of the paper (resubmission) is available as a [PDF download](https://github.com/tomdooney95/glitchgan_glitch_synthesis_2026/releases/latest/download/main_revision_4AUG.pdf).

The original submission is also available as a [PDF download](https://github.com/tomdooney95/glitchgan_glitch_synthesis_2026/releases/latest/download/main.pdf).


## Contributing

Please make changes on your own branch rather than committing directly to `main`:

```bash
git checkout -b your-name/my-changes
# make your edits
git add .
git commit -m "Brief description of changes"
git push origin your-name/my-changes
```

Then open a pull request on GitHub so changes can be reviewed before merging.

## Related code

The GlitchGAN training code (PyTorch implementation) is available at:
[https://github.com/tomdooney95/cDVGAN_for_DeepExtractor](https://github.com/tomdooney95/cDVGAN_for_DeepExtractor)