manuscript_name = manuscript

manuscript_src:= $(manuscript_name).Rnw
manuscript_tex:= $(manuscript_name).tex
manuscript_bib = rotl-manuscript.bib
manuscript_pdf:= $(manuscript_name).pdf
manuscript_app:= $(manuscript_name)-appendix.pdf

ARTIFACTS=$(manuscript_pdf) \
	$(manuscript_tex) \
	$(manuscript_app) \
	$(manuscript_name)-no_app.pdf \
	cache \
	figure

all: $(manuscript_tex) $(manuscript_app) $(manuscript_doc) clean-partial
	-cp ~/Library/$(manuscript_bib) .
	-xelatex -interaction=nonstopmode "\input" $<
	-bibtex $(manuscript_name)
	-xelatex -interaction=nonstopmode "\input" $<
	-xelatex -interaction=nonstopmode "\input" $<
	xelatex -interaction=nonstopmode "\input" $<
	mv $(manuscript_pdf) $(manuscript_name)-no_app.pdf
	pdftk $(manuscript_name)-no_app.pdf $(manuscript_app) cat output $(manuscript_pdf)
	rm $(manuscript_name)-no_app.pdf
	rm $(manuscript_app)

$(manuscript_tex): $(manuscript_src)
	Rscript -e "knitr::knit('$<')"

$(manuscript_app): $(manuscript_src) create_appendix.R
	Rscript -e "source('create_appendix.R')"
	rm $(manuscript_name).R
	rm $(manuscript_name)-appendix.Rmd

clean-partial:
	-rm *.out
	-rm *.bbl
	-rm *.blg
	-rm *.aux
	-rm *.log
	-rm *~

clean: clean-partial
	-rm $(manuscript_pdf)
	-rm $(manuscript_tex)
	-rm $(manuscript_app)

clear-cache:
	-rm -rf ./cache

distclean:
	rm -f $(ARTIFACTS)
