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
	    myclass.cls \
	    title.tex \
	    frontmatter.tex \
	    introduction.tex \
	    preparation.tex \
	    implementation.tex \
	    evaluation.tex \
	    conclusions.tex \
			output.tex \
	    dissertation.bib
DIR_MAIN := src
SRC_MAIN := $(addprefix $(DIR_MAIN)/, $(SRC_MAIN))

# Images
# ===

# regexp
SRC_REGEXP := direct.png  \
							grid.png  \
							hierarchical.png  \
							meta.png  \
							module.png  \
							kinds.tex  \
							pagerank.tex
DIR_REGEXP := regexp
SRC_REGEXP := $(addprefix $(DIR_REGEXP)/, $(SRC_REGEXP))

# oot
SRC_OOT := circular_flipped.jpg \
				   direct.png \
				   grid.jpg \
				   hierarchical_flipped.jpg \
				   hierarchical.jpg \
				   modules.png \
				   leadto.tex \
				   unused.tex
DIR_OOT := oot
SRC_OOT := $(addprefix $(DIR_OOT)/, $(SRC_OOT))

# root
SRC_IMG := Neo4j_Browser.PNG \
					 static-CAS-small.pdf \
					 timings.tex \
					 structure.tex \
				   $(SRC_REGEXP) \
				   $(SRC_OOT)
DIR_IMG := img
SRC_IMG := $(addprefix $(DIR_IMG)/, $(SRC_IMG))

all: main.pdf proposal.pdf progress.pdf

main.pdf: $(SRC_MAIN) $(SRC_PROP) $(SRC_IMG) | $(BUILD)
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
