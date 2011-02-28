#qtlbyttest - Basic single marker mapping by using a t.test statistic (For RIL)
#phenotypes: Matrix of row: individuals, columns: traits
#genotypes: Matrix of row: individuals, columns: markers
#trait: integer value of the column to analyse
#return: output - Vector of significance (-LOD10) of linkage to that marker
qtlbyttest <- function(phenotypes,genotypes,trait){
	output<-NULL
	phenotypes<-clean(phenotypes)
	genotypes<-clean(genotypes)
	for(m in 1:ncol(genotypes)){
		pheno_class1 <- phenotypes[which(genotypes[,m]==1),trait]
		pheno_class2 <- phenotypes[which(genotypes[,m]==2),trait]
		if(mean(pheno_class1)>=mean(pheno_class2)){
		output <- c(output,-log10(t.test(pheno_class1,pheno_class2)[[3]]))	
		}else{
		output <- c(output,log10(t.test(pheno_class1,pheno_class2)[[3]]))
		}		
	}
	output
}


#heatmapqtl - Creates data file concerning all traits and also image of it
#phenotypes: Matrix of row: individuals, columns: traits
#genotypes: Matrix of row: individuals, columns: markers
#return: output - translated matrix of results of qtlbyttest
heatmapqtl <- function(phenotypes,genotypes){
	output <- NULL
	for(y in 1:ncol(phenotypes)){
		output <-rbind(output,qtlbyttest(phenotypes,genotypes,y))
	}
	output <- t(output)
	rownames(output)<-colnames(genotypes, do.NULL = FALSE)
	colnames(output)<-colnames(phenotypes, do.NULL = FALSE)
	output
}

#pathway - creates probable pathway using values for specified marker
#results: output array from heatmapqtl
#phenotypes: Matrix of row: individuals, columns: traits (mind labels, they are crucial)
#marker: specified marker (use 100 for current data)
#return: output - proposed pathway (linear!) based on height of peak from marker 100
pathway<-function(results,marker){
	output<-NULL
	vect<-results[marker,]
	for(i in 1:ncol(results)){
		if(max(vect)==0){break}
		else{
			output<-which(vect==max(vect))
			output<-c(output,colnames(results)[output])
			vect[output]<-0
		}
	}
	output
}

qtlAnalysis <- function(working_dir, genotypes_file, phenotypes_file, output_image_file){
	setwd(working_dir)
	wd<-getwd()
	cat("Working directory set to:",wd,".\n")
	phenotypes <- as.matrix(read.table(phenotypes_file, sep=""))
	cat("Read",phenotypes_file,"as phenotypes.\n")
	genotypes <- as.matrix(read.table(genotypes_file, sep=""))
	cat("Read",genotypes_file,"as genotypes.\n")
	result_binary <- heatmapqtl(makebinary(clean(phenotypes)),genotypes)
	cat("Made result_binary\n")
	persp_qtl_map(genotypes,result_binary,output_image_file)
}