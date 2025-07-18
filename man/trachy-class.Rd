\name{trachy-class} 
\alias{trachy-class} 
\alias{trachy} 
\title{trachy - functions for the analysis of Trachipithecus data} 
\description{This environment has some useful function required for the 
the analysis of the Trachipithecus microbiome data of Truong et. al. (2025). 
} 
\format{Object of class environment with some functions for data retrieval and analysis} 
\details{ 
\describe{ 
\item{\link[trachy:trachy_tdata]{trachy$tdata(name="meta")}}{Getting the project data} 
} 
All methods are given in two forms: first they are collected in an environment `trachy` which allow you to save this object for instance as 
a RDS file and then give it away with your analysis to allow other users to redo or extend the analysis without having to install the library.  
Secondly the methods have the trachy prefix followed by an underline which is compatbible with the default R documentation system. 
} 
\examples{ 
# list all methods 
ls(trachy) 
head(trachy$tdata("meta")) 
} 
\author{Detlef Groth <email: dgroth@uni-potsdam.de>} 
