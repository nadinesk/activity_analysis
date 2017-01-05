#Study Design 
 
This dataset displays averages by subject and activity, of the mean and standard deviation measurements within a 561-feature vector measuring daily activity of 30 volunteers. A resulting 66 measurements are included (33 mean and 33 standard deviation measurements), for the 30 subjects and 6 activities. The 30 volunteers are within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) while wearing a smartphone (Samsung Galaxy S II) on their waist. The embedded accelerometer and gyroscope were used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  Seventy percent of the volunteers were selected for generating the training data and 30% the test data. 
 
The sensor signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. A 561-feature vector was obtained by calculating variables from the time and frequency domain. Features are normalized and bounded within [-1,1]. 
 
The resulting dataset combines the test and training subjects into one dataset, and uses only the mean and standard deviation measurements from the 561-feature vector. There were 33 measurements on standard deviation and 33 measurements on the mean. This dataset includes the average of each of the included 66 measurements, by subject and activity.  
 
A full description of the data is located here:  
 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
The data is collected from the following source:  
 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
The tidy dataset includes data from the following files from the source listed above:  
* 'features_info.txt': Shows information about the variables used on the feature vector. 
* 'features.txt': List of all features. 
* 'activity_labels.txt': Links the class labels with their activity name. 
* 'train/X_train.txt': Training set. 
* 'train/y_train.txt': Training labels. 
* 'train/subject_test.txt': Training subjects. 
* 'test/X_test.txt': Test set. 
* 'test/y_test.txt': Test labels. 
* 'test/subject_test.txt': Test subjects. 
 
 
#Code Book 

The included dataset includes the following variables:  

| Tables        | Are           										     | Cool  					|
| ------------- |:-----------------------------------------------------------| ------------------------:|
| subject       | A unique ID for the subject/volunteer being studied        | NA    					|
| activity_desc | One of six activities (Walking, Walking Upstairs,          | NA    					|
| 				|  <br> Walking Downstairs, Sitting, Standing, Laying) for 	 |       					| 
|				|  <br>which measurements were taken for each subject while  |       					|  
|				|  <br>wearing a smartphone on their waist.      			 |       					|
| measurement   | Measurements on the mean and standard deviation for    	 | NA    					|
|               |  <br>each measurement within a 561-feature vector with time|       					| 
|               |  <br>and frequency domain variables.       				 |       					| 	
| average       | The average of each of the included measurements,          | Normalized measurements, |
|				|	<br>by subject and activity.							 |	bounded within [-1,1]   |
|               |                            							     |       					| 
|               |  							             				     |       					| 	

 
 