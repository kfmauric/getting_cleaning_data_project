## Summary of Human Activity Recognition Using Smartphones Dataset

#Introduction
The original experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have
been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was
selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56
sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency
domain. See below for more details. 


#Data Modification
The data was loaded from the files X_test.txt and X_train.txt. The first modification to the data was to label the columns in the data set to reflect
the labels provided in the file features.txt. Next the files y_test.txt and y_train.txt were used to create columns for activity labels in each data
set. The files subject_test.txt and subject_train.txt were used to add columns denoting the subject ID for each experiment. The two data sets for
training and test were then combined into one table. Columns from the original data set representing the mean and std deviation statistics of the raw
measurements were retained in addition to the new activity and subject columns. The activity names column was made into a factor variable using the
descriptive labels provided in the file activity_labels.txt. The column names were modified from their orignal names for readability. A summary table
was created that contains the mean of each measurement for each subject while performing each activity. The summary table was written to the file
getting_cleaning_project.txt.



#Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The retained set of variables that were estimated from these signals used the fololowing notation: 
- mean(): Mean value
- std(): Standard deviation


i.e. tBodyAcc-X-mean() - describes the mean acceleration in the x direction

#Column Renaming
The columns were renamed from the orignal names following the following conventions.
 - The leading t or f in the column name was replaced by TimeDomain or FrequencyDomain
 - The Trailing direction of the measurement [X|Y|Z] was replaced with [XDirection|YDirection|ZDirection]
 - Body and Gravity terms were replaced with BodyAccelertated and GravityAccelerated
 - Gyro and Acc were replaced with Gyroscope and Accelerometer
 - The term Position was added following original column names to denote measuurement type.
   - tBodyAcc-XYZ
   - tGravityAcc-XYZ
   - tBodyGyro-XYZ
   - fBodyAcc-XYZ
   - fBodyGyro-XYZ
 
 
Final Column Names
 - TimeDomain.BodyAccelerated.Accelerometer.Position.mean.XDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Position.mean.YDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Position.mean.ZDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Position.std.XDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Position.std.YDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Position.std.ZDirection
 - TimeDomain.GravityAccelerated.Accelerometer.Position.mean.XDirection
 - TimeDomain.GravityAccelerated.Accelerometer.Position.mean.YDirection
 - TimeDomain.GravityAccelerated.Accelerometer.Position.mean.ZDirection
 - TimeDomain.GravityAccelerated.Accelerometer.Position.std.XDirection
 - TimeDomain.GravityAccelerated.Accelerometer.Position.std.YDirection
 - TimeDomain.GravityAccelerated.Accelerometer.Position.std.ZDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Jerk.mean.XDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Jerk.mean.YDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Jerk.mean.ZDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Jerk.std.XDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Jerk.std.YDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Jerk.std.ZDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Position.mean.XDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Position.mean.YDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Position.mean.ZDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Position.std.XDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Position.std.YDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Position.std.ZDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Jerk.mean.XDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Jerk.mean.YDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Jerk.mean.ZDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Jerk.std.XDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Jerk.std.YDirection
 - TimeDomain.BodyAccelerated.Gyroscope.Jerk.std.ZDirection
 - TimeDomain.BodyAccelerated.Accelerometer.Mag.mean
 - TimeDomain.BodyAccelerated.Accelerometer.Mag.std
 - TimeDomain.GravityAccelerated.Accelerometer.Mag.mean
 - TimeDomain.GravityAccelerated.Accelerometer.Mag.std
 - TimeDomain.BodyAccelerated.Accelerometer.JerkMag.mean
 - TimeDomain.BodyAccelerated.Accelerometer.JerkMag.std
 - TimeDomain.BodyAccelerated.Gyroscope.Mag.mean
 - TimeDomain.BodyAccelerated.Gyroscope.Mag.std
 - TimeDomain.BodyAccelerated.Gyroscope.JerkMag.mean
 - TimeDomain.BodyAccelerated.Gyroscope.JerkMag.std
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.mean.XDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.mean.YDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.mean.ZDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.std.XDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.std.YDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.std.ZDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.meanFreq.XDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.meanFreq.YDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Position.meanFreq.ZDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.mean.XDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.mean.YDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.mean.ZDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.std.XDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.std.YDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.std.ZDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.meanFreq.XDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.meanFreq.YDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Jerk.meanFreq.ZDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.mean.XDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.mean.YDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.mean.ZDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.std.XDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.std.YDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.std.ZDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.meanFreq.XDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.meanFreq.YDirection
 - FrequencyDomain.BodyAccelerated.Gyroscope.Position.meanFreq.ZDirection
 - FrequencyDomain.BodyAccelerated.Accelerometer.Mag.mean
 - FrequencyDomain.BodyAccelerated.Accelerometer.Mag.std
 - FrequencyDomain.BodyAccelerated.Accelerometer.Mag.meanFreq
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Accelerometer.JerkMag.mean
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Accelerometer.JerkMag.std
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Accelerometer.JerkMag.meanFreq
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Gyroscope.Mag.mean
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Gyroscope.Mag.std
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Gyroscope.Mag.meanFreq
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Gyroscope.JerkMag.mean
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Gyroscope.JerkMag.std
 - FrequencyDomain.BodyAccelerated.BodyAccelerated.Gyroscope.JerkMag.meanFreq
 - activity
 - subject_id
