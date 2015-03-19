##this function created for  Peer-Assessments of the Coursera "Getting-and-Cleaning-Data"

##the function will create one R script called run_analysis.R

##the Samsung data foder "UCI HAR Dataset" should in your working directory;you may use setwd to set the working directory.

##1. use read.table to load the data sets, then use cbind, rbind to Merges the training and the test sets to create one data set(data_all).

##2.use names() names the new data set(data_all), then use grep() and merge() to Extracts only the measurements on the mean and standard deviation for each measurement and get a new data set(data_sub).at the same time, Uses descriptive activity names to name the activities in the data set, and Appropriately labels the data set with descriptive variable names. 
        
##3.From the data set(data_sub), use melt(), group_by(), summarize() creates a second, independent tidy data set(results) with the average of each variable for each activity and each subject. 

##4.upload results as a txt file created with write.table() using row.name=FALSE
        
