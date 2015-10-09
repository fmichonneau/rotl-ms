manuscript_name = manuscript

manuscript_src:= $(manuscript_name).Rnw
manuscript_tex:= $(manuscript_name).tex
manuscript_bib = rotl-manuscript.bib
manuscript_pdf:= $(manuscript_name).pdf

all: $(manuscript_tex) clean-partial
	-cp ~/Library/$(manuscript_bib) .
	-xelatex -interaction=nonstopmode "\input" $<
	-bibtex $(manuscript_name)
	-xelatex -interaction=nonstopmode "\input" $<
	xelatex -interaction=nonstopmode "\input" $<

$(manuscript_tex): $(manuscript_src)
	Rscript -e "knitr::knit('$<')"

clean-partial:
	-rm *.bbl
	-rm *.blg
	-rm *.aux
	-rm *.log
	-rm *~

clean: clean-partial
	-rm $(manuscript_pdf)
	-rm $(manuscript_tex)
