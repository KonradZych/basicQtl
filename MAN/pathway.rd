\name{pathway}
\title{linear pathway creation}
\description{
	Basic QTL mapping.
}
\usage{
	pathway(result_matrix,marker)
}
\arguments{
	\item{result_matrix}{ - matrix containing qtl data}
	\item{marker}{ - number of marker to use}
}
\details{
	No Details.
}

\value{
	\item{return}{ - linear pathway proposition}
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
	  \item \code{\link{heatmapqtl}} - Basic QTL mapping currently done using qtlbyttest for every marker in dataset
	  }
}

\examples{
  result_binary<-heatmapqtl(makebinary(clean(phenotypes)),genotypes)
  path<-pathway(result_binary, 100)
  path
}