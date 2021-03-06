\name{un_recombination}
\alias{un_recombination}
\title{calculating recombination factor}
\description{
	Recombination factor calculation.
}
\usage{
	un_recombination(chrom_matrix)
}
\arguments{
	\item{chrom_matrix}{ - matrix containing numeric data}
}
\details{
	No Details.
}

\value{
	\item{return}{ - matrix containing numeric data}
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
      \item \code{\link{persp_qtl_map}} - produces nice and highly informative perspective plot of QTL map
	  \item \code{\link{un_recombination}} - Calculates recombination factor between two markers
    }
}

\examples{
  un_reco <- un_recombination(un_matrix)
}