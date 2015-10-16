knitr::purl("manuscript.Rnw", documentation = 0L)

header <- c("---",
            "title: Appendix",
            "output: pdf_document",
            "---",
            "\n",
            "Source code used to generate Figure 3.",
            "```{r, echo=TRUE, eval=FALSE}")

footer <- "```"

code_chunk <- readLines("manuscript.R")

cat(header, code_chunk, footer, sep = "\n",
    file = "manuscript-appendix.Rmd")

rmarkdown::render("manuscript-appendix.Rmd")
