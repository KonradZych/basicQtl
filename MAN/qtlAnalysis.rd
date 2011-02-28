\name{qtlAnalysis}
\alias{heatmapqtl}
\alias{qtlbyttest}
\alias{pathway}
\title{Basic QTL mapping}

\description{
	Basic QTL mapping.
}

\usage{
	\itemize{
		\item{qtlAnalysis(working_dir, genotypes_file, phenotypes_file, output_image_file)}
		\item{heatmapqtl(phenotypes,genotypes)}
		\item{qtlbyttest(phenotypes,genotypes,trait)}
		\item{pathway(result_matrix,marker)}
	}
}

\arguments{
  \itemize{
  \item{qtlAnalysis}
  \itemize{
	\item{working_dir} - working directory
	\item{genotypes_file} - file containing genotypic data
	\item{phenotypes_file} - file containing phenotypic data
	\item{output_image_file} - name of file for output perspective plot
  }
  \item{heatmapqtl}
  \itemize{
	\item{phenotypes} - matrix containing phenotypic data
	\item{genotypes} - matrix containing genotypic data
  }
   \item{qtlbyttest}
  \itemize{
	\item{phenotypes} - matrix containing phenotypic data
	\item{genotypes} - matrix containing genotypic data
	\item{trait} - number of trait to use
  }
    \item{pathway}
  \itemize{
	\item{result_matrix} - matrix containing qtl data
	\item{marker} - number of marker to use
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