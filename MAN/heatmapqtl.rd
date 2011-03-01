\name{heatmapqtl}
\alias{heatmapqtl}
\title{creating QTL map}
\description{
	Basic QTL mapping.
}
\usage{
	heatmapqtl(phenotypes,genotypes)
}
\arguments{
		\item{phenotypes}{ - matrix containing phenotypic data}
		\item{genotypes}{ - matrix containing genotypic data}
}
\details{
	No Details.
}

\value{
	\item{return}{ - resulting QTL map matrix}
  }
  
  \references{
  TODO
}

\author{ 
	Konrad Zych \email{konrad.zych@uj.edu.pl}
	Maintainer: Konrad Zych \email{konrad.zych@uj.edu.pl}
	Under tender patronage of: Danny Arends \email{Danny.Arends@gmail.com}
}

\seealso{
	\itemize{
   \item \code{\link{qtlbyttest}} - Single marker mapping by using t-test statistics
      \item \code{\link{pathway}} - Basic pathway creation using single marker
	  }}

\examples{
  result_binary<-heatmapqtl(makebinary(clean(phenotypes)),genotypes)
  image(result_binary)
}