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
\value{data frame with summary data with the following columns: 
\describe{ 
\item{max}{the maximumn value for all species in percent} 
\item{kt.pvalue}{the p-value for the Kruskal-Wallis test} 
\item{epsq}{the epsilon squared effect size for the Kruskal-Wallis test} 
\item{wt.habitat.pvalue}{the p-value of a Wilcoxon test for the comparison of Tcre vs Tdel+Tger+That} 
\item{wt.habitat.r}{the Wilcoxon effect size (r) for that Wilcoxon test for the comparison of Tcre vs Tdel+Tger+That} 
\item{wt.habspec.pvalue}{the p-value of a Wilcoxon test for the comparison of Tcre+Tger vs Tdel+That} 
\item{wt.habspec.r}{the Wilcoxon effect size (r) for that Wilcoxon test for the comparison of Tcre+Tger vs Tdel+That} 
\item{Tcre}{'Tdel','Tger','That' - the mean values for these species} 
\item{C}{the mean value for 'Tcre'} 
\item{DGH}{the mean values for the three species  'Tdel','Tger' and 'That' taken together} 
\item{CH}{the mean value for 'Tcre' and 'Tger' taken together} 
\item{DH}{the mean values for the three species  'Tdel', and 'That' taken together} 
\item{PC1}{the loadings/rotations for the first component of the original data log2(x+1) transformed} 
\item{PC2}{the loadings/rotations for the second component of the original data log2(x+1) transformed} 
} 
} 
\examples{ 
meta <- trachy$tdata(name = "meta") 
fmly=trachy$tdata('family') 
mdata=merge(fmly,unique(meta[,c('habitat','code','seasonal')])) 
species=list(vmt="Tdel",vht="That",vb="Tger",vx="Tcre") 
spec=gsub("_.+","",mdata$code) 
head(spec) 
spec = unlist(species[spec]) 
R=trachy$summary_data(mdata,spec) 
sset=R[,c('max','wt.habitat.pvalue','wt.habitat.r','C','DGH')] 
idx=which(sset[,'C']<sset['DGH']) 
sset$wt.habitat.r[idx]=sset$wt.habitat.r[idx]*-1 
idx=which(sset$wt.habitat.pvalue<0.05 & sset$max>1) 
sset=sset[idx,] 
sset=sset[order(abs(sset$wt.habitat.r),decreasing=TRUE),] 
trachy_es_plot(sset$wt.habitat.r[1:10],substr(rownames(sset)[1:10],1,4),main="Tcre vs Tdel+Tger+That", 
  ylab="Wilcoxon Effect Size (r)") 
} 
\seealso{\link[trachy:trachy-package]{trachy-package}} 
