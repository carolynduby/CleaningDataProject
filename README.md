# Introduction
This directory contains an R script called run_analysis.R that cleans and summarizes a subset of the measurements in the (Human Activity Recognition Using Smartphones Data Set)[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] The script merges the data into a single data set, reduces the number of measurements, and summarizes the sample measurements.  

The requirements for this analysis are specified by the (Getting and Cleaning Data Course)[https://class.coursera.org/getdata-007] Project assignment.

# What the Analysis Script does
## Original Data Set Overview
The original data contains 561 feature measurements recorded by the accelerometer and gyroscope in a smartphone.  Each set of measurements corresponds to a particular subject performing a specified activity.  The subjects in the original data set were divided into two groups - training and test.  For each data set, the samples, subject ids, and activity ids were all stored in separate files.  
## Analysis Overview
At a high level, the analysis script reads the training and test data into a single dataframe containing the subject id, activity, and the 561 feature measurements.  The analysis selects 66 columns with feature names containing mean() or std().  The script maps the numeric activity ids to meaningful names such as SITTING, WALKING, etc.  The script cleans up the column labels replacing them with cleaner, more meaningful names.  Finally the script calculates the mean of each measurement aggregated by subject and activity.  The resulting data set is written to the file smartphone_means_and_std_means.txt.  The resulting file is readable by R using the read.table command.
Consult the end of this README file for instructions on how to run the analysis script and read the output.
## Analysis Algorithm Details
When reading this section you may find it helpful to refer to Community TA David Hood's (diagram of the file structure)[https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png].  Looking in more detail the analysis script operates as follows:
* Reads the features.txt file into a data frame containing the FeatureID and FeatureName
* Step 1 of requirements: The training and test data follow the same file format but the names of the files and directories are different.  The script calls the read_smartphone_data function twice with a different parameter to specify the test or train data.  Each data set is constructed as follows:
** The subject file contains the integer identifiers of the subject corresponding to each set of measurements.  The script reads the train/subject_train.txt file or test/subject_test.txt file and converts it to a single integer column called SubjectID.
** The activity file contains the integer identifiers of the activities corresponding to each set of measurements.  The script reads the train/y_train.txt and test/y_test.txt file and converts it to a column called Activity that contains the identifier of the activity performed.
** The sample files contain one measurement for each of the 561 features.  The script reads train/x_train.txt and test/x_test.txt into a data frame.  The column labels are set to the FeatureNames as read in the very first step of the script.
** The SubjectID, Activity, and sample data are merged into a single data frame.  The rows of each dataframe correspond to one another by position, i.e. the first row of SubjectID and the first row of Activity are the subject and activity for the first row of sample data.
* We now have a single data frame for one each set of data (training and test).  The data frame contains the subject id, activity id and 561 feature sample measurements.
* The training and test data frames are merged into one data frame using rbind.
* We now have a single data frame containing the subject id, activity id, and 561 feature sample measurements for both the training and test data sets.
* Step 2 of requirements: The script uses subsetting to select only the feature sample columns that contain the string mean() or std(). 
* We now have a single data frame containing the subject id, activity id, and 66 feature sample measurements for both training and test data sets.
* Step 3 of requirements: The script reads the activity_labels.txt file.  The script converts the Activity column to a factor variable, applying the levels as defined in the activity_labels.txt file.
* We now the same data frame as in the previous step but the Activity column is a factor variable.
* Step 4 of requirements: The script cleans up the feature column names by removing special characters and making the following substitutions:
| Pattern        | Substitution    | 
| -------------- |:---------------:| 
| starts with t  | Time            | 
| starts with f  | Frequency       | 
| mean           | Mean            |
| std            | Std             |
| Acc            | Accelerometer   |
| Gyro           | Gyroscope       |
For a full mapping of original data set features to tidy data set features see the CodeBook.md file contained in this directory.
* We now have the same data frame with 66 columns but the column names are cleaner and more descriptive.
* Step 5 of requirements: The script uses ddply to calculate the mean of the measurement columns aggregating by the SubjectID and Activity.
* We now have a data frame with a single row for each subject id and activity combination.  The other 66 columns are the means of the measurements for each subject and activity.
* The script writes the file to smartphone_mean_and_std_means.txt
* The resulting text file can be read using read.table as described in the next section.
# How to Run the Script
* Download the [zipped data files] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
* Save the downloaded zip file.
* Expand the zip file on your computer preserving directories.  On Linux you can use the unzip command. On Windows open the file explorer, select the zip file, and select Expand All...  Another alternative on Windows is to use a WinZip(www.winzip.com).  
* You should now have a 'getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset' directory containing another directory 'UCI HAR Dataset'.  The directory containing 'getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset' will be referred to as WORKING_DIR_NAME in subsequent steps.
* Open R
* Download the run_analysis.R script.  Save it to the directory WORKING_DIR_NAME.
* Execute the following R command to set the working directory to the directory getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset containing the expanded data file, source the script, and execute the script.
````
        setwd("WORKING_DIR_NAME")
        source("WORKING_DIR_NAME/run_analysis.R")
        run_analysis()
````
For example:
````
        setwd("C:/ckd/personal/coursera/CleaningData/Project")
        source('C:/ckd/personal/coursera/CleaningData/Project/run_analysis.R')
        run_analysis()
````
* The function will read the source data set and creates the file smartphone_mean_and_std_means.txt in the WORKING_DIR_NAME.
* Use a text editor such as Notepad++ to view the results.
* In R, the results can be read in as follows:
````
        >tidy_data <- read_tidy_data()
        > str(tidy_data)
        'data.frame':    180 obs. of  68 variables:
         $ Activity                                 : Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1 4 6 5 2 ...
         $ SubjectID                                : int  1 1 1 1 1 1 2 2 2 2 ...
         $ TimeBodyAccelerometerMeanX               : num  0.277 0.255 0.289 0.261 0.279 ...
         $ TimeBodyAccelerometerMeanY               : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
         $ TimeBodyAccelerometerMeanZ               : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
         $ TimeBodyAccelerometerStdX                : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
         $ TimeBodyAccelerometerStdY                : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
````
