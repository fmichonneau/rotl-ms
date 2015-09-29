manuscript_name = manuscript

manuscript_src:= $(manuscript_name).Rnw
manuscript_tex:= $(manuscript_name).tex
manuscript_bib = rotl-manuscript.bib
manuscript_pdf:= $(manuscript_name).pdf

all: $(manuscript_tex) $(manuscript_bib) clean-partial
	-xelatex -interaction=nonstopmode "\input" $<
	-bibtex $(manuscript_name)
	-xelatex -interaction=nonstopmode "\input" $<
	xelatex -interaction=nonstopmode "\input" $<
	-rm $(manuscript_bib)

$(manuscript_tex): $(manuscript_src)
	Rscript -e "knitr::knit('$<')"

$(manuscript_bib):
	-cp ~/Library/$(manuscript_bib) .

clean-partial:
	-rm *.bbl
	-rm *.blg
	-rm *.aux
	-rm *.log
	-rm *~

clean: clean-partial
	-rm $(manuscript_pdf)
	-rm $(manuscript_tex)
