# Part II Dissertation
---

This is my (Dhruv Makwana's) Part II project dissertation.

PDFs are included in the root directory of the project.

Below are a list of LaTeX package dependencies for this project to build

## Installation
  
    git clone https://github.com/
    cd <dir>
    make <all|main.pdf|proposal.pdf|progress.pdf>

### Variables

Default values:

    FLAGS := -quiet
    BUILD := build 

E.g. run with full LaTeX output:

    make <all|main.pdf|proposal.pdf|progress.pdf> FLAGS=''

## LaTeX Package Dependencies

[Minted](https://github.com/gpoore/minted) (for syntax highlighting) depends on
Python and [Pygments](http://pygments.org/download/) library.

    a4wide
    booktabs
    docmute
    fontenc
    geometry
    graphicx
    helvet
    hyperref
    inputenc
    minted
    pgfplots
    ulem
    xcolor
