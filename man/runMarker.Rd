% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runMarker.R
\name{runMarker}
\alias{runMarker}
\title{Run identification of unique biomarkers}
\usage{
runMarker(
  moic.res = NULL,
  dea.method = c("deseq2", "edger", "limma"),
  prefix = NULL,
  dat.path = getwd(),
  res.path = getwd(),
  p.cutoff = 0.05,
  p.adj.cutoff = 0.05,
  dirct = "up",
  n.marker = 200,
  doplot = TRUE,
  norm.expr = NULL,
  annCol = NULL,
  annColors = NULL,
  clust.col = c("#2EC4B6", "#E71D36", "#FF9F1C", "#BDD5EA", "#FFA5AB", "#011627",
    "#023E8A", "#9D4EDD"),
  halfwidth = 3,
  centerFlag = TRUE,
  scaleFlag = TRUE,
  show_rownames = FALSE,
  show_colnames = FALSE,
  color = c("#5bc0eb", "black", "#ECE700"),
  fig.path = getwd(),
  fig.name = NULL,
  width = 8,
  height = 8,
  ...
)
}
\arguments{
\item{moic.res}{An object returned by `getMOIC()` with one specified algorithm or `get\%algorithm_name\%` or `getConsensusMOIC()` with a list of multiple algorithms.}

\item{dea.method}{A string value to indicate the algorithm for differential expression analysis. Allowed value contains c('deseq2', 'edger', 'limma').}

\item{prefix}{A string value to indicate the prefix of differential expression file (use for searching files).}

\item{dat.path}{A string value to indicate the path for saving the files of differential expression analysis.}

\item{res.path}{A string value to indicate the path for saving the results for identifying subtype-specific markers.}

\item{p.cutoff}{A numeric value to indicate the nominal p value for identifying significant markers; pvalue < 0.05 by default.}

\item{p.adj.cutoff}{A numeric value to indicate the adjusted p value for identifying significant markers; padj < 0.05 by default.}

\item{dirct}{A string value to indicate the direction of identifying significant marker. Allowed values contain c('up', 'down'); `up` means up-regulated marker, and `down` means down-regulated marker.}

\item{n.marker}{A integer value to indicate how many top markers sorted by log2fc should be identified for each subtype; 200 by default.}

\item{doplot}{A logic value to indicate if generating heatmap by using subtype-specific markers. TRUE by default.}

\item{norm.expr}{A matrix of normalized expression data with rows for genes and columns for samples; FPKM or TPM without log2 transformation is recommended.}

\item{annCol}{A data.frame storing annotation information for samples.}

\item{annColors}{A list of string vectors for colors matched with annCol.}

\item{clust.col}{A string vector storing colors for annotating each subtype at the top of heatmap.}

\item{halfwidth}{A numeric vector to assign marginal cutoff for truncating values in data; 3 by default.}

\item{centerFlag}{A logical vector to indicate if expression data should be centered; TRUE by default.}

\item{scaleFlag}{A logical vector to indicate if expression data should be scaled; TRUE by default.}

\item{show_rownames}{A logic value to indicate if showing rownames (feature names) in heatmap; FALSE by default.}

\item{show_colnames}{A logic value to indicate if showing colnames (sample ID) in heatmap; FALSE by default.}

\item{color}{A string vector storing colors for heatmap.}

\item{fig.path}{A string value to indicate the output path for storing the marker heatmap.}

\item{fig.name}{A string value to indicate the name of the marker heatmap.}

\item{width}{A numeric value to indicate the width of output figure.}

\item{height}{A numeric value to indicate the height of output figure.}

\item{...}{Additional parameters pass to \link[ComplexHeatmap]{pheatmap}.}
}
\value{
A figure of subtype-specific marker heatmap (.pdf) if \code{doPlot = TRUE} and a list with the following components:

        \code{unqlist}   a string vector storing the unique marker across all subtypes.

        \code{templates} a data.frame storing the the template information for nearest template prediction, which is used for verification in external cohort.

        \code{dirct}     a string value indicating the direction for identifying subtype-specific markers.

        \code{heatmap}   a complexheatmap object.
}
\description{
This function aims to identify uniquely and significantly expressed (overexpressed or downexpressed) biomarkers for each subtype identified by multi-omics integrative clustering algorithms. Top markers will be chosen to generate a template so as to run nearest template prediction for subtype verification.
}
\examples{
# There is no example and please refer to vignette.
}
\references{
Gu Z, Eils R, Schlesner M (2016). Complex heatmaps reveal patterns and correlations in multidimensional genomic data. Bioinformatics, 32(18):2847-2849.
}
