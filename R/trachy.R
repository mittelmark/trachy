#' \docType{data}
#' \name{trachy-class}
#' \alias{trachy-class}
#' \alias{trachy}
#' \title{trachy - functions for the analysis of Trachipithecus data}
#' \description{This environment has some useful function required for the
#' the analysis of the Trachipithecus microbiome data of Truong et. al. (2025).
#' }
#' \format{Object of class environment with some functions for data retrieval and analysis}
#' \details{
#' \describe{
#' \item{\link[trachy:trachy_tdata]{trachy$tdata(name="meta")}}{Getting the project data}
#' }
#' All methods are given in two forms: first they are collected in an environment `trachy` which allow you to save this object for instance as
#' a RDS file and then give it away with your analysis to allow other users to redo or extend the analysis without having to install the library. 
#' Secondly the methods have the trachy prefix followed by an underline which is compatbible with the default R documentation system.
#' }
#' \examples{
#' # list all methods
#' ls(trachy)
#' head(trachy$tdata("meta"))
#' }
#' \author{Detlef Groth <email: dgroth@uni-potsdam.de>}


trachy = new.env()

#' \name{trachy$bottom_legend}
#' \alias{trachy$bottom_legend}
#' \alias{trachy_bottom_legend}
#' \title{ Adds a legend below of the current plot }
#' \description{
#'     This is a convinience method to plot a legend below of the current plot.
#' }
#' \usage{ trachy_bottom_legend(labels,col='grey80',pch=15,side="bottom",cex=2,...) }
#' \arguments{
#'   \item{labels}{labels for the legend}
#'   \item{col}{colors for the plotting chars, default: 'grey80'}
#'   \item{pch}{plotting symbol, default: 15}
#'   \item{side}{placement of the legend, default: 'bottom'}
#'   \item{cex}{character expansion for labels and pch, default: 2}
#'   \item{\ldots}{arguments delegated to the legend function}
#' }
#' \value{NULL}
#' \examples{
#' data(iris)
#' trachy$mds_plot(iris[,1:4],method="manhattan")
#' trachy$bottom_legend(levels(iris$Species),col=2:4,cex=1)
#' }
#' \seealso{
#'    \link[trachy:trachy-class]{trachy-class} 
#' }
#'

trachy$bottom_legend <- function (labels,col='grey80',pch=15,side="bottom",cex=2,...) {
    opar=par()
    options(warn=-1)
    par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
    plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
    legend(side, labels, xpd = TRUE, horiz = TRUE, inset = c(0,0), 
           bty = "n", pch = pch, col = col, cex = cex,...)
    par(opar)
}
trachy_bottom_legend = trachy$bottom_legend

#' \name{trachy$mds_plot}
#' \alias{trachy$mds_plot}
#' \alias{trachy_mds_plot}
#' \title{ Plot a data matrix or frame using Multidimensional Scaling }
#' \description{
#'     This is a convinience method to plot a data set using MDS.
#' }
#' \usage{ trachy_mds_plot(x,method="euclidean",p=0.5,row.labels=TRUE,points=FALSE,
#'         col.labels='black',cex.labels=1, pch=19, cex=1,col="grey50", grid=TRUE,
#'         group.mean=FALSE, xlab="Dim 1",ylab="Dim 2",...) }
#' \arguments{
#'   \item{x}{
#'     data frame or matrix 
#'   }
#'   \item{method}{
#'     distance measure 'euclidean', 'manhattan' or any other method supported by the dist method
#'     or 'correlation' for Pearson correlation or 'spe' or 'spearman' for Spearman correlation,
#'     default: 'euclidean'
#'   }
#'   \item{p}{
#'     exponent if distance measure is minkowski, default: 0.5
#'   }
#'   \item{row.labels}{should be row labels computed, if FALSE or if row.names are not existing, plotting characters are displayed, default: TRUE}
#'   \item{points}{should with row labels as well points be ploted, default: FALSE} 
#'   \item{col.labels}{color for text labels, default: 'black'}
#'   \item{cex.labels}{size of labels, default: 1}
#'   \item{pch}{default plotting character, default: 19}
#'   \item{cex}{default character expansion for the points, default: 1}
#'   \item{col}{default color for the points, default: 'grey50'}
#'   \item{grid}{should a grid being show, default: TRUE}
#'   \item{group.mean}{should a mean based on the given color codes being computed, default: FALSE}
#'   \item{xlab}{label for the x-axis, default: 'Dim 1'}
#'   \item{ylab}{label for the y-axis, default: 'Dim 2'}
#'   \item{\ldots}{delegating all remaining arguments to plot, points and text calls}
#' }
#' \value{NULL}
#' \examples{
#' data(iris)
#' # single plots
#' par(mfrow=c(1,2))
#' trachy$mds_plot(iris[,1:4],method="manhattan")
#' trachy$mds_plot(iris[,1:4],method="manhattan",row.labels=FALSE)
#' # multiplot
#' opar=par(mai=c(0.1,0.1,0.5,0.1))
#' trachy$mds_plot(iris[,1:4],
#'    method=c("cor","euclidean","canberra","mink","max","man"),
#'    p=0.2,row.labels=FALSE,pch=15,
#'   col=as.numeric(as.factor(iris$Species))+1)
#' par(opar)
#' }
#' \seealso{
#'    \link[trachy:trachy-class]{trachy-class} 
#' }
#'
trachy$mds_plot = function (x,method="euclidean",p=0.5,row.labels=TRUE,
                            points=FALSE,col.labels='black', 
                            cex.labels=1,pch=19,cex=1,col="grey50",
                            grid=TRUE,group.mean=FALSE,xlab="Dim 1",ylab="Dim 2",...) {
    if (length(method)>1) {
        opar=par(mfrow=c(2,ceiling(length(method)/2)))
    }
    for (m in method) {
        if (m %in% c("cor","correlation","per","pearson")) {
            # negative cor: low sim, -> high -> dissim
            d.obj=(1-stats::cor(t(x),use="pairwise.complete.obs")+1)/2
        } else if (m %in% c("spe","spearman")) {
            # negative cor: low sim, -> high -> dissim
            d.obj=(1-stats::cor(t(x),method="spearman",use="pairwise.complete.obs")+1)/2
        } else {
            d.obj=dist(x, method = m,p=p)
        }
        cmd=stats::cmdscale(d.obj)
        limits = range(cmd)
        diff=diff(limits)*0.05
        xlim=c(limits[1]-diff,limits[2]+diff)
        ylim=xlim
        if (group.mean) {
            cmd2=aggregate(cmd,by=list(col),mean)
            cmd=cmd2[,2:3]
            col=cmd2[,1]
        }
        plot(cmd,type="n",xlim=xlim,ylim=ylim,xlab=xlab,ylab=ylab, ...)
        if (grid) {
            grid(col=1,lty=2,lwd=0.5)
        }
        if (row.labels & length(rownames(x))== nrow(x)) {
            if (points) {
                points(cmd, pch=pch,col=col,cex=cex, ...)
            }
            text(cmd,labels=rownames(x),col=col.labels,cex=cex.labels)
        } else {
            print("printing points ...")
            points(cmd,pch=pch,cex=cex,col=col,...)
        }
        if (length(method)>1) {
            title(m)
        }
    }
    if (length(method)>1) {
        par(opar)
    }
}
trachy_mds_plot <- trachy$mds_plot

#' \name{trachy$tdata}
#' \alias{trachy$tdata}
#' \alias{trachy_tdata}
#' \title{Retrieve trachy data sets}
#' \description{Retrieve the trachy data sets for analysis.}
#' \usage{trachy_tdata(name)}
#' \arguments{
#'   \item{name}{The name of the data set. Currently supported: 'meta' the Meta data
#'     of the collection and 'family' the raw microbiome data on plant family level, default: 'meta').
#'   }
#' }
#' \details{
#' The following data sets are supported:
#' \describe{
#'   \item{\code{meta}}{Data set with meta data about the collected sample.}
#'   \item{\code{family}}{The microbiome gene data on plant family base.}
#'   \item{\code{genus}}{The microbiome gene data on plant genus base.}
#' }
#' }
#' \references{
#'   \itemize{
#'     \item Truong et. al.(2025).: DNA metabarcoding reveals dietary adaptations of Trachypithecus langurs in limestone and rainforest habitats. (in preparation)
#'   }
#' }
#' \value{data frame  for the selected data set}
#' \examples{
#' meta <- trachy$tdata(name = "meta")
#' head(meta)
#' with(meta,table(species,habitat,seasonal))
#' }
#' \seealso{\link[trachy:trachy-package]{trachy-package}}

trachy$tdata <- function (name="meta") {
    if (name == "meta") {
      file_path <- system.file("files", "trachy-meta.tab", package = "trachy") 
      data=read.table(file_path,sep="\t",header=TRUE)
      return(data)
  } else if (name == "family") {
      file_path <- system.file("files", "trachy-family.tab", package = "trachy") 
      data=read.table(file_path,sep="\t",header=TRUE)
      ## remove all zero columns
      idx=1:3
      for (i in 4:ncol(data)) {
          if (max(data[,i]>0)) {
              idx=c(idx,i)
          }
      }
      return(data[,idx])
  } else if (name == "genus") {
      file_path <- system.file("files", "trachy-genus.tab", package = "trachy") 
      data=read.table(file_path,sep="\t",header=TRUE)
      return(data)
  } else {
    stop("Error: Currently only 'meta', 'genus' and 'family', datasets are supported!")
  }
}
trachy_tdata = trachy$tdata
    
