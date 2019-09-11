#You should create one R script called run_analysis.R that does the following.
library(plyr)
library(dplyr)
library(readr)
library(readtext)


#Merges the training and the test sets to create one data set.
training <- readtext("./data/train/X_train.txt")
test <- readtext("./data/test/X_test.txt")

dataset <- rbind(training, test)
features <- read.table("data/features.txt")$V2
names(dataset) <- features

#Extracts only the measurements on the mean and standard deviation for each measurement.
filtered <- grepl("std|mean", features) & !grepl("meanFreq", features)
dataset <- dataset[filtered]
rm(features, filtered)

#Label each row by its appropriate subject
subjects1 <- read.table("data/train/subject_train.txt")
subjects2 <- read.table("data/test/subject_test.txt")
allsubjects <- rbind(subjects1, subjects2)
names(labels) <- c("Subject")
dataset <- cbind(allsubjects, dataset)
rm(subjects1, subjects2, allsubjects)

#Uses descriptive activity names to name the activities in the data set
labels1 <- read.table("data/train/y_train.txt")
labels2 <- read.table("data/test/y_test.txt")
activities <- rbind(labels1, labels2) 

code <- read.table("data/activity_labels.txt")
activities <- (lapply(activities, function(x) code[x,2]))
activities <- as.data.frame(activities)
names(activities) <- c("Activity")
dataset <- cbind(activities, dataset)
rm(labels1, labels2, code, activities)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- dataset %>%
  group_by(Activity, Subject) %>%
  summarize_all(funs(mean))
write.table(tidy, file = "./tidy.txt", row.names = FALSE)