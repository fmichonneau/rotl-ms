[![Build Status](https://travis-ci.org/fmichonneau/rotl-ms.svg?branch=master)](https://travis-ci.org/fmichonneau/rotl-ms)

# Manuscript describing `rotl`

[`rotl`](https://github.com/ropensci/rotl) is an R package that can be used to
query and download subsets of the synthetic Open Tree of Life directly in
R. This repository contains a manuscript describing this package and how to get
started with it.

A pre-print is available at the
[PeerJ PrePrints](https://peerj.com/preprints/1471/) and can be cited as:

> Michonneau F, Brown JW, Winter D. (2015) rotl, an R package to interact with
> the Open Tree of Life data. PeerJ PrePrints 3:e1834
> <https://dx.doi.org/10.7287/peerj.preprints.1471v1>

# How to build the manuscript?

The manuscript is reproducible but you might need to install tools and packages
to make it work. In short, you will need (for more details look at the list of
Ubuntu packages that are needed in the [.travis.yml](.travis.yml) file):

* R packages
    * Stable versions of [rgbif](https://cran.r-project.org/package=rgbif),
      [ggplot2](https://cran.r-project.org/package=ggplot2),
      [maps](https://cran.r-project.org/package=maps), and
      [knitr](https://cran.r-project.org/package=knitr).
    * The development version of [rotl](https://github.com/ropensci/rotl)

* LaTeX installation

* pdftk

* Fonts
  * [Crimson text](http://www.fontsquirrel.com/fonts/crimson)
  * [Source Sans Pro](http://www.fontsquirrel.com/fonts/source-sans-pro)
