#clean - Removing NA from data matrix by replacing it with 0
#matrix_to_be_cleaned: matrix containing data mixed with NA
#returns: matrix_to_be_cleaned - the same matrix with NAs replaced with 0
clean<-function(matrix_to_be_cleaned){
	for(h in 1:nrow(matrix_to_be_cleaned)){
		for(w in 1:ncol(matrix_to_be_cleaned)){
			if(is.na(matrix_to_be_cleaned[h,w])){
				matrix_to_be_cleaned[h,w]<-0
			}
		}
	}
	matrix_to_be_cleaned
}

#makebinary - making a binary matrix out of matrix containing data e.g. from gene expression data -> gene expressed/not expressed
#matrix_to_be_made_binary: matrix containing data
#returns: output - matrix containing 0s (value below the treshold) and 1 (value above the treshold) currently, the treshold is median
makebinary<-function(matrix_to_be_made_binary){
	output<-matrix(0,nrow(matrix_to_be_made_binary),ncol(matrix_to_be_made_binary))
	#resulting matrix should have the same labels as input
	rownames(output)<-rownames(matrix_to_be_made_binary, do.NULL = FALSE)
	colnames(output)<-colnames(matrix_to_be_made_binary, do.NULL = FALSE)
	#using median as a treshold value
	for(i in 1:ncol(matrix_to_be_made_binary)){
	    tres=median(matrix_to_be_made_binary[,i])
		output[,i]<-(matrix_to_be_made_binary[,i]>tres)
	}
	output
}

#makecorvector - double mode:
#0 - using one matrix, producing matrix of correlations between neighbor values in one direction 
#1 - using two matrices, one as above, second to add exact values
#input - one or two matrices of data, two_matrices (number 0 or 1)
#function returns matrix suitable for make_topo_pallete
makecorvector <- function(first_matrix,two_matrices=0,second_matrix=NULL){
	first_matrix_cor <- cor(first_matrix,use="pairwise.complete.obs")
	first_matrix_corv <- NULL
	output <- NULL
	for(i in 2:(ncol(first_matrix_cor)-1)){
		first_matrix_corv <- c(first_matrix_corv,mean(first_matrix_cor[i-1,i],first_matrix_cor[i,i+1]))
	}
	first_matrix_corv <- c(first_matrix_corv,(first_matrix_cor[(ncol(first_matrix_cor)-1),(ncol(first_matrix_cor))])/2)
	for(i in 1:23){
		output <- rbind(output,first_matrix_corv)
	}
	output <- t(output)
	if(two_matrices==1){
		for(i in 1:nrow(output)){
			for(j in 1:ncol(output)){
				output[i,j]<-output[i,j]+second_matrix[i,j]
			}
		}
	}
	output
}

#make_topo_pallete - making nice collor pallete using RGB function, values >0 are red and less transparent the higher their are, <0 blue and less transparent the lower their are
#input - matrix produced by makecorvector
#returns - matrix of colors in RGB,alpha format, max value for color and alpha =255
make_topo_pallete <- function(result_matrix){
	cur_mean <- mean(abs(result_matrix))
	cur_sd <- mean(sd(abs(result_matrix)))
	cur_range <- abs(max(abs(result_matrix))-min(abs(result_matrix)))
	topo_pallete<-matrix(0,nrow(result_matrix),ncol(result_matrix))
	for(i in 1:nrow(result_matrix)){
		for(j in 1:ncol(result_matrix)){
			if(result_matrix[i,j]>=0){
				if(result_matrix[i,j]<(cur_mean-cur_sd)){
					topo_pallete[i,j]<-rgb(0,0,abs(result_matrix[i,j]/cur_range)*255,255-abs(result_matrix[i,j]/cur_range)*255,maxColorValue=255)
				}else if((result_matrix[i,j]>(cur_mean+cur_sd))){
					topo_pallete[i,j]<-rgb(abs(result_matrix[i,j]/cur_range)*255,0,0,abs(result_matrix[i,j]/cur_range)*255,maxColorValue=255)
				}else{
					topo_pallete[i,j]<-rgb(0,abs(result_matrix[i,j]/cur_range)*255,0,55-abs(result_matrix[i,j]/cur_range)*55,maxColorValue=255)
				}	
			}else{
				cur<-abs(result_matrix[i,j])
				if(cur>(cur_mean+cur_sd)){
					topo_pallete[i,j]<-rgb(0,0,abs(cur/cur_range)*255,abs(cur/cur_range)*255,maxColorValue=255)
				}else if((cur<(cur_mean-cur_sd))){
					topo_pallete[i,j]<-rgb(abs(cur/cur_range)*255,0,0,255-abs(cur/cur_range)*255,maxColorValue=255)
				}else{
					topo_pallete[i,j]<-rgb(0,abs(cur/cur_range)*255,0,55-abs(cur/cur_range)*55,maxColorValue=255)
				}	
			}
		
		}
	}
	topo_pallete
}

#un_intonumeric - function formating data to be usable, specificly for one file, but can be easily adapted to other, mind the comment below in the text
#input - matrix of data
#returns matrix with specified characters
un_intonumeric <- function(un_matrix){
	inside <- un_matrix
	#switching -, a, b to NA, 1, 2, respectively
	un_matrix[which(un_matrix=="-")] <- NA
	un_matrix[which(un_matrix=="a")] <- 1
	un_matrix[which(un_matrix=="b")] <- 2
	un_matrix <- as.numeric(un_matrix)
	un_matrix <- matrix(un_matrix,nrow(inside),ncol(inside))
	rownames(un_matrix)<-rownames(inside, do.NULL = FALSE)
	colnames(un_matrix)<-colnames(inside, do.NULL = FALSE)
	un_matrix
}

#un_rec
#un_rec <- function(chrom_vector1){
#	print("un_rec starting")
#	result <- as.vector(matrix(0,1,length(chrom_vector1)))
#	for(k in 1:length(chrom_vector1)){
#		if(is.na(chrom_vector1[k])||is.na(chrom_vector2[k])){
#			rec <- 0
#		}else if(chrom_matrix[k,j]==chrom_matrix[k,i]){
#			rec <- 0
#		}else{
#			rec <- 1
#		}
#	result <- result[k] + rec
#	}
#	print("un_rec done")
#}

#un_recombination - instead of cor use recombination, very very slow (triple for - Danny won't like it)
#input - matrix of data
#return - matrix of recombination values between COLUMNS
un_recombination<-function(chrom_matrix){
output <- matrix(0,ncol(chrom_matrix),ncol(chrom_matrix))
#triple for, jupi!
	for(i in 1:ncol(chrom_matrix)){
		cat("Analysing column ",i,"\n")
		for(j in 1:ncol(chrom_matrix)){
			for(k in 1:nrow(chrom_matrix)){
				if(is.na(chrom_matrix[i,j])||is.na(chrom_matrix[i,j])){
					rec <- 0
				}else if(chrom_matrix[k,j]==chrom_matrix[k,i]){
				rec <- 0
				}else{
				rec <- 1
				}
				output[i,j] <- output[i,j] + rec
			}
		}
	}
#beacuase we want to be able to use the same functions as for corelaction, recombination values must be scaled
	#output <- (100-output)/100
	output
}

#un_row_score - counting score for specified vector, which means, how many values w are above specified treshold, divided by it's length
#input - vector of values, treshold (number 0-1)
#return - row score (number)
un_row_score <- function(cor_matrix_row,treshold=0.7){
	row_score <- 0
	for(j in 1:length(cor_matrix_row)){
		if(cor_matrix_row[j]>treshold){
			row_score <- row_score + 1/length(cor_matrix_row)
		}
	}
	row_score
}

#un_remove_background
un_remove_background <- function(cur_matrix,s1,s2){
	t1 <- mean(cur_matrix)-2*mean(sd(cur_matrix))
	t2 <- mean(cur_matrix)+mean(sd(cur_matrix))
	for(i in 1:nrow(cur_matrix)){
		for(j in 1:ncol(cur_matrix)){
			if(cur_matrix[i,j]<t1){
				cur_matrix[i,j]<-cur_matrix[i,j]*s1
			}else if(cur_matrix[i,j]>t2){
				cur_matrix[i,j]<-cur_matrix[i,j]*s2
			}
		}
	}
	cur_matrix
}

#persp_qtl_map - produces nice and highly informative perspective plot of QTL map
persp_qtl_map <- function(genotypes,result_binary,output_file){
	cat("persp_qtl_map starting.\n")
	cor_matrix <- makecorvector(genotypes,1,result_binary)
	cat("Made cor_matrix.\n")
	pallete <- make_topo_pallete(cor_matrix)
	cat("Made pallete.\n")
	jpeg(filename=output_file)
	persp(result_binary,col=pallete)
	invisible(dev.off())
	cat("Persp plot done and written to:",output_file,".\n")
}