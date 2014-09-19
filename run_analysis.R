library(plyr)
## Main function to clean and create tidy data set for Human Activity Recognition Using Smartphones Data Set.
## Before running this script download the data from:
##     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## Unzip the downloaded file to a directory on your computer. Preserve the directory structure of the zip file.
## In r, execute the command setwd('directory containing unzipped data')
## Run this function
## The script creates a file called smartphone_means_and_std_means.txt.
## Use the read_tidy_data function to read the tidy data file into R.
run_analysis <- function() {
    data_dir <- "getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset"
    
    ## Setup - read the features.txt file, containing the feature number and feature column header names
    features_info <- read.csv(paste(data_dir, "features.txt", sep="\\"), sep=" ", col.names=c('FeatureID', 'FeatureName'), colClasses=c('integer', 'character'), header=FALSE)
    
    ## 1. Merge the test and training data into one set
    tidy_data <- merge_training_and_test_data(data_dir, features_info)
    
    ## 2. Extract only the measurements on the mean and standard deviation for each measurement
    ##    Match the column name to a case insensitive regular expression to find features containing mean() or std()
    ##    Specify TRUEs at the end to keep subject id and activity columns.  They are in addition to the features
    tidy_data <- tidy_data[,c(grepl("(.*)(mean|std)\\(\\)(.*)", features_info$FeatureName), rep(TRUE, 2))]
    
    ## 3. Use descriptive activity names
    activity_labels <- read.csv(paste(data_dir, "activity_labels.txt", sep="\\"), sep=" ", col.names=c('ActivityID', 'Activity'), colClasses=c('integer','character'), header=FALSE, strip.white=TRUE)
    tidy_data <- mutate(tidy_data, Activity = factor(Activity, labels=activity_labels$Activity))
    
    ## 4. Label the data set with descriptive variable names
    colnames(tidy_data) <- get_descriptive_variable_name(colnames(tidy_data))
    
    ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    tidy_data_average <- ddply(tidy_data, .(Activity, SubjectID), numcolwise(mean))
    
    ## Cleanup - Sort data by subject and activity 
    tidy_data_average <- tidy_data_average[order(tidy_data_average$SubjectID, tidy_data_average$Activity), ]
    
    ## Write the data set from step 5
    write.table(tidy_data_average, file="smartphone_mean_and_std_means.txt", row.names=FALSE)
}

## Read the training and test data into a single data frame
merge_training_and_test_data <- function (data_dir, features_info) {
    train_data <- read_smartphone_data(data_dir, "train", features_info)
    test_data <- read_smartphone_data(data_dir, "test", features_info)
    merged_data <- rbind(train_data, test_data)    
}

## Read the smartphone samples, their associated subject id and activity id together in one data frame.
read_smartphone_data <- function(data_dir, data_type, feature_col_info) {
    ## Read the subject ids for each sample
    subject_id_file <- sprintf("%s\\%s\\subject_%s.txt", data_dir, data_type, data_type)
    subject_ids <- read.csv(subject_id_file, col.names=c('SubjectID'), colClasses=c('integer'), header=FALSE)
    
    ## Read the activity ids
    activity_id_file <- sprintf("%s\\%s\\y_%s.txt", data_dir, data_type, data_type)
    activity_ids <- read.csv(activity_id_file, col.names=c('Activity'), header=FALSE)
    
    ## Read the samples
    sample_file <- sprintf("%s\\%s\\x_%s.txt", data_dir, data_type, data_type)
    samples <- read.table(sample_file, col.names=feature_col_info$FeatureName, colClasses=c('numeric'), header=FALSE)
    
    ## Add the subject ids and activity ids to the samples to make a single data frame
    mutate(samples, SubjectID=subject_ids$SubjectID, Activity=activity_ids$Activity)
}

## Take the input column names and replace them with more descriptive names.
get_descriptive_variable_name <- function(variable_name) {
    new_variable_name <- gsub("^t", "Time", variable_name)
    new_variable_name <- gsub("^f", "Frequency", new_variable_name)
    new_variable_name <- gsub("mean", "Mean", new_variable_name, fixed=TRUE)
    new_variable_name <- gsub("std", "Std", new_variable_name, fixed=TRUE)
    new_variable_name <- gsub("Acc", "Accelerometer", new_variable_name, fixed=TRUE)
    new_variable_name <- gsub("Gyro", "Gyroscope", new_variable_name, fixed=TRUE)
    new_variable_name <- gsub(".", "", new_variable_name, fixed=TRUE)
    new_variable_name
}

read_tidy_data <- function() {
    read.table(file="smartphone_mean_and_std_means.txt", header=TRUE)
}