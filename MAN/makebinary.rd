\name{makebinary}
\alias{makebinary}
\alias{matrix_to_be_made_binary}
\title{making binary matrix}
\description{
	Splitting matrix into binary data using treshold value.
}
\usage{
	makebinary(matrix_to_be_made_binary)
}
\arguments{
	\item{matrix_to_be_made_binary}{ - matrix containing numeric data}
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
  binary <- makebinary(phenotypes)
}