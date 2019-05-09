---
title: "README"
author: "Mohammad Amir Aghaee"
date: "May 9, 2019"
output: html_document
---


## Getting and Cleaning Data Assignment instructions

##Instructions

Download and unzip files from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Then isolate these particular files
X_train.txt
X_test.txt
y_train.txt
y_test.txt
subject_train.txt
subject_test.txt
features.txt
activity_labels.txt


##Merge the training and the test sets to create one data set.
You can do this by combined all the xvalues and yvalues separately or create a training and a test 
file and then concatenate them together


##Extract only the measurements on the mean and standard deviation for each measurement.
Use the dplyr package and the grep/grepl functions to isolate these measurements.


##Uses descriptive activity names to name the activities in the data set

Use gsub to fix the column names to something more descriptive that makes sense

##Appropriately labels the data set with descriptive variable names.
Make sure you get the activity labels into the dataset

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Use the mean function across the measurements by activityType for each individual. 

The R script run_analysis.R will do all these for you

The tidydata.txt file is the result of this process

