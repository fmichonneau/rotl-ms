Dear Professor Freckleton,

We thank the associate editor and reviewer for their comments, which have
improved our manuscript and the software it describes. Here we provide detailed
replies to specific comments.

## Associate Editor

>The only code related thing that jumped out at me was to avoid
>`httr::content(req)` but to check the returned media type is as
>expected and do the json to R conversion manually (see
>`?httr::content`).

Thank you for this suggestion, we now only call `httr::content` to extract plain
text from request objects, and parse the results manually.

> l. 82: indicate that the api version can be selected?

We added: _and other versions of the API can be selected by the user as they
become available._

> l. 97, and elsewhere: It's awkward in R but I don't think that
>`ape::phylo` is a good way of referring to the phylo class given it's
>not strictly namespaced.  "ape's `phylo` objects" perhaps?

In the first instance we now say "and are represented using the `ape` tree structure
(objects of class `phylo`)". Elsewhere we simply refer to `phylo` objects.

>l. 100: the use of ncl is nice, especially with treatment of things
>like singletons.  Are these collapsed on import?  I believe in some
>versions of ape these will crash R when plotted.

We added: _Singleton nodes are collapsed after the tree has been parsed, making
the resulting \texttt{phylo} object compatible with all functions from the
\texttt{ape} package._

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

We added this information. See 1st paragraph of "Getting trees from studies".

>l. 143, code block: The "ot:focalCladeOTTTaxonName" bit here warrants
>some clarification, especially as to where a list of valid properties
>can be found.  This is not indicated in the help for
>`studies_find_studies` so a link there too (I presume to the OTL API
>docs) would be nice.

This is now explicitedly included in the documentation of
`studies_find_studies`, and a link to the definition of the properties is
provided in the manuscript.

>l. 164: Is there interaction here with taxize for TNRS?

Not at present, but it's currently in progress. See:
https://github.com/ropensci/taxize/issues/517

## Reviewer 1

> One thing I thought was missing was a discussion about the importance of rolt
> to the field of ecology.

We added a paragraph (l. xxx-xxx) that describes how `rotl` can be used as a
data source for community phylogenetics.

> 1) Can user generated trees be easily incorporated into an output tree from
> rotl? Perhaps by implementing some of the algorithms used to integrate the
> studies that comprise the OTL? For example, if I generated a tree for a genus
> that was not yet in the OTL, could I add it into its family in the rotl
> interface, or would I have to go through the curator interface?

It's an interesting idea. If a researcher wants to include a better resolved
tree than what is available in Open Tree, it is relatively straightforward to
swap a monophyletic group by another one using the functions provided by
`ape`. However, we feel that providing this kind of functionality falls beyond the
scope of our package, whose main purpose is to provide an interface to the OTL
API.

> 2) I was a bit confused about why the authors chose to include the GBIF
> example in the appendix, but not the other vignettes. Why not just add it as
> another vignette, or include the other vignettes as appendices as well? A
> small detail perhaps, but this makes the paragraph before the concluding
> remarks a bit vague.

We included the code for the GBIF example as an appendix as it seemed too long
to be included in the text of the manuscript, and not long enough to warrant its
own vignette. We didn't include the other vignettes in appendix to ensure that
we can update the code they include in case the API changes.

> 3) How might rolt be combined with trait databases? This was briefly mentioned
> at the end of the vignette “Connecting data to Open Tree trees”, but might be
> mentioned in the manuscript as well (for example, in the subsection “How does
> rotl fit into the R package ecosystem?”).

We added a paragraph to highlight that rotl can be used to provide a
phylogenetic context to available trait data.

> Page 1, paragraph 1: A comment about the importance of phylogenies for ecology
> could be added here…

Done

> Page 2, paragraph 3, lines 39-41: This sentence is a bit awkward—perhaps
> remove the comma?

Done

> Page 3, paragraph 1, line 58: Other recently developed R packages that relate
> to rotl might be mentioned, including taxize (taxonomy congruence),
> phyloGenerator (generate phylogenies for ecologists) and pez (for calculating
> suites of metrics for community phylogenetics).

We added a paragraph about the use of phylogenetics in community ecology,
inclding a description of R packages that can be used for these analysis [Pg
Line]

> Page 4, point #2: So not all studies that can be queried through the API were
> included in the OTL? Perhaps this can be explained a bit more here (or in the
> “Getting trees from studies” subsection).

We added the number of studies that have been submitted through the curator
app, and the number of studies that contribute to the synthetic tree to clarify
this point. 

"As of March 2016, the Open Tree of Life project stores 7755 trees from 3399 
studies (each having between 0 and 61 trees), and 477 of these trees are used 
to assemble the synthetic tree."

> Page 9, line 150: What type of metadata can be extracted from a study? Is it
> just the citation (which is the example given in “How to use rotl?” vignette)?

There is a lot more information associated with each study. We re-worded the
paragraph to mention some of them.

"Metadata about the study (e.g., citation information, information about
the curator for the study, and other technical information regarding the import
of this study) can be obtained using the function `get_study_meta`

> Page 10, paragraph 2, line 169: “other data” is a bit vague. Integration with
> other data, for example species distribution data, is demonstrated in the
> appendix (but not the main manuscript)

We re-wrote this paragraph to be more specific about the type of data that can
be linked to the phylogenies storred in `rotl`.
