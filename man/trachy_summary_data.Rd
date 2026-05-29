\name{trachy$summary_data} 
\alias{trachy$summary_data} 
\alias{trachy_summary_data} 
\title{Retrieve trachy dummary data with p-values, effect sizes etc} 
\description{Retrieve the summary data ready for export into Excel etc.} 
\usage{trachy_summary_data(mdata,spec)} 
\arguments{ 
  \item{mdata}{The preprocessed data frame, sign vignette for example.} 
  \item{spec}{abbreviated species names like 'Tdel', 'Tger' etc, vector of length of nrow(mdata)} 
} 
\value{data frame with summary data} 
\examples{ 
meta <- trachy$tdata(name = "meta") 
fmly=trachy$tdata('family') 
mdata=merge(fmly,unique(meta[,c('habitat','code','seasonal')])) 
species=list(vmt="Tdel",vht="That",vb="Tger",vx="Tcre") 
spec=gsub("_.+","",mdata$code) 
head(spec) 
spec = unlist(species[spec]) 
} 
\seealso{\link[trachy:trachy-package]{trachy-package}} 
