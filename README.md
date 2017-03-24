# Part II Dissertation
---

This is my (Dhruv Makwana's) Part II project dissertation.

PDFs are included in the root directory of the project.

Below are a list of LaTeX package dependencies for this project to build

## Installation
  
    git clone https://github.com/dc-mak/part-ii <dir>
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

    sfdefault
    FiraMono
    arevmath

    adjustbox
    array
    booktabs
    geometry
    docmute
    enumitem
    fancyhdr
    fontenc
    geometry
    inputenc
    minted
    pgfplots
    sectsty
    tocloft
    titlesec
    xcolor
    minitoc
