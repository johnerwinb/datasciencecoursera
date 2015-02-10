#set working directory:

setwd("E:/Coursera R/Week 2/rprog_data_specdata")

#define fcn named "complete":
#it has two (2) args = "directory" and "id":
#id has defined values of 1:332:

complete <- function(directory, id = 1:332) {

  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
# set working directory
# by using "./specdata/" the folder "specdata" inside "E:/Coursera R/Week 2/rprog_data_specdata" 
# (the working directory) was used.

  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }

# get the length of id vector. Here the length of ID is 332.
  id_len <- length(id)
  complete_data <- rep(0, id_len) # this gives a vector (the size of id_len = 332) of zeros (0s)
# find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
#print all file names:
  all_files #there are 332 files of CSV format

#concatenates directory and all_files:
  file_paths <- paste(directory, all_files, sep="")
#to see this, print "file_paths":
  file_paths
#j is a counter that starts with 1. 
  j <- 1 
# set another counter i which contains all "ids":
# counter "i" will be used by "current_file"
# counter "j" will be used by "complete_data"
# below is a loop:

  for (i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
#here is what the loop does:
# 1) it reads a csv file by using read.csv one at a time. 
# CSV file with id=1 will be read first and this will be named "current_file"
# type file_paths[1] to see. Then file_paths[2], then file_paths[3], and so on.
# Header = TRUE sets the first row as variable names. 
# sep="," means the file is comma separated (CSV)
# 2) The "current_file" which is "file_paths[1]"
# Try running "complete<-complete.cases(current_file)". 
# You will have a logical vector (TRUE or FALSE)
# sum(complete.cases(current_file) will sum up all the logical vector created by complete.cases.
# note that TRUE = 1 and FALSE = 0. So the sum will be the number of obs with no missing values.
# this sum will be the value of complete_data[j]. Note that initial value of complete_data[j] are all 0s (for all j's) 
# done with complete_data <- rep(0, id_len).
# 3) j will be changed to current j (j = 1, currently) to j+1 = 2
# on the second run, current j is 2 so j+1 will be 3.
# the loop will end when "id"	is saturated (when i = 332)
# -------------------that's what the loop does. ----------------------------

# result is defined to be a data frame which includes id 
# (id here is the one you enter in the function. Remember, id is an arg of "complete" fcn)
# and number of obs = complete_data
# or the sum of cases without NAs.

  result <- data.frame(id = id, nobs = complete_data)
  return(result)
} 


complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

# some tips in understanding codes like these are to separate the codes and run/process them one at a time.
# to do this, the codes have to be ran outside the fcn that is type them in the R Console
# and experiment on it, print its value. 
# You can also supply a constant value to variables..just like what we did 
# when we typed "file_paths[1]" (note the "1" instead of "i" in the R Console.

