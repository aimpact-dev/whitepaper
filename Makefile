# Makefile for LaTeX project

# Main document
MAIN = main
TEX = $(MAIN).tex
PDF = $(MAIN).pdf

# LaTeX compiler
LATEX = pdflatex
BIBTEX = bibtex

# Default target
all: $(PDF)

# Compile PDF with bibliography
$(PDF): $(TEX)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

# Quick compile (no bibliography)
quick: $(TEX)
	$(LATEX) $(MAIN)

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.out *.fdb_latexmk *.fls *.synctex.gz

# Clean everything including PDF
clean-all: clean
	rm -f $(PDF)

# Watch and auto-compile (requires latexmk)
watch:
	latexmk -pdf -pvc $(MAIN)

# Count words (requires texcount)
count:
	texcount $(TEX)

# Help
help:
	@echo "Available targets:"
	@echo "  all       - Compile PDF with bibliography (default)"
	@echo "  quick     - Quick compile without bibliography"
	@echo "  clean     - Remove auxiliary files"
	@echo "  clean-all - Remove all generated files including PDF"
	@echo "  watch     - Auto-compile on changes (requires latexmk)"
	@echo "  count     - Count words (requires texcount)"
	@echo "  help      - Show this help message"

.PHONY: all quick clean clean-all watch count help 