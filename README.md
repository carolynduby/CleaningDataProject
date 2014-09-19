# Introduction

This directory contains an R script called run_analysis.R that cleans and summarizes the Human Activity Recognition Using Smartphones Data Set.  More information can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# How to Run the Script
1. Download the [zipped data files] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Save the downloaded zip file.
3. Expand the zip file on your computer preserving directories.  On Linux you can use the unzip command. On Windows open the file explorer, select the zip file, and select Expand All...  Another alternative on Windows is to use a WinZip(www.winzip.com).  
4. You should now have a 'getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset' directory containing another directory 'UCI HAR Dataset'.  The directory containing 'getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset' will be referred to as WORKING_DIR_NAME in subsequent steps.
5. Open R
6. Download the run_analysis.R script.  Save it to the directory WORKING_DIR_NAME.
7. Execute the following R command to set the working directory to the directory getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset containing the expanded data file, source the script, and execute the script.
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
8. The function will read the source data set and creates the file smartphone_mean_and_std_means.txt in the WORKING_DIR_NAME.
9. Use a text editor such as Notepad++ to view the results.
10. In R, the results can be read in as follows:
````
tidy_data <- read_tidy_data()
````
