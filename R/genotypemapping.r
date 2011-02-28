#un_drop_markers - removing columns, that are higly correlated with more that specified percentage of others
#input - matrix of data, treshold (number 0-1)
#return - matrix of data of the same type
un_drop_markers <- function(chrom_matrix,treshold=0.25){
	cor_matrix <- un_recombination(chrom_matrix)
	result <- apply(cor_matrix,1,un_row_score)
	i<-1
	while(max(result)>treshold){
		chrom_matrix <- chrom_matrix[,-(which(result==max(result)))]
		cor_matrix <- un_recombination(chrom_matrix)
		result <- apply(cor_matrix,1,un_row_score)
		print(i)
		print(max(result))
		i<-i+1
	}
	chrom_matrix
}

#un_best_clustering - needs improvment really bad! quadro-for!:D - making spceified number of clustering of data
#then producing a matrix of points, udes later for further classification
#input - matrix of data, number of iterations(int), number of groups(int)
#return - matrix of numbers (0-nr_iterations)
un_best_clustering <- function(chrom_matrix,nr_iterations,groups=10){
	cor_matrix <- cor(chrom_matrix,use="pairwise.complete.obs")
	cor_matrix <- un_remove_background(cor_matrix,-10,10)
	print("un_best_clustering starting")
	res <- NULL
	map <- matrix(0,nrow(cor_matrix),ncol(cor_matrix))
	print("iteration starting")
	#clustering with k-means
	for(i in 1:nr_iterations){
		r <- kmeans(cor_matrix,groups)
		res <- rbind(res,(as.numeric(r[[1]])))
	}
	print("iteration done, starting pointing system")
	#matrix of points
	for(i in 1:nr_iterations){
		for(j in 1:groups){
			for(k in which(res[i,]==j)){
				for(l in which(res[i,]==j)){
					map[k,l] <- map[k,l] + 1
				}
			}
		}
	}
	map <- un_remove_background(map,0,10)
	print("pointing done, returning output")
	#matrix should inherit colnames from input
	colnames(map)<-colnames(chrom_matrix, do.NULL = FALSE)
	map
}

#un_order_chromosome - ordering markers inside one group (chromosome)
#input - matrix of data (specified fragment to be sorted inside)
#return - names of columns in sorted order
un_order_chromosome_by_cor <- function(chrom_matrix){
	cat(ncol(chrom_matrix)," markers\n")
	output<-chrom_matrix
	#sorting is made in number of iterations equal to number of columns
	for(i in 1:ncol(chrom_matrix)){
		cat("Starting iteration ",i,"\n")
		chrom_cor_matrix <- cor(output,use="pairwise.complete.obs")
		first_free <- 1
		last_free <- ncol(chrom_cor_matrix)
		col_means <- apply(chrom_cor_matrix,2,mean)
		result <- as.vector(matrix(0,1,last_free))
		result[first_free] <- which(col_means==min(col_means))
		result[last_free] <- which(col_means==sort(col_means)[2])
		chrom_cor_matrix[result[first_free],]<--10
		chrom_cor_matrix[result[last_free],]<--10
		current <- NULL
		for(i in 2:ncol(chrom_cor_matrix)-1){
			first_free_column <- chrom_cor_matrix[,result[first_free]]
			last_free_column <- chrom_cor_matrix[,result[last_free]]
			if(max(first_free_column) > max(last_free_column)){
				result[first_free+1] <- which(first_free_column==max(first_free_column))[1]
				chrom_cor_matrix[result[first_free],] <- -10
				first_free <- first_free+1
			}else{
				result[last_free-1] <- which(last_free_column==max(last_free_column))[1]
				chrom_cor_matrix[result[last_free],] <- -10
				last_free <-last_free-1
			}
		}
	}
	print("Iterations done,saving result")
	output <- colnames(chrom_matrix[,result])
	output	
}

un_order_chromosome_by_reco <- function(chrom_matrix){
	output<-chrom_matrix
	#for(i in 1:ncol(chrom_matrix)){
		reco_matrix <- un_recombination(chrom_matrix)
		#reco_matrix <- (100-100*cor(output,use="pairwise.complete.obs"))
		for(j in 1:ncol(reco_matrix)){
			reco_matrix[j,j]<-200
		}
		col_means <- apply(reco_matrix,2,mean)
		result <- as.vector(matrix(0,1,ncol(reco_matrix)))
		if(ncol(reco_matrix)%%2==0){
			center <- ncol(reco_matrix)/2
		}else{
			center <- (ncol(reco_matrix)+1)/2
		}
		first_free <- center
		last_free <- center
		result[center] <- which(col_means==min(col_means))
		cat("Center:",center,"value:",which(col_means==min(col_means)),"\n")
		reco_matrix[,result[center]] <- 200
		for(k in sort(reco_matrix[result[center],])){
			cur <- which(k==reco_matrix[result[center],])[1]
			cur_first <- reco_matrix[result[first_free],cur]
			cur_last <- reco_matrix[result[last_free],cur]
			if(first_free==1){
				last_free <- last_free+1
				result[last_free] <- cur
				reco_matrix[,cur] <- 200				
			}else if(last_free==ncol(reco_matrix)){
				first_free <- first_free-1
				result[first_free] <- cur
				reco_matrix[,cur] <- 200			
			}else if(cur_first>cur_last){
				first_free <- first_free-1
				result[first_free] <- cur
				reco_matrix[,cur] <- 200
			}else{
				last_free <- last_free+1
				result[last_free] <- cur
				reco_matrix[,cur] <- 200
			}
		}
		output <- output[,result[-length(result)]]		
	#}
	result <- result[-length(result)]
	result
}


#un_neighbor - heart of analysis!
#input: matrix of data with wrongly ordered columns, to be clustered, sorted inside groups, nr_iterations (int) groups(int)
#return: matrix of the same data with rigth order of columns
un_neighbor <- function(chrom_matrix,method=1,nr_iterations=1000,groups=5){
	if(method==1){
		print("Using un_order_chromosome_by_cor.")
		r <- un_best_clustering(chrom_matrix,nr_iterations,groups)
		#un_cor <- cor(chrom_matrix,use="pairwise.complete.obs")
		#r <- un_best_clustering(r,nr_iterations,groups)
		r<-kmeans(r,groups)
		res <- NULL
		for(i in 1:groups){
			cat("Segregating chromosome: ",i,"nr of markers:",length(which(r[[1]]==i)),"\n")
			cur <- un_order_chromosome_by_cor(chrom_matrix[,which(r[[1]]==i)])
			res <- cbind(res,chrom_matrix[,cur])
		}
	}else{
		print("Using un_order_chromosome_by_reco.")
		r <- un_best_clustering(chrom_matrix,nr_iterations,groups)
		r <- kmeans(r,groups)
		res <- NULL
		for(i in 1:groups){
			cat("Segregating chromosome: ",i,"nr of markers:",length(which(r[[1]]==i)),"\n")
			cur <- un_order_chromosome_by_reco(chrom_matrix[,which(r[[1]]==i)])
			res <- cbind(res,chrom_matrix[,cur])
		}
	}
	res
}