# Readme for for Course project for Getting and Cleaning Data

- Goal: prepare tidy data that can be used for later analysis.
- Author:  Jonathan Hull
- Date: Oct. 18, 2014

## This project produces Tidy Data

According to https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/01_03_componentsOfTidyData.pdf a tidy data set should have:

1.  The raw data -- we get that from the UCR data repository as described below
2. A tidy data set -- the script outputs that in tidy_data.txt
3.  A codebook describing each variable and its values.  See codebook.md
4.  An explict and exact recipe to go from the raw data to the tidy data set and the code book -- See run_analysis.R

## Source for the raw data

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

## Recipe to go from the raw data to the tidy data and the code book

See the run_analysis.R file. It contains the recipe.  The following summarizes the steps that are performed.

The code book is in codebook.md.

- Step 1.  Merge training and test sets to create one data set
This is done by reading train/subject_train.txt, train/y_train.txt, and train/X_train.txt and applying cbind().  This creates a data from with the subject id in col. 1, activity id in col. 2, and all the 561 features in the remaining columns.  The same process is aplied to the analogous files in the test/ subdirectory and the resultant data frame is appended to that produced from the previous step with rbind().

- Step 2.  Extract only the measurements on the mean and standard deviation for each measurement.
I interpreted this specification to mean that I should only extract measurements that contain "mean()" or "std()".  That is they are actually measurements on the mean or standard deviation of some measurement.

This was implemented by reading the features.txt file intro the feature_table data frame and selecting all the rows that contain the string mean() or std().

A new data from called extracted_measurements was constructed by slecting only the columns in the original data that have names selected by the previous step.

- Step 3:  Use descriptive activity names to name the activities in the data set
Each entry in the activity column in extracted_measurements was converted to a factor with descriptive names.  Recall that activity_labels.txt identifies the following numeric labels with the associated activity names:  1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING
 
The same names were used except they are in all lower case.

- Step 4:  Appropriately label the data set with descriptive variable names.
This was done by constructing descriptive variable names programatically with string matching on the cryptic variable names that were supplied with the assignment.

According to the instructions from the TA on the course project discussion page, we should not be concerned with variable names that are overly long.  So I developed some simple rules that provide descriptive (and unique) variable names.  The uniquesness was verified.

- Step 5.  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

This was done by sorting the extracted_measurements data frame by subject and then activity.  That way subject varies slowest activity fastest.  Then, the data frame was melted across all the columns because they contain the data we want to summarize.  This creates a long narrow table that dcast() could summarize.  This table is dcast() into a tidy data frame that has subject and activity on the y axis and the variable names across the x axis.

## Judging tidyness of the independent tidy data set

This program generates a tidy data text file that meets the principles of tidy data [ Hadley Wickham, "Tidy Data," Journal of Statistical Software, v. VV, Issue II, http://vita.had.co.nz/papers/tidy-data.pdf ].

You can judge the tidiness of the data set that was created by the following steps:
```` 
 data <- read.table("tidy_data.txt", header = TRUE) 
 View(data)
````
This was suggested in https://class.coursera.org/getdata-008/forum/thread?thread_id=24

You will see a table with 180 rows (1 row for each subject (30) and activity (6)).  It contains one column for each of the 66 variables defined in the code book (see codebook.md).  There is one table because we have only one kind of data.  That is the mean of the selected variables.

You will note that there is a row at the top of the tidy_data.txt file with varianble names, the variable names are human readable, and there is one file for the table.  The human readability of the variable names resulted in some seeemingly overly long variable names, but the TA instructed that that is not a problem and in fact is encouraged.

Also, the instruction list is run_analysis.R.  The input is the raw data, the output is the processed tidy data that is written to tidy_data.txt, and there are no parameters to the script.
