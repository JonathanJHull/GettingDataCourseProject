#
#  run_analysis.R
#
#    Course project for Getting and Cleaning Data
#    Goal: prepare tidy data that can be used for later analysis.
#    Author:  Jonathan Hull
#    Date: Oct. 18, 2014
#
#    Steps:  this script performs the following steps in order:
#       1.  Merges the training and the test sets to create one data set.
#       2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
#       3.  Uses descriptive activity names to name the activities in the data set
#       4.  Appropriately labels the data set with descriptive variable names. 
#       5.  From the data set in step 4, creates a second, independent tidy data set with the average of 
#              each variable for each activity and each subject.
#

  library(pracma);
  library(plyr);
  library(reshape2);
  

#######################################################################
#
#  Step 1.  Merge training and test sets to create one data set
#

#
#  read_tables(dir_name):  dir_name is either "train" or "test"
#     read the subject table (1 col), activity table (1 col), and feature table (561 cols).
#     return one table with 563 cols. that contains the data in either training or test directories
#
  read_tables <- function(dir_name) {
    # 
    # read_data_table(file_name, colname):  read the table in file_name and use the col name if present
    #    return data.table() format.
    #    Note: data.table library is required
    #
    read_data_table <- function(file_name, colname="") {
      if (colname != "") {
        df <- read.table(file_name, col.names=c(colname));
      } else {
        df <- read.table(file_name);
      }
      # return( data.table(df) );
      return(df);
    }

    subject_table  <- read_data_table(paste0(dir_name, "/subject_", dir_name,".txt"),"subject" );
    activity_table <- read_data_table(paste0(dir_name, "/y_", dir_name, ".txt"), "activity" );
    feature_table  <- read_data_table(paste0(dir_name, "/X_", dir_name, ".txt") );
    
    cbind( subject_table, activity_table, feature_table );
  } #  end function read_tables()

# 
#  read the tables in the train and test directories
#
  training_set     <- read_tables( "train" );
  test_set         <- read_tables( "test" );

#
#  Merge the training and test sets to create one data set
#
  merged_data_set  <- rbind( training_set, test_set );

#
#  clean up:  remove temporary variables
#
  rm( training_set, test_set );

######################################################################
#
#  Step 2:  Extract only the measurements on the mean and standard deviation for each measurement.
#
#    My technique: I interpreted this specification to mean that I should only extract
#    measurements that contain "mean()" or "std()".  That is they are actually measurements on the
#    mean or standard deviation of some measurement.
#
  #
  # read feature table -- columns indicate position of each feature in the vector
  #
  feature_table          <- read.table("features.txt", col.names=c("position", "feature"))
  #
  # identify measurement names that contain "mean()" or "std()"
  #
  measurement_names      <- feature_table[grepl("mean\\(\\)|std\\(\\)", feature_table$feature),];
  #
  #  add 2 to each position because the merged data set contains 2 extra cols. at the beginning
  #     of each row: the subject id and the activity.
  #
  indices                <- sapply(measurement_names$position, sum, 2);

  #
  # extract the 1st 2 cols. (they contain the subject and activity id) and 
  #   the measurement names that contain "mean()" or "std()"
  #
  extracted_measurements <- merged_data_set[ , c(1, 2, indices) ];

  #
  #  clean up: remove temp. variables
  #
  rm( feature_table, merged_data_set, indices );


##################################################################################
#
#  Step 3:  Use descriptive activity names to name the activities in the data set
#
#     My technique: convert activity column in extracted_measurements[] to a factor with descriptive names.
#     Recall that activity_labels.txt identifies the following numeric labels with the associated
#     activity names:  1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING
# 

  extracted_measurements$activity <- factor(extracted_measurements$activity, levels=1:6, 
                                            labels=c('walking', 'walking_upstairs','walking_downstairs',
                                                     'sitting', 'standing', 'laying'));

###################################################################################
#
#  Step 4:  Appropriately label the data set with descriptive variable names.
#
#    My technique:  construct descriptive variable names programatically by string
#      matching on the cryptic variable names that were supplied with the assignment.
#      According to the instructions from the TA on the course project discussion page,
#      we should not be concerned with variable names that are overly long.
#

  create_varName <- function(feature) {
    varName <- "stdDevOf";
    if (grepl("mean", feature))       { varName <- "meanOf"; }
  
    value <- "";
    if (grepl("-X$",  feature))       { value <- "Xvalue"; }
    if (grepl("-Y$",  feature))       { value <- "Yvalue"; }
    if (grepl("-Z$",  feature))       { value <- "Zvalue"; }
    if (grepl("\\(\\)$", feature))    { value <- "Magnitude";}
    varName <- strcat(varName, value);
  
    if (grepl("^t", feature))         { varName <- strcat(varName,"TimeDomain"); }
        else                          { varName <- strcat(varName,"FreqDomain"); }
  
    value <- "";
    if (grepl("BodyAcc", feature))    { value <- "BodyAcceleration"; }
    if (grepl("GravityAcc", feature)) { value <- "GravityAcceleration"; }
    if (grepl("BodyGyro", feature))   { value <- "BodyGyroscope"; }
    if (grepl("Jerk", feature))       { value <- strcat(value,"Jerk"); }
    
    varName <- strcat(varName,value);
  }

  #
  # apply create_varName() to rename the columns in extracted_measurements() with the new variable names
  #    measurement_names$feature is the list of cryptic variable names that were extracted in step 2.
  #
  col_names <- sapply(measurement_names$feature, create_varName);
  #
  #  error checking:  stop if create_varName() created at least one duplicate variable name.
  #
  if (length(col_names) != length(unique(sort(col_names)))) {
    stop("in step 4: at least one variable name was duplicated -- you need to fix string matching algorithm");
  }
  
  names(extracted_measurements) <-  c(names(extracted_measurements[,1:2]), col_names);
  


##############################################################################################
#
#   Step 5.  From the data set in step 4, create a second, independent tidy data set with the average of 
#       each variable for each activity and each subject.
#
#       My technique:  sort the extracted_measurements data frame by subject and then activity.  That way 
#       subject varies slowest activity fastest.  Then, melt the data frame across all the columns contain
#       the data we want to summarize.  This creates a long narrow table.  This is dcast() into a tidy
#       data frame that has subject and activity on the y axis and the variable names across the x axis.
  
  extracted_measurements <- arrange(extracted_measurements, subject, activity );

  melted_measurements    <- melt(extracted_measurements, id=c("subject","activity"), measure.vars=col_names );
  
  tidy_data              <- dcast(melted_measurements, subject + activity ~ variable, mean );
  
  write.table(tidy_data, file="tidy_data.txt", row.name = FALSE );
  
  
 