# Codebook for Course project for Getting and Cleaning Data

Goal: prepare tidy data that can be used for later analysis.
Author:  Jonathan Hull
Date: Oct. 18, 2014


## This is a Tidy Codebook

According to https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/01_03_componentsOfTidyData.pdf a tidy codebook should contain the following

1. Information about the variables (including units) in the data set.  See the Code Book section below.
2. Information about the summary choices you made.  See the Summary Choices section below.
3. Information about the experimental study design you used.  See the Study Design section that describes the source for the data for this project.
4. There should be a section called Study Design that has a thorough description of how you collected the data.  See the Study Design section below.
5. There must be a section called Code Book that describes each variable and its units.  See the Code Book section below.

## Study Design

The data for this project is part of the Human Activity Recognition Using Smartphones Dataset
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Course Project Design

The  script performs the following steps in order:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Summary Choices

Step 2 of the project required that we extract measurements on the mean and standard deviation of each measurement.  I interpreted this to mean that I should choose the original variable names that end in mean() or std() since they are the mean or standard deviation of another measurement.

This decision selected 66 variables for further analysis.

## Code Book

The tidy data set that is output in tidy_data.txt contains the following 66 variable names

- meanOfXvalueTimeDomainBodyAcceleration - mean of the X value of the time domain value for body acceleration
- meanOfYvalueTimeDomainBodyAcceleration - mean of the Y value of the time domain value for body acceleration
- meanOfZvalueTimeDomainBodyAcceleration - mean of the Z value of the time domain value for body acceleration
- stdDevOfXvalueTimeDomainBodyAcceleration - standard deviation of X value for the time domain measurement of body acceleration
- stdDevOfYvalueTimeDomainBodyAcceleration - standard deviation of Y value for the time domain measurement of body acceleration
- stdDevOfZvalueTimeDomainBodyAcceleration - standard deviation of Z value for the time domain measurement of body acceleration
- meanOfXvalueTimeDomainGravityAcceleration - mean of the X value of the time domain measurement of gravity acceleration
- meanOfYvalueTimeDomainGravityAcceleration - mean of the Y value of the time domain measurement of gravity acceleration
- meanOfZvalueTimeDomainGravityAcceleration - mean of the Z value of the time domain measurement of gravity acceleration
- stdDevOfXvalueTimeDomainGravityAcceleration - standard deviation of the X value of the time domain measurement for gravity acceleration
- stdDevOfYvalueTimeDomainGravityAcceleration - standard deviation of the Y value of the time domain measurement for gravity acceleration
- stdDevOfZvalueTimeDomainGravityAcceleration - standard deviation of the Z value of the time domain measurement for gravity acceleration
- meanOfXvalueTimeDomainBodyAccelerationJerk - mean of the X value for the time domain measurement of body acceleration jerk
- meanOfYvalueTimeDomainBodyAccelerationJerk - mean of the Y value for the time domain measurement of body acceleration jerk
- meanOfZvalueTimeDomainBodyAccelerationJerk - mean of the Z value for the time domain measurement of body acceleration jerk
- stdDevOfXvalueTimeDomainBodyAccelerationJerk - standard deviation of the X value for the time domain measurement of body acceleration jerk
- stdDevOfYvalueTimeDomainBodyAccelerationJerk - standard deviation of the Y value for the time domain measurement of body acceleration jerk
- stdDevOfZvalueTimeDomainBodyAccelerationJerk - standard deviation of the Z value for the time domain measurement of body acceleration jerk
- meanOfXvalueTimeDomainBodyGyroscope - mean of the X value for the time domain measurement of the body gyroscope
- meanOfYvalueTimeDomainBodyGyroscope - mean of the Y value for the time domain measurement of the body gyroscope
- meanOfZvalueTimeDomainBodyGyroscope - mean of the Z value for the time domain measurement of the body gyroscope
- stdDevOfXvalueTimeDomainBodyGyroscope - standard deviation of the X value of the time domain measurement of the body gyroscope
- stdDevOfYvalueTimeDomainBodyGyroscope - standard deviation of the Y value of the time domain measurement of the body gyroscope
- stdDevOfZvalueTimeDomainBodyGyroscope - standard deviation of the Z value of the time domain measurement of the body gyroscope
- meanOfXvalueTimeDomainBodyGyroscopeJerk - mean of the X value of the time domain measurement for the body gyroscope jerk
- meanOfYvalueTimeDomainBodyGyroscopeJerk - mean of the Y value of the time domain measurement for the body gyroscope jerk
- meanOfZvalueTimeDomainBodyGyroscopeJerk - mean of the Z value of the time domain measurement for the body gyroscope jerk
- stdDevOfXvalueTimeDomainBodyGyroscopeJerk - standard deviation of the X value for the time domain measurement of body gyro scope jerk
- stdDevOfYvalueTimeDomainBodyGyroscopeJerk - standard deviation of the Y value for the time domain measurement of body gyro scope jerk
- stdDevOfZvalueTimeDomainBodyGyroscopeJerk - standard deviation of the Z value for the time domain measurement of body gyro scope jerk
- meanOfMagnitudeTimeDomainBodyAcceleration - mean of the magnitude of the time domain measurement of body acceleration
- stdDevOfMagnitudeTimeDomainBodyAcceleration - standard deviation of the magnitude of the time domain measurement of body acceleration
- meanOfMagnitudeTimeDomainGravityAcceleration - mean of the magnitude of the time domain measurement of gravity acceleration
- stdDevOfMagnitudeTimeDomainGravityAcceleration - standard deviation of the magnitude of the time domain measurement of gravity acceleration
- meanOfMagnitudeTimeDomainBodyAccelerationJerk - mean of the magnitude of the time domain measurement of body acceleration jerk
- stdDevOfMagnitudeTimeDomainBodyAccelerationJerk - standard deviation of the magnitude of the time domain measurement of body acceleration jerk
- meanOfMagnitudeTimeDomainBodyGyroscope - mean of the magnitude of the time domain measurement of the body gyroscope
- stdDevOfMagnitudeTimeDomainBodyGyroscope - standard deviation of the magnitude of the time domain measurement of the body gyroscope
- meanOfMagnitudeTimeDomainBodyGyroscopeJerk - mean of the magnitude of the time domain measurement of the body gyroscope jerk
- stdDevOfMagnitudeTimeDomainBodyGyroscopeJerk - standard deviation of the magnitude of the time domain measurement of body gyroscope jerk
- meanOfXvalueFreqDomainBodyAcceleration - mean of the X value of the frequency domain measurement of body acceleration
- meanOfYvalueFreqDomainBodyAcceleration - mean of the Y value of the frequency domain measurement of body acceleration
- meanOfZvalueFreqDomainBodyAcceleration - mean of the Z value of the frequency domain measurement of body acceleration
- stdDevOfXvalueFreqDomainBodyAcceleration - standard deviation of the X value of the frequency domain measurement of body acceleration
- stdDevOfYvalueFreqDomainBodyAcceleration - standard deviation of the Y value of the frequency domain measurement of body acceleration
- stdDevOfZvalueFreqDomainBodyAcceleration - standard deviation of the Z value of the frequency domain measurement of body acceleration
- meanOfXvalueFreqDomainBodyAccelerationJerk - mean of the X value of the frequency domain measurement of body acceleration jerk
- meanOfYvalueFreqDomainBodyAccelerationJerk - mean of the Y value of the frequency domain measurement of body acceleration jerk
- meanOfZvalueFreqDomainBodyAccelerationJerk - mean of the Z value of the frequency domain measurement of body acceleration jerk
- stdDevOfXvalueFreqDomainBodyAccelerationJerk - standard deviation of the X value of the frequency domain measurement of body acceleration jerk
- stdDevOfYvalueFreqDomainBodyAccelerationJerk - standard deviation of the Y value of the frequency domain measurement of body acceleration jerk
- stdDevOfZvalueFreqDomainBodyAccelerationJerk - standard deviation of the Z value of the frequency domain measurement of body acceleration jerk
- meanOfXvalueFreqDomainBodyGyroscope - mean of the X value for the frequency domain measurement of the body gyroscope
- meanOfYvalueFreqDomainBodyGyroscope - mean of the Y value for the frequency domain measurement of the body gyroscope
- meanOfZvalueFreqDomainBodyGyroscope - mean of the Z value for the frequency domain measurement of the body gyroscope
- stdDevOfXvalueFreqDomainBodyGyroscope - standard deviation of the X value of the frequency domain measurement of the body gyroscope
- stdDevOfYvalueFreqDomainBodyGyroscope - standard deviation of the Y value of the frequency domain measurement of the body gyroscope
- stdDevOfZvalueFreqDomainBodyGyroscope - standard deviation of the Z value of the frequency domain measurement of the body gyroscope
- meanOfMagnitudeFreqDomainBodyAcceleration - mean of the magnitude of the frequency domain measurement of body acceleration
- stdDevOfMagnitudeFreqDomainBodyAcceleration - standard deviation of the magnitude of the frequency domain measurement of body acceleration
- meanOfMagnitudeFreqDomainBodyAccelerationJerk - mean of the magnitude of the frequency domain measurement of body acceleration jerk
- stdDevOfMagnitudeFreqDomainBodyAccelerationJerk - standard deviation of the magnitude of the frequency domain measurement of body acceleration jerk
- meanOfMagnitudeFreqDomainBodyGyroscope - mean of the magnitude of the frequency domain measurement of the body gyroscope
- stdDevOfMagnitudeFreqDomainBodyGyroscope - standard deviation of the magnitude of the frequency domain measurement of the body gyroscope
- meanOfMagnitudeFreqDomainBodyGyroscopeJerk - mean of the magnitude of the frequency domain measurement of the body gyroscope jerk
- stdDevOfMagnitudeFreqDomainBodyGyroscopeJerk - standard deviation of the magnitude of the frequency domain measurement of the body gyroscope jerk
