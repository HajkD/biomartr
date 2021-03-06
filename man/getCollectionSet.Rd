% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCollectionSet.R
\name{getCollectionSet}
\alias{getCollectionSet}
\title{Retrieve a Collection: Genome, Proteome, CDS, RNA, GFF, Repeat Masker, AssemblyStats of multiple species}
\usage{
getCollectionSet(
  db = "refseq",
  organisms,
  reference = FALSE,
  release = NULL,
  clean_retrieval = FALSE,
  gunzip = TRUE,
  update = FALSE,
  remove_annotation_outliers = TRUE,
  path = "set_collections"
)
}
\arguments{
\item{db}{a character string specifying the database from which the collection
shall be retrieved:
\itemize{
\item \code{db = "refseq"}
\item \code{db = "genbank"}
\item \code{db = "ensembl"}
}}

\item{organisms}{a character vector storing the scientific names of the organisms for
which collections shall be retrieved. There are three options to characterize an organism:
\itemize{
\item by \code{scientific name}: e.g. \code{organism = "Homo sapiens"}
\item by \code{database specific accession identifier}: e.g. \code{organism = "GCF_000001405.37"} (= NCBI RefSeq identifier for \code{Homo sapiens})
\item by \code{taxonomic identifier from NCBI Taxonomy}: e.g. \code{organism = "9606"} (= taxid of \code{Homo sapiens})
}}

\item{reference}{a logical value indicating whether or not a collection shall be downloaded if it isn't marked in the database as either a reference genome or a representative genome.}

\item{release}{the database release version of ENSEMBL (\code{db = "ensembl"}). Default is \code{release = NULL} meaning that the most recent database version is used.}

\item{clean_retrieval, }{a logical, default FALSE. Cleaning file names for more convenient
downstream processing.}

\item{gunzip}{a logical value indicating whether or not files should be unzipped.}

\item{update}{a logical, default FALSE. The existing file will be retained if existing.
If TRUE, will download and overwrite the file.}

\item{remove_annotation_outliers}{shall outlier lines be removed from the input annotation_file?
If yes, then the initial annotation_file will be overwritten and the removed outlier lines
will be stored at \code{\link{tempdir}} for further exploration.}

\item{path}{a character string specifying the location (a folder) in which
the corresponding collection shall be stored. Default is
\code{path} = \code{file.path("_db_downloads","collections")}.}
}
\value{
File path to downloaded genome.
}
\description{
Main collection retrieval function for an organism of interest.
By specifying the scientific name of an organism of interest a collection consisting of
the genome file, proteome file, CDS file, RNA file, GFF file, Repeat Masker file, AssemblyStats
file of the organism of interest
can be downloaded and stored locally. Collections can be retrieved from
several databases.
}
\details{
Internally this function loads the the overview.txt file from NCBI:

 refseq: ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/

 genbank: ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/

and creates a directory '_ncbi_downloads/collection' to store
the genome of interest as fasta file for future processing.
In case the corresponding fasta file already exists within the
'_ncbi_downloads/collection' folder and is accessible within the workspace,
no download process will be performed.
}
\examples{
\dontrun{
# define scientific names of species for which
# collections shall be retrieved
organism_list <- c("Arabidopsis thaliana",
                   "Arabidopsis lyrata",
                   "Capsella rubella")
# download the collection of Arabidopsis thaliana from refseq
# and store the corresponding genome file in '_ncbi_downloads/collection'
 getCollectionSet( db       = "refseq",
             organism = organism_list,
             path = "set_collections")
}

}
\seealso{
\code{\link{getCollection}}, \code{\link{getGenomeSet}}, \code{\link{getProteomeSet}}, \code{\link{getCDSSet}},
\code{\link{getGenome}}, \code{\link{getProteome}}, \code{\link{getCDS}},
\code{\link{getGFF}}, \code{\link{getRNA}}, \code{\link{meta.retrieval}},
\code{\link{read_genome}}
}
\author{
Hajk-Georg Drost
}
