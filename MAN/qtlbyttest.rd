\name{qtlbyttest}
\title{using t-test to QTL on single trait}
\description{
	Basic QTL mapping.
}
\usage{
	qtlbyttest(phenotypes,genotypes,trait)
}
\arguments{
	\item{phenotypes}{ - matrix containing phenotypic data}
	\item{genotypes}{ - matrix containing genotypic data}
	\item{trait}{ - number of trait to use}
}
\details{
	No Details.
}

\value{
	\item{return}{ - resulting QTL map vector for one trait}
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
      \item \code{\link{heatmapqtl}} - Basic QTL mapping currently done using qtlbyttest for every marker in dataset
      \item \code{\link{pathway}} - Basic pathway creation using single marker
    }
}

\examples{
  res <- qtlbyttest(phenotypes,genotypes,2)
  plot(res)
}