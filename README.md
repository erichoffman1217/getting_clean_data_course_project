# getting_clean_data_course_project

This data is from an experiemente on 30 volunteers within the age of 19-48. Six activities were measured for each 
individual (walking, walking up stairs, walking downstairs, sitting, standing, and laying). Each volunteer was measured 
by and accelerometere and gyroscope from a Samsung Galaxy S II mounted on the waist.
The experiment orchistrators were Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, and Xavier Parra.
They represent Smartlab, in Genoa and Techincal Research Centre for Dependency Care and Autonomous Living at the
Universitat Politècnica de Catalunya

This repository contains the following files:
README.md
tidy_data.txt
Codebook.md
run_analysis.R

The data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The zip file is also included in the repo.

Transformations
Running run_analysis.R will create the tidy_data.txt
The one transformation that occured was grouping the data by subject and activity so that
the mean of the mean and mean of the standard deviation could be calculated.
All other efforts were to properly merge and bind the data and then to change column names
to be readable.