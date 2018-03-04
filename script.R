# Getting and Cleaning Data Course Project in RStudio
URL <-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Destination <- 'C:/Users/ehoff_000/Documents/GitHub/getting_clean_data_course_project/download.zip'
download.file(URL, Destination)

library(data.table)
library(dplyr)

directory <- 'C:/Users/ehoff_000/Documents/GitHub/getting_clean_data_course_project/UCI HAR Dataset'
activity_labels <- fread(paste0(directory,'/activity_labels.txt'))
features <- read.table(paste0(directory,'/features.txt'))
features <- fread(paste0(directory,'/features.txt'))
x_test <- fread(paste0(directory,'/test/X_test.txt'))
x_train <- fread(paste0(directory,'/train/X_train.txt'))

#Merge and bind colnames
features[,2] <- unclass(as.character(features[,2]))
colnames(x_test) <- unclass(as.character(features[,2]))


unclass(as.character(features[,2]))
# Grab mean and stddv from featuers then train and test
select_features <-features[V2 %like% ".*mean.*|.*std.*"]

