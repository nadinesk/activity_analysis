#Overview

This script uses data from this source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
A description of the data is located here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
A description of the resulting dataset can also be found in this repository’s Codebook.md 
 
The final tidy dataset includes averages of measurements on the mean and standard deviation, by subject and activity.  
 
I used two packages in this Script: the dplyr and tidyr packages.  
 
I used the following files within the source above to create this dataset:  
* 'features_info.txt': Shows information about the variables used on the feature vector. 
* 'features.txt': List of all features. 
* 'activity_labels.txt': Links the class labels with their activity name. 
* 'train/X_train.txt': Training set. 
* 'train/y_train.txt': Training labels. 
* 'train/subject_test.txt': Training subjects. 
* 'test/X_test.txt': Test set. 
* 'test/y_test.txt': Test labels. 
* 'test/subject_test.txt': Test subjects. 
 
#Script Steps

Test and Train data:  
* Read in the X_test, y_test, and subject_test data. 
* Rename the y_test variable to “activity.” 
* Rename the subject_test variable to “subject.” 
* Combine the three data frames into one data frame. 
* Group the resulting data frame by activity and subject, displaying measurement codes and values in two columns by activity and subject. 
* Rename the measurement values variable to “values” and the measurement code variable to “measurement_code.” Only include numerical values in the measurement_code variable. The resulting dataframe is the master test data frame. 
* Perform the five steps above for the ‘train’ files, to get one master train data frame. 
* Merge the master test and master train data frames. 

Features data:  
* Read in the features.txt file.  
* Identify the features that contain mean calculations, creating a column showing TRUE for those that contain the mean, and FALSE for those that don’t. 
* Repeat the step above (step 2) for standard deviation.  

Merge Test and Train Data with Features Information:  
* Merge the test and train data frame with the features data frame on measurement code.  
* Filter the resulting dataset for those with only mean and standard deviation measurements (TRUE for the mean variable and TRUE for the std variables created in an above step).  
* Replace Activity codes with activity names, from the activity_labels.txt file 

Summarize Data (Measurement Averages by Subject and Activity):  
* Group the filtered data frame by subject and activity description, and measurement name 
* Calculate the mean on the grouped data.  
* Tidy the data set using the tbl_df function.
* Reshape the data to wide format, since feedback in first submittal indicated that I lost points for submitting in long format.
* Write the resulting data frame to a file.  
 
 
 
