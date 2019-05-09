#Course Project 

getwd()
setwd("C:/Users/gcjff/OneDrive - Monsanto/Migrated from My PC/Documents/100 Coursera/Course 3/UCI HAR Dataset")


#1 Merges the training and the test sets to create one data set.

xtrain <- read.table("X_train.txt", header= FALSE)
xtest <- read.table("X_test.txt", header= FALSE)
ytrain <- read.table("y_train.txt", header= FALSE)
ytest <- read.table("y_test.txt", header= FALSE)
subjtrain <- read.table("subject_train.txt", header= FALSE)
subjtest <- read.table("subject_test.txt", header= FALSE)
features <- read.table("features.txt", header= FALSE)
activitylabels <- read.table("activity_labels.txt", header= FALSE)

#Assign the appropriate names to each file
colnames(xtrain) <- features[,2]
colnames(xtest) <- features[,2]
colnames(ytrain) <- "activityID"
colnames(ytest) <- "activityID"
colnames(activitylabels) <- c("activityID","activityType");
colnames(subjtest) <- "subjectID"
colnames(subjtrain)<- "subjectID"

#combine x and y values together first
xvalues <- rbind(xtrain, xtest)
yvalues <- rbind(ytrain, ytest)
names <- rbind(subjtrain, subjtest)

#now combine everything together 
fulldata2 <- cbind(yvalues, names, xvalues)

#check to see if it worked
str(fulldata2)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.

meanstd2 <- fulldata2[grepl("mean|std|subjectID|activityID", names(fulldata2))]

#check to see if it worked
names(meanstd2)

#3 Uses descriptive activity names to name the activities in the data set

meanstd3 <- merge(meanstd2, activitylabels, by = "activityID", all.x = TRUE)


#4 Appropriately labels the data set with descriptive variable names.

names(meanstd3) <- gsub("^t", "time", names(meanstd3))
names(meanstd3) <-gsub("Acc", "Accelerometer", names(meanstd3))
names(meanstd3) <-gsub("^f", "Frequency", names(meanstd3))
names(meanstd3) <-gsub("Gyro", "Gyroscope", names(meanstd3))
names(meanstd3) <-gsub("Mag", "Magnitude", names(meanstd3))
names(meanstd3) <-gsub("Bodybody", "Body", names(meanstd3))
names(meanstd3) <-gsub("BodyBody", "Body", names(meanstd3))
names(meanstd3) <- gsub("\\(|\\*", "", names(meanstd3))
names(meanstd3) <- gsub("\\)|\\*", "", names(meanstd3))



#need to move activitytype to the front of the dataframe and rid yourself of activityID
meanstd3 <- meanstd3 %>% select(activityType, "subjectID":"FrequencyBodyGyroscopeJerkMagnitude-meanFreq")


#5 From the data set in step 4, creates a second, independent tidy data set with 
#5 the average of each variable for each activity and each subject.

tidydata <- aggregate(. ~subjectID + activityType, meanstd3, mean)



write.table(tidydata, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)

#want to make sure it reads out correctly
write.csv(tidydata, file = "tidydata.csv", row.names = FALSE, col.names = TRUE)

head(meanstd2)

