% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/listGenomes.R
\name{listGenomes}
\alias{listGenomes}
\title{List All Available Genomes either by kingdom, group, or subgroup}
\usage{
listGenomes(db = "refseq", type = "all", subset = NULL, details = FALSE)
}
\arguments{
\item{db}{a character string specifying the database for which genome 
availability shall be checked. Available options are:
\itemize{
\item \code{db = "refseq"} 
\item \code{db = "genbank"}
\item \code{db = "ensembl"}
}}

\item{type}{a character string specifying a potential filter of available 
genomes. Available options are:
\itemize{
\item \code{type = "all"}
\item \code{type = "kingdom"} 
\item \code{type = "group"}
\item \code{type = "subgroup"}
}}

\item{subset}{a character string or character vector specifying a subset of 
\code{type}. E.g. if users are interested in retrieving all
\code{Eukaryota} species, they can specify: \code{type = "kingdom"} and 
\code{subset = "Eukaryota"}.}

\item{details}{a boolean value specifying whether only the scientific names 
of stored genomes shall be returned (details = FALSE) or all information such
as 
\itemize{
\item \code{organism_name}
\item \code{kingdoms}
\item \code{group}
\item \code{subgroup} 
\item \code{file_size_MB}, etc.
}}
}
\description{
This function retrieves the names of all genomes available on 
the NCBI ftp:// server and stores the results in a file named 'overview.txt' 
inside the directory _ncbi_downloads' that is built inside the workspace.
}
\details{
Internally this function loads the the overview.txt file from NCBI 
and creates a directory '_ncbi_downloads' in the \code{temdir()}
folder to store the overview.txt file for future processing. In case the 
overview.txt file already exists within the '_ncbi_downloads' folder and is 
accessible within the workspace, no download process will be performed again.
}
\note{
Please note that the ftp:// connection relies on the NCBI or ENSEMBL server 
and cannot be accurately accessed via a proxy.
}
\examples{
\dontrun{
# print details for refseq
listGenomes(db = "refseq") 
# print details for all plants in refseq
listGenomes(db = "refseq", type = "kingdom")
# print details for all plant groups in refseq
listGenomes(db = "refseq", type = "group")
# print details for all plant subgroups in refseq
listGenomes(db = "refseq", type = "subgroup")
}
}
\author{
Hajk-Georg Drost
}
