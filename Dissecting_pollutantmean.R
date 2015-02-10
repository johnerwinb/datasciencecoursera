setwd("E:/Coursera R/") #sets working directory to E:/Coursera R/
getwd() #confirms what is the working directory

directory<-("./test/") #directory is an object = "./test/" This does not change the working directory
getwd()

#it seems that "./<character or folder name>/" is added to the working directory
#but neither the working directory nor the the object directory is changed.
#it seems that "./<>/" means working directory. 
#by using "./test/" the folder test in the working directory was used. Amazing.

id<-1:5
pollutant<-"sulfate"

all_files<-as.character(list.files(directory)) #here files in "E:/Coursera R/test" were used..
all_files #prints all_files

file_paths <- paste(directory, all_files, sep="") #concatenates directory and all_files
file_paths #prints file_paths

mean_vector<- c()

for(i in id) { #id here is defined in the fcn pollutant mean - id = 1:332
    current_file <- read.csv(file_paths[i], header=T, sep=",") #reads the a csv file from 1 to 332
    head(current_file) #prints the top 6 observations
    pollutant #prints the pollutant
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant] #creates a file containing only "sulfate" without any NAs
    mean_vector <- c(mean_vector, na_removed) #replaces the empty mean_vector with na_removed = sulfate w/o NAs
  }
  result <- mean(mean_vector) #computes the mean
  return(round(result, 3)) #returns to a fcn...in this case pollutantmean
