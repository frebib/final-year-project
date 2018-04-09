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
	$(RM) *.aux *.bbl *.bcf *.blg *.dvi *.fdb *.fdb_latexmk *.fls *.glg *.glo *.gls *.ist *.log *.out *.run.xml *.synctex\(busy\) *.synctex.gz *.toc *.xdv *.xdy *_vimtex_*
