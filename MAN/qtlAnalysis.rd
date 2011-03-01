\name{qtlAnalysis}
\title{Basic QTL mapping}

\description{
	Basic QTL mapping.
}

\usage{
	qtlAnalysis(working_dir, genotypes_file, phenotypes_file, output_image_file)
	}

\arguments{
	\item{working_dir}{ - working directory}
	\item{genotypes_file}{ - file containing genotypic data}
	\item{phenotypes_file}{ - file containing phenotypic data}
	\item{output_image_file}{ - name of file for output perspective plot}
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
      \item \code{\link{qtlbyttest}} - Single marker mapping by using t-test statistics
      \item \code{\link{pathway}} - Basic pathway creation using single marker
	  \item \code{\link{heatmapqtl}} - Basic QTL mapping currently done using qtlbyttest for every marker in dataset
	  }
}

\examples{
  qtlAnalysis ("D:/data","genotypes.txt","phenotypes.txt","QTL_map.png")
  #this will work only for me;p
}