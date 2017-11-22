NAME=journal
TEX=${NAME}.tex
PDF=${NAME}.pdf

.phony: all
all:
	latexmk -pdf ${TEX}

.phony: clean tidy
clean: tidy
	$(RM) ${PDF}
tidy:
	$(RM) *.aux *.dvi *.fdb *.fls *.log *.fdb_latexmk
