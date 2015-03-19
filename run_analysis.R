
##create one R script called run_analysis.R

##the Samsung data foder "UCI HAR Dataset" should in your working directory;
##you may use setwd to set the working directory.

run_analysis <- function() {
        
        
        ##1.Merges the training and the test sets to create one data set.
        
        data_sets_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")  
        data_activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
        data_subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")
        data_train <- cbind(data_subject_train,data_activity_train,data_sets_train)
        
        data_sets_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
        data_activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
        data_subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")
        data_test <- cbind(data_subject_test,data_activity_test,data_sets_test)
        
        data_all <- rbind(data_train,data_test)
        
        ##2.Extracts only the measurements on the mean and standard deviation for 
        ##each measurement. 
        
        features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
        
        name_allcol <-  c("subject","activity",as.character(features[,2]))
        names(data_all) <- name_allcol
        
        name_sub <- c(1,2,grep("-mean()",name_allcol),grep("-std()",name_allcol))
        data_sub <- data_all[,name_sub]
        
        ##3.Uses descriptive activity names to name the activities in the data set
        ##4.Appropriately labels the data set with descriptive variable names. 
        
        activity_labels <-  read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="")
        names(activity_labels) <- c("activity","activity_name")
        
        data_sub <- merge(activity_labels,data_sub)
        
        ##5.From the data set in step 4, creates a second, independent tidy data set with 
        ##the average of each variable for each activity and each subject. 
        require(reshape2)
        
        data_melt <- melt(data_sub,id=c(1:3),measure.vars=c(4:81))
        
        require(dplyr)
        data_grouped <- group_by(data_melt,activity,activity_name,subject,variable)
        results <- summarise(data_grouped,mean(value))
        
        
        ##6.upload your data set as a txt file created with write.table() 
        ##using row.name=FALSE
        
        write.table(results,file="run_analysis_results.txt",row.name=FALSE)
        
        print("Executed Successfully! and the 'run_analysis_results.txt' has been created in working directry")
}
