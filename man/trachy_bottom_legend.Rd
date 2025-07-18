\name{trachy$bottom_legend} 
\alias{trachy$bottom_legend} 
\alias{trachy_bottom_legend} 
\title{ Adds a legend below of the current plot } 
\description{ 
    This is a convinience method to plot a legend below of the current plot. 
} 
\usage{ trachy_bottom_legend(labels,col='grey80',pch=15,side="bottom",cex=2,...) } 
\arguments{ 
  \item{labels}{labels for the legend} 
  \item{col}{colors for the plotting chars, default: 'grey80'} 
  \item{pch}{plotting symbol, default: 15} 
  \item{side}{placement of the legend, default: 'bottom'} 
  \item{cex}{character expansion for labels and pch, default: 2} 
  \item{\ldots}{arguments delegated to the legend function} 
} 
\value{NULL} 
\examples{ 
data(iris) 
trachy$mds_plot(iris[,1:4],method="manhattan") 
trachy$bottom_legend(levels(iris$Species),col=2:4,cex=1) 
} 
\seealso{ 
   \link[trachy:trachy-class]{trachy-class}  
} 
 
