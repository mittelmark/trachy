\name{trachy$tdata} 
\alias{trachy$tdata} 
\alias{trachy_tdata} 
\title{Retrieve trachy data sets} 
\description{Retrieve the trachy data sets for analysis.} 
\usage{trachy_tdata(name)} 
\arguments{ 
  \item{name}{The name of the data set. Currently supported: 'meta' the Meta data 
    of the collection and 'family' the raw microbiome data on plant family level, default: 'meta'). 
  } 
} 
\details{ 
The following data sets are supported: 
\describe{ 
  \item{\code{meta}}{Data set with meta data about the collected sample.} 
  \item{\code{family}}{The microbiome gene data on plant family base.} 
  \item{\code{genus}}{The microbiome gene data on plant genus base.} 
} 
} 
\references{ 
  \itemize{ 
    \item Truong et. al.(2026).: DNA metabarcoding reveals dietary adaptations of Trachypithecus langurs in limestone and rainforest habitats. (in preparation) 
  } 
} 
\value{data frame  for the selected data set} 
\examples{ 
meta <- trachy$tdata(name = "meta") 
head(meta) 
with(meta,table(species,habitat,seasonal)) 
} 
\seealso{\link[trachy:trachy-package]{trachy-package}} 
