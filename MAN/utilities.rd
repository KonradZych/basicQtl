\name{utilities}
\alias{persp_qtl_map}
\title{utilities - ploting routine and others}

\description{
	Ploting routine, recombination and making binary
}

\usage{
	persp_qtl_map(genotypes, result_matrix, output_file)
}

\arguments{
	\item{genotypes}{ - matrix containing genotypic data}
	\item{result_matrix}{ - matrix containing QTL mapping data}
	\item{output_file}{ - name of the output image file}
  }


\details{
	No Details.
}

\value{
	\item{return}{ - image written to file, no return}
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
	  \item \code{\link{makebinary}} - Produces binary matrix from dataset by splitting it by specified treshold
	  \item \code{\link{un_recombination}} - Calculates recombination factor between two markers
    }
}

\examples{
  	result_binary <- heatmapqtl(makebinary(clean(phenotypes)),genotypes)
	persp_qtl_map(genotypes,result_binary,"image.png")
}