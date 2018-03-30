NAME=report
TEX=${NAME}.tex
PDF=${NAME}.pdf

.phony: all
all:
	latexmk -pdf ${TEX}

.phony: clean tidy
clean: tidy
	$(RM) ${PDF}
tidy:
	$(RM) *.aux *.bbl *.bcf *.blg *.dvi *.fdb *.fdb_latexmk *.fls *.log *.out *.run.xml *.toc *_vimtex_* *.synctex.gz
