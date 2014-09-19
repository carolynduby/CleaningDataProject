# Introduction
This tidy data set was created from a set of smartphone measurements.   A group of 30 volunteers ranging in age from 19-48 years performed six activities while wearing a Samsung Galaxy S II smartphone on their waist.  The six activities were WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  The smartphones measured the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The activities were determined by a video recording and manually labelled.  The subjects were randomly partitioned into a training and test set. 

The tidy data set combines the training and test data into one data set, selects the measurements containing text mean() or std(), and calculates the mean of these measurements for each subject and activity combination. 

# Design Decisions
* Community TA Wendel Hope describes in this discussion forum [thread] (https://class.coursera.org/getdata-007/forum/thread?thread_id=201) why the measurements have no units.  The short explanation states that the code book for the original data set notes that the feature values are normalized and thus have no units.
* I chose to include the columns containing the text mean() and std().  This step of the project requirements was up to interpretation.  A solution could have included columns containing Mean as well, but I thought the selection fit the requirements best.  It would be simple to modify this script to include more columns by changing the regular expression used to select the columns and by adding new transformations to create descriptive column values.
* I used camel case variable names.  The descriptive variable names were too long to read easily all in lower case.  Users of the data can change the case of the columns after reading the table into R if they prefer.
* When modifying the column names, I changed Acc to Accelerometer and Gyro to gyroscope and t and f to Time and Frequency.  I left Std (Standard Deviation) and Mag (Magnitude) abbreviated.  They are more standard abbreviations and I felt that they made the variable names way too long when expanded out.  These could easily be changed by modifying the get_descriptive_variable_name function to add more substitions.

# Variable Descriptions
**Activity**: 

The activity performed during measurements (one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING). 

**SubjectID**: 

The unique identifier of the subject (integer between 1 and 30).  

**TimeBodyAccelerometerMeanX** 

**TimeBodyAccelerometerMeanY** 

**TimeBodyAccelerometerMeanZ:**

The mean of the body component of the linear acceleration readings in the x, y, and z axial over the sample window. (Normalized data with no units in the time domain.)

**TimeBodyAccelerometerStdX **

**TimeBodyAccelerometerStdY**

**TimeBodyAccelerometerStdZ:** 

The standard deviation of the body component of the linear acceleration readings in the x, y and z axials over the sample window. (Normalized data with no units in the time domain.)

**TimeGravityAccelerometerMeanX
TimeGravityAccelerometerMeanY 
TimeGravityAccelerometerMeanZ: **
The mean of the gravity component of the linear acceleration readings in the x,y, and z axial over the sample window. (Normalized data with no units in the time domain.)

**TimeGravityAccelerometerStdX
TimeGravityAccelerometerStdY
TimeGravityAccelerometerStdZ:** 
The standard deviation of the gravity component of the linear acceleration readings in the x, y and z axial over the sample window.(Normalized data with no units in the time domain.)

**TimeBodyAccelerometerJerkMeanX
TimeBodyAccelerometerJerkMeanY
TimeBodyAccelerometerJerkMeanZ: **
The mean of the accelerometer jerk in the x, y and z axial over the sample window.  Jerk is the body linear acceleration derived in time.  (Normalized data with no units in the time domain.)

**TimeBodyAccelerometerJerkStdX
TimeBodyAccelerometerJerkStdY
TimeBodyAccelerometerJerkStdZ:**
The standard deviation of the jerk in the x, y and z axial over the sample window.  Jerk is the body linear acceleration derived in time.  (Normalized data with no units in the time domain.)

**TimeBodyGyroscopeMeanX
TimeBodyGyroscopeMeanY
TimeBodyGyroscopeMeanZ:**
The mean of the body component of the rotational velocity readings in the x, y, and z axial over the sample window. (Normalized data with no units in the time domain.)

**TimeBodyGyroscopeStdX
TimeBodyGyroscopeStdY
TimeBodyGyroscopeStdZ:**
The standard deviation of the body component of the rotational velocity readings in the x, y, and z axial over the sample window. (Normalized data with no units in the time domain.)

**TimeBodyGyroscopeJerkMeanX
TimeBodyGyroscopeJerkMeanY
TimeBodyGyroscopeJerkMeanZ:**
The mean of the gyroscope jerk in the x, y and z axial over the sample window.  Jerk is the body rotational velocity derived in time.  (Normalized data with no units in the time domain.)

**TimeBodyGyroscopeJerkStdX
TimeBodyGyroscopeJerkStdY
TimeBodyGyroscopeJerkStdZ:**
The mean of the gyroscope jerk in the x, y and z axial over the sample window.  Jerk is the body rotational velocity derived in time.  (Normalized data with no units in the time domain.)

**TimeBodyAccelerometerMagMean
TimeBodyAccelerometerMagStd:**
The mean and standard deviation of the magnitude of the body component of the linear acceleration measurements over the sample window.  (Normalized data with no units in the time domain.)

**TimeGravityAccelerometerMagMean
TimeGravityAccelerometerMagStd:**
The mean and standard deviation of the magnitude of the gravity component of the linear acceleration measurements over the sample window.  (Normalized data with no units in the time domain.)

**TimeBodyAccelerometerJerkMagMean
TimeBodyAccelerometerJerkMagStd:**
The mean and standard deviation of the magnitude of the body linear acceleration jerk over the sample window. (Normalized data with no units in time domain.)

**TimeBodyGyroscopeMagMean
TimeBodyGyroscopeMagStd:**
The mean and standard deviation of the magnitude of the gravity component of the linear acceleration measurements over the sample window.  (Normalized data with no units in the time domain.)

**TimeBodyGyroscopeJerkMagMean
TimeBodyGyroscopeJerkMagStd:**
The mean and standard deviation of the magnitude of the body rotational velocity jerk over the sample window. (Normalized data with no units in time domain.)

**FrequencyBodyAccelerometerMeanX
FrequencyBodyAccelerometerMeanY
FrequencyBodyAccelerometerMeanZ:**
The mean of the body component of the linear acceleration readings in the x, y, and z axial over the sample window converted to the frequency domain. (Normalized data with no units in the frequency domain.)

**FrequencyBodyAccelerometerStdX
FrequencyBodyAccelerometerStdY
FrequencyBodyAccelerometerStdZ:**
The standard deviation of the body component of the linear acceleration readings in the x, y, and z axial over the sample window converted to the frequency domain. (Normalized data with no units in the frequency domain.)

**FrequencyBodyAccelerometerJerkMeanX
FrequencyBodyAccelerometerJerkMeanY
FrequencyBodyAccelerometerJerkMeanZ:**
The mean of the accelerometer jerk in the x, y and z axial over the sample window converted to the frequency domain.  Jerk is the body linear acceleration derived in time.  (Normalized data with no units in the frequency domain.)

**FrequencyBodyAccelerometerJerkStdX
FrequencyBodyAccelerometerJerkStdY
FrequencyBodyAccelerometerJerkStdZ:**
The standard deviation of the accelerometer jerk in the x, y and z axial over the sample window converted to the frequency domain.  Jerk is the body linear acceleration derived in time.  (Normalized data with no units in the frequency domain.)

**FrequencyBodyGyroscopeMeanX
FrequencyBodyGyroscopeMeanY
FrequencyBodyGyroscopeMeanZ:**
The mean of the body component of the rotational velocity readings in the x, y, and z axial over the sample window converted to the frequency domain. (Normalized data with no units in the frequency domain.)

**FrequencyBodyGyroscopeStdX
FrequencyBodyGyroscopeStdY
FrequencyBodyGyroscopeStdZ:**
The standard deviation of the body component of the rotational velocity readings in the x, y, and z axial over the sample window converted to the frequency domain. (Normalized data with no units in the frequency domain.)

**FrequencyBodyAccelerometerMagMean
FrequencyBodyAccelerometerMagStd:**
The mean and standard deviation of the magnitude of the body component of the linear acceleration measurements over the sample window converted to the frequency domain.  (Normalized data with no units in the frequency domain.)

**FrequencyBodyBodyAccelerometerJerkMagMean
FrequencyBodyBodyAccelerometerJerkMagStd:**
The mean and standard deviation of the magnitude of the body linear acceleration jerk over the sample window converted to frequency domain. (Normalized data with no units in frequency domain.) (NOTE: BodyBody in the column names is preserved from the initial data set.  The original should have used a single Body to be consistent.)

**FrequencyBodyBodyGyroscopeMagMean
FrequencyBodyBodyGyroscopeMagStd:**
The mean and standard deviation of the magnitude of the gravity component of the linear acceleration measurements over the sample window converted to the frequency domain.  (Normalized data with no units in the frequency domain.) (NOTE: BodyBody in the column names is preserved from the initial data set.  The original should have used a single Body to be consistent.)

**FrequencyBodyBodyGyroscopeJerkMagMean
FrequencyBodyBodyGyroscopeJerkMagStd:**
The mean and standard deviation of the magnitude of the body rotational velocity jerk over the sample window converted to the frequency domain. (Normalized data with no units in frequency domain.) (NOTE: BodyBody in the column names is preserved from the initial data set.  The original should have used a single Body to be consistent.)

# Mapping of Original Data Source Columns to Tidy Data Set Columns
Click [here] (https://github.com/carolynduby/CleaningDataProject/blob/master/feature_name_map.txt) to view an R table  containing the mappings between the original data set column names and the tidy data set column names.  You can load the table from this file into R using the read.table command:
````
feature_name_map <- read.table(file="feature_name_map.txt", header=TRUE)
head(feature_name_map)
  OriginalDataSetName            TidyDataSetName
1   tBodyAcc-mean()-X TimeBodyAccelerometerMeanX
2   tBodyAcc-mean()-Y TimeBodyAccelerometerMeanY
3   tBodyAcc-mean()-Z TimeBodyAccelerometerMeanZ
4    tBodyAcc-std()-X  TimeBodyAccelerometerStdX
5    tBodyAcc-std()-Y  TimeBodyAccelerometerStdY
6    tBodyAcc-std()-Z  TimeBodyAccelerometerStdZ
````
# Original Data Source
The original data set can be found [here] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws 