# Codebook for Course project for Getting and Cleaning Data

- Goal: prepare tidy data that can be used for later analysis.
- Author:  Jonathan Hull
- Date: Oct. 18, 2014


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

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Summary Choices

Step 2 of the project required that we extract measurements on the mean and standard deviation of each measurement.  I interpreted this to mean that I should choose the original variable names that end in mean() or std() since they are the mean or standard deviation of another measurement.

This decision selected 66 variables for further analysis.

## Code Book

The tidy data set that is output in tidy_data.txt contains the following 66 variable names

1. meanOfXvalueTimeDomainBodyAcceleration - mean of the X value of the time domain value for body acceleration
2. meanOfYvalueTimeDomainBodyAcceleration - mean of the Y value of the time domain value for body acceleration
3. meanOfZvalueTimeDomainBodyAcceleration - mean of the Z value of the time domain value for body acceleration
4. stdDevOfXvalueTimeDomainBodyAcceleration - standard deviation of X value for the time domain measurement of body acceleration
5. stdDevOfYvalueTimeDomainBodyAcceleration - standard deviation of Y value for the time domain measurement of body acceleration
6. stdDevOfZvalueTimeDomainBodyAcceleration - standard deviation of Z value for the time domain measurement of body acceleration
7. meanOfXvalueTimeDomainGravityAcceleration - mean of the X value of the time domain measurement of gravity acceleration
8. meanOfYvalueTimeDomainGravityAcceleration - mean of the Y value of the time domain measurement of gravity acceleration
9. meanOfZvalueTimeDomainGravityAcceleration - mean of the Z value of the time domain measurement of gravity acceleration
10. stdDevOfXvalueTimeDomainGravityAcceleration - standard deviation of the X value of the time domain measurement for gravity acceleration
11. stdDevOfYvalueTimeDomainGravityAcceleration - standard deviation of the Y value of the time domain measurement for gravity acceleration
12. stdDevOfZvalueTimeDomainGravityAcceleration - standard deviation of the Z value of the time domain measurement for gravity acceleration
13. meanOfXvalueTimeDomainBodyAccelerationJerk - mean of the X value for the time domain measurement of body acceleration jerk
14. meanOfYvalueTimeDomainBodyAccelerationJerk - mean of the Y value for the time domain measurement of body acceleration jerk
15. meanOfZvalueTimeDomainBodyAccelerationJerk - mean of the Z value for the time domain measurement of body acceleration jerk
16. stdDevOfXvalueTimeDomainBodyAccelerationJerk - standard deviation of the X value for the time domain measurement of body acceleration jerk
17. stdDevOfYvalueTimeDomainBodyAccelerationJerk - standard deviation of the Y value for the time domain measurement of body acceleration jerk
18. stdDevOfZvalueTimeDomainBodyAccelerationJerk - standard deviation of the Z value for the time domain measurement of body acceleration jerk
19. meanOfXvalueTimeDomainBodyGyroscope - mean of the X value for the time domain measurement of the body gyroscope
20. meanOfYvalueTimeDomainBodyGyroscope - mean of the Y value for the time domain measurement of the body gyroscope
21. meanOfZvalueTimeDomainBodyGyroscope - mean of the Z value for the time domain measurement of the body gyroscope
22. stdDevOfXvalueTimeDomainBodyGyroscope - standard deviation of the X value of the time domain measurement of the body gyroscope
23. stdDevOfYvalueTimeDomainBodyGyroscope - standard deviation of the Y value of the time domain measurement of the body gyroscope
24. stdDevOfZvalueTimeDomainBodyGyroscope - standard deviation of the Z value of the time domain measurement of the body gyroscope
25. meanOfXvalueTimeDomainBodyGyroscopeJerk - mean of the X value of the time domain measurement for the body gyroscope jerk
26. meanOfYvalueTimeDomainBodyGyroscopeJerk - mean of the Y value of the time domain measurement for the body gyroscope jerk
27. meanOfZvalueTimeDomainBodyGyroscopeJerk - mean of the Z value of the time domain measurement for the body gyroscope jerk
28. stdDevOfXvalueTimeDomainBodyGyroscopeJerk - standard deviation of the X value for the time domain measurement of body gyro scope jerk
29. stdDevOfYvalueTimeDomainBodyGyroscopeJerk - standard deviation of the Y value for the time domain measurement of body gyro scope jerk
30. stdDevOfZvalueTimeDomainBodyGyroscopeJerk - standard deviation of the Z value for the time domain measurement of body gyro scope jerk
31. meanOfMagnitudeTimeDomainBodyAcceleration - mean of the magnitude of the time domain measurement of body acceleration
32. stdDevOfMagnitudeTimeDomainBodyAcceleration - standard deviation of the magnitude of the time domain measurement of body acceleration
33. meanOfMagnitudeTimeDomainGravityAcceleration - mean of the magnitude of the time domain measurement of gravity acceleration
34. stdDevOfMagnitudeTimeDomainGravityAcceleration - standard deviation of the magnitude of the time domain measurement of gravity acceleration
35. meanOfMagnitudeTimeDomainBodyAccelerationJerk - mean of the magnitude of the time domain measurement of body acceleration jerk
36. stdDevOfMagnitudeTimeDomainBodyAccelerationJerk - standard deviation of the magnitude of the time domain measurement of body acceleration jerk
37. meanOfMagnitudeTimeDomainBodyGyroscope - mean of the magnitude of the time domain measurement of the body gyroscope
38. stdDevOfMagnitudeTimeDomainBodyGyroscope - standard deviation of the magnitude of the time domain measurement of the body gyroscope
39. meanOfMagnitudeTimeDomainBodyGyroscopeJerk - mean of the magnitude of the time domain measurement of the body gyroscope jerk
40. stdDevOfMagnitudeTimeDomainBodyGyroscopeJerk - standard deviation of the magnitude of the time domain measurement of body gyroscope jerk
41. meanOfXvalueFreqDomainBodyAcceleration - mean of the X value of the frequency domain measurement of body acceleration
42. meanOfYvalueFreqDomainBodyAcceleration - mean of the Y value of the frequency domain measurement of body acceleration
43. meanOfZvalueFreqDomainBodyAcceleration - mean of the Z value of the frequency domain measurement of body acceleration
44. stdDevOfXvalueFreqDomainBodyAcceleration - standard deviation of the X value of the frequency domain measurement of body acceleration
45. stdDevOfYvalueFreqDomainBodyAcceleration - standard deviation of the Y value of the frequency domain measurement of body acceleration
46. stdDevOfZvalueFreqDomainBodyAcceleration - standard deviation of the Z value of the frequency domain measurement of body acceleration
47. meanOfXvalueFreqDomainBodyAccelerationJerk - mean of the X value of the frequency domain measurement of body acceleration jerk
48. meanOfYvalueFreqDomainBodyAccelerationJerk - mean of the Y value of the frequency domain measurement of body acceleration jerk
49. meanOfZvalueFreqDomainBodyAccelerationJerk - mean of the Z value of the frequency domain measurement of body acceleration jerk
50. stdDevOfXvalueFreqDomainBodyAccelerationJerk - standard deviation of the X value of the frequency domain measurement of body acceleration jerk
51. stdDevOfYvalueFreqDomainBodyAccelerationJerk - standard deviation of the Y value of the frequency domain measurement of body acceleration jerk
52. stdDevOfZvalueFreqDomainBodyAccelerationJerk - standard deviation of the Z value of the frequency domain measurement of body acceleration jerk
53. meanOfXvalueFreqDomainBodyGyroscope - mean of the X value for the frequency domain measurement of the body gyroscope
54. meanOfYvalueFreqDomainBodyGyroscope - mean of the Y value for the frequency domain measurement of the body gyroscope
55. meanOfZvalueFreqDomainBodyGyroscope - mean of the Z value for the frequency domain measurement of the body gyroscope
56. stdDevOfXvalueFreqDomainBodyGyroscope - standard deviation of the X value of the frequency domain measurement of the body gyroscope
57. stdDevOfYvalueFreqDomainBodyGyroscope - standard deviation of the Y value of the frequency domain measurement of the body gyroscope
58. stdDevOfZvalueFreqDomainBodyGyroscope - standard deviation of the Z value of the frequency domain measurement of the body gyroscope
59. meanOfMagnitudeFreqDomainBodyAcceleration - mean of the magnitude of the frequency domain measurement of body acceleration
60. stdDevOfMagnitudeFreqDomainBodyAcceleration - standard deviation of the magnitude of the frequency domain measurement of body acceleration
61. meanOfMagnitudeFreqDomainBodyAccelerationJerk - mean of the magnitude of the frequency domain measurement of body acceleration jerk
62. stdDevOfMagnitudeFreqDomainBodyAccelerationJerk - standard deviation of the magnitude of the frequency domain measurement of body acceleration jerk
63. meanOfMagnitudeFreqDomainBodyGyroscope - mean of the magnitude of the frequency domain measurement of the body gyroscope
64. stdDevOfMagnitudeFreqDomainBodyGyroscope - standard deviation of the magnitude of the frequency domain measurement of the body gyroscope
65. meanOfMagnitudeFreqDomainBodyGyroscopeJerk - mean of the magnitude of the frequency domain measurement of the body gyroscope jerk
66. stdDevOfMagnitudeFreqDomainBodyGyroscopeJerk - standard deviation of the magnitude of the frequency domain measurement of the body gyroscope jerk
