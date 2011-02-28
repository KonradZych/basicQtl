\name{un_neighbor}
\alias{un_drop_markers}
\title{ordering markers on chromosome}

\description{
	Some methods used to order markers on chromosome.
}

\usage{
	\itemize{
		\item{un_neighbor(chrom_matrix,method=1,nr_iterations=1000,groups=5)}
		\item{un_drop_markers(cor_matrix)}
	}
}

\arguments{
  \itemize{
  \item{un_neighbor}
  \itemize{
	\item{chrom_matrix} - matrix containing genotypic data with messed ordering of markers
	\item{method} - 1 for corelation 2 for recombination
	\item{nr_iterations} - how many times clustering will be done
	\item{groups} - how many groups (chromosomes) thera is in the dataset
  }
  \item{un_drop_markers}
  \itemize{
	\item{cor_matrix} - matrix containing corelation data
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