#Getting and Cleaning Data - Programming Assignment

Source of dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R file does the following:
- Creates a combined dataframe with both training and test dataset
- Uses the given features to add variable names to the datasets
- Uses the given test subjects to assign subjects to each piece of data
- Uses the given activity codes to assign each piece of data to an activity
- Extracts the mean and standard deviation of the dataframe
- Exports a tidy dataset of these means, sorted by the subject and also by the activity
