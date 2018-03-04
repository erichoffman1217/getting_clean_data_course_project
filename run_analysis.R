# Getting and Cleaning Data Course Project in RStudio
URL <-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Destination <- 'C:/Users/ehoff_000/Documents/GitHub/getting_clean_data_course_project/download.zip'
download.file(URL, Destination)

library(data.table)
library(dplyr)
directory <- 'C:/Users/ehoff_000/Documents/GitHub/getting_clean_data_course_project/UCI HAR Dataset'
directory <- 'UCI HAR Dataset'


activity_labels <- fread(paste0(directory,'/activity_labels.txt'))
colnames(activity_labels) <- c("actId", "actLabel")

features <- fread(paste0(directory,'/features.txt'))

val_test <- fread(paste0(directory,'/test/X_test.txt'))
act_test <- fread(paste0(directory,'/test/Y_test.txt'))
sub_test <- fread(paste0(directory,'/test/subject_test.txt'))

val_train <- fread(paste0(directory,'/train/X_train.txt'))
act_train <- fread(paste0(directory,'/train/Y_train.txt'))
sub_train <- fread(paste0(directory,'/train/subject_train.txt'))



#Merge and bind data together
final <- as.data.frame(rbind(cbind(sub_test,val_test,act_test), 
               cbind(sub_train, val_train, act_train)))

rm(sub_test,val_test,act_test,sub_train, val_train, act_train)

# Insert and remove columns names
colnames(final) <- c('subject', features[,2], 'activity')
select_columns <- grepl("subject|.*mean\\(.*|.*std.*|activity", colnames(final))
table(select_columns)
final <- final[,select_columns]


#Rename Column names
renaming_final<- colnames(final)
renaming_final
renaming_final <- gsub("^f", "frequencyDomain", renaming_final)
renaming_final <- gsub("^t", "timeDomain", renaming_final)
renaming_final <- gsub("Acc", "Accelerometer", renaming_final)
renaming_final <- gsub("Gyro", "Gyroscope", renaming_final)
renaming_final <- gsub("Mag", "Magnitude", renaming_final)
renaming_final <- gsub("Freq", "Frequency", renaming_final)
renaming_final <- gsub("mean", "Mean", renaming_final)
renaming_final <- gsub("std", "StandardDeviation", renaming_final)
renaming_final <- gsub("BodyBody", "Body", renaming_final)
renaming_final
colnames(final) <- renaming_final


#Create means on subject and activity
activity_means <- final %>% 
      group_by(subject, activity) %>%
      summarise_all(funs(mean))

#Create Tidy Dataset
write.table(activity_means, "tidy_data.txt", quote = FALSE)

