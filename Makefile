FLAGS := -quiet
BUILD := build

# Progress files
SRC_PROG := progress.tex
DIR_PROG := progress
SRC_PROG := $(addprefix $(DIR_PROG)/, $(SRC_PROG))

# Proposal files
SRC_PROP := proposal.tex \
					  proposal-project-structure-diagram.pdf
DIR_PROP := proposal
SRC_PROP := $(addprefix $(DIR_PROP)/, $(SRC_PROP))

# Main files
SRC_MAIN := main.tex \
						title.tex \
						frontmatter.tex \
						introduction.tex \
						preparation.tex \
						implementation.tex \
						evaluation.tex \
						conclusions.tex \
						dissertation.bib
DIR_MAIN := src
SRC_MAIN := $(addprefix $(DIR_MAIN)/, $(SRC_MAIN))

all: main.pdf proposal.pdf progress.pdf

main.pdf: $(SRC_MAIN) $(SRC_PROP) | $(BUILD)
	latexmk -pdf -dvi- -ps- $< -shell-escape -output-directory=$(BUILD) $(FLAGS)
	mv $(BUILD)/$@ $@

proposal.pdf: $(SRC_PROP) | $(BUILD)
	latexmk -pdf -dvi- -ps- $< -output-directory=$(BUILD) $(FLAGS)
	mv $(BUILD)/$@ $@

progress.pdf: $(SRC_PROG) | $(BUILD)
	latexmk -pdf -dvi- -ps- $< -output-directory=$(BUILD) $(FLAGS)
	mv $(BUILD)/$@ $@

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)
