pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        # set working directory
        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }
       
        # initialize a vector to hold the pollutant data
        data_vector <- c()
        # find all files in the specdata folder and save as a vector
        spec_files <- as.character( list.files(directory) )
        #create vector with paths to each file
        file_paths <- paste(directory, spec_files, sep="")
        
        for(i in id) {
                current_file <- read.csv(file_paths[i], header=T, sep=",")
                na_removed <- na.omit(current_file[,pollutant])
                data_vector <- c(data_vector, na_removed)
        }
        result <- mean(data_vector)
        return(result) 
}
