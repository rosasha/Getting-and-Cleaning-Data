                **README**



The goal is to prepare tidy data that can be used for later analysis
We created one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set  created a second, independent tidy data set with the average of each variable for each activity and each subject.

1. use package dplyr for select & group data *library(dplyr)*
2. create working directory *setwd*
4. download required files *read.table*
5. merge & combine required data *rbind,cbind*
6. set names for column *colnames*
7. merge with dplyr *inner_join*
8. select mean&std in column name *grep*
9. create tidy data *cbind*
10. creates a independent tidy data with the average  of each variable for each activity and each subject *summarise_each*
