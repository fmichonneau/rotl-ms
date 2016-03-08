Dear Professor Freckleton, 

We thank the associate editor and reviewer for their comments, which have
improved our manuscript and the software it describes. Here provide detailed
replies to specific comments.

## Associate Editor

>The only code related thing that jumped out at me was to avoid
>`httr::content(req)` but to check the returned media type is as
>expected and do the json to R conversion manually (see
>`?httr::content`).

Thank you for this suggestion, we now only call httr::content to extract plain
text from request objects, and parse the results manually.

> l. 82: indicate that the api version can be selected?

> l. 97, and elsewhere: It's awkward in R but I don't think that
>`ape::phylo` is a good way of referring to the phylo class given it's
>not strictly namespaced.  "ape's `phylo` objects" perhaps?

In the first instance we now say "and are represented using the `ape` tree structure 
(objects of class `phylo`)". Elsewhere we simply refer to `phylo` objects.

>l. 100: the use of ncl is nice, especially with treatment of things
>like singletons.  Are these collapsed on import?  I believe in some
>versions of ape these will crash R when plotted.

[ francois? ]

>l. 102: "two vignettes" -> "three vignettes"
Done

>l. 109: here, and in a few places the paper gets very acronym heavy
>"OTL taxonomy (OTT) using the TNRS".  Consider rephrasing to get the
>intent across here (especially as I think in this is a really key
>point that may be obscured by all the acronyms) -- the data you have
>and the data that the service have need to be reconciled.

We have expanded this section a little, hopefully making the context clearer:

_Before a researcher can use the Open Tree to retrieve relationships among a set
of taxa, they first need to match the taxon names in their dataset with records
in the Open Tree Taxonomy (OTT). The TNRS allows users to search for taxon
names, and retreive identifiers for each matching taxon. We demonstrate the use
of the TNRS within `rotl` by searching for taxonomic records associated
with several model organisms._


>l. 118: "henihomonyms" may warrant a definition or replacement with
>something simpler.

replaced with "names that may represent valid taxa in more than one code."

>l. 136: it would be nice to know how many studies have been entered
>here, especially as a fraction of published trees.

[Ask Karen?]

>l. 143, code block: The "ot:focalCladeOTTTaxonName" bit here warrants
>some clarification, especially as to where a list of valid properties
>can be found.  This is not indicated in the help for
>`studies_find_studies` so a link there too (I presume to the OTL API
>docs) would be nice.

This is now explicitedly included in the documentation of
`studies_find_studies`. [djw note: do we want to reword this paragraph to make
it even clearer?]


>l. 164: Is there interaction here with taxize for TNRS?

Not at present, though there certainly could be.
