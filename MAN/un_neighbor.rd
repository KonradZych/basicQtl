\name{un_neighbor}
\title{ordering markers on chromosome}

\description{
	Some methods used to order markers on chromosome.
}

\usage{
	un_neighbor(chrom_matrix,method=1,nr_iterations=1000,groups=5)
}

\arguments{
	\item{chrom_matrix}{ - matrix containing genotypic data with messed ordering of markers}
	\item{method}{ - 1 for corelation 2 for recombination}
	\item{nr_iterations}{ - how many times clustering will be done}
	\item{groups}{ - how many groups (chromosomes) thera is in the dataset}
}

\details{
	No Details.
}

\value{
	\item{return}{ - matrix containing genotypic data with corected ordering of markers}
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