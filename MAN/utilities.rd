\name{utilities}
\alias{persp_qtl_map}
\alias{un_recombination}
\alias{makebinary}
\title{utilities - ploting routine and others}

\description{
	Ploting routine, recombination and making binary
}

\usage{
	\itemize{
		\item{persp_qtl_map(genotypes, result_matrix, output_file)}
		\item{un_recombination(data_matrix)}
		\item{makebinary(data_matrix)}
	}
}

\arguments{
  \itemize{
  \item{persp_qtl_map}
  \itemize{
	\item{genotypes} - matrix containing genotypic data
	\item{result_matrix} - matrix containing QTL mapping data
	\item{output_file} - name of the output image file
  }
  \item{un_recombination}
  \itemize{
	\item{data_matrix} - matrix containing numeric data
  }
  \item{makebinary}
  \itemize{
	\item{data_matrix} - matrix containing numeric data
  }
  }
}

\details{
	No Details.
}

\value{
  \itemize{
  \item{persp_qtl_map}
  \itemize{
	\item{return} - image written to file, no return
  }
  \item{un_recombination}
  \itemize{
	\item{return} - matrix containing numeric data
  }
  \item{makebinary}
  \itemize{
	\item{return} - matrix containing numeric data
  }
  }
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
  TODO
}

\examples{
  #TODO
}