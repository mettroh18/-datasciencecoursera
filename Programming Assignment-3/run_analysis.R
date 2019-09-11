##EXTREMELY STUCK ON THIS ASSIGNMENT

#You should create one R script called run_analysis.R that does the following.
library(plyr)
library(dplyr)
library(readr)
library(readtext)


if(!file.exists("/dataset")) {dir.create("./dataset")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/downloads.csv", method = "curl")


train1 <- list.files(path="./data/train/Inertial-Signals", pattern="body_acc", full.names=TRUE)
train2 <- list.files(path="./data/train/Inertial-Signals", pattern="body_gyro", full.names=TRUE)
train3 <- list.files(path="./data/train/Inertial-Signals", pattern="total_acc", full.names=TRUE)

trainA <- merge(train1, by.x = "", by.y = "", all = TRUE)
trainB <- merge(train2, by.x = "", by.y = "", all = TRUE)
trainC <- merge(train3, by.x = "", by.y = "", all = TRUE)


#Merges the training and the test sets to create one data set.
training <- readtext("./data/train/X_train.txt")
test <- readtext("./data/test/X_test.txt")

merged <- data.frame(training, test)

#Extracts only the measurements on the mean and standard deviation for each measurement.


#Uses descriptive activity names to name the activities in the data set



#Appropriately labels the data set with descriptive variable names.



#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.