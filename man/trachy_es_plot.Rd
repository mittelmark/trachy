\name{trachy$es_plot} 
\alias{trachy$es_plot} 
\alias{trachy_es_plot} 
\title{ Plot a effect sizes using a barplot like display } 
\description{ 
    This is a convinience method to plot a vector of effect size values and names using a barplot. 
} 
\usage{ trachy_es_plot(x,names,col=c('skyblue','salmon'),  
 ylab="Effect Size", ylim=c(-1,1), ...)  
} 
\arguments{ 
  \item{x}{ 
    vector of values in the range of -1 to 1 usually. 
  } 
  \item{names}{ 
    the labels which should be displayed below or above of the bars. 
  } 
  \item{col}{vector of two colors, for positive effect sizes the first element, for negative ones the second, default: c('skyblue','salmon')} 
  \item{ylab}{label for the y-axis, default' 'Effect Size')} 
  \item{ylim}{the limits for the y-axis, default: c(-1,1)} 
  \item{\ldots}{delegating all remaining arguments to the internal plot call} 
} 
\value{NULL} 
\examples{ 
trachy_es_plot(runif(10,min=-1,max=1),LETTERS[1:10],main="sample effect sizes") 
} 
\seealso{ 
   \link[trachy:trachy-class]{trachy-class}  
} 
 
