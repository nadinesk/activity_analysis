library(dplyr)
library(tidyr)

setwd("/Users/nadinekhattak/Desktop/data_project")

if(!file.exists("./data_source")) {dir.create("./data_source")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data_source/projectfile.zip", method="curl")



###TEST##########################
#read test files###
x_test <- read.table("data_source/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data_source/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data_source/UCI HAR Dataset/test/subject_test.txt")

#rename activity variable to "activity"
y_test <- rename(y_test, activity = V1)
#rename subject variable to "subject"
subject_test <- rename(subject_test, subject=V1)
#combine values with their activity and subject
master_test <- cbind(subject_test, y_test, x_test)

#reshape master_test by grouping by activty and subject, putting column names and values in rows
gather_test <- gather(master_test, key=activity, subject )

#rename measurement column to "measurement_code"
names(gather_test)[3] <- "measurement_code"

#rename value variable to "value"
names(gather_test)[4] <- "value"

#remove "V" character in measurement column, to prepare for merge with features
gather_test$measurement_code <- gsub('V','',gather_test$measurement_code)

table(gather_test$measurement_code)

###TRAIN##########################
##read train files
x_train <- read.table("data_source/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data_source/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data_source/UCI HAR Dataset/train/subject_train.txt")

#rename activity variable to "activity"
y_train <- rename(y_train, activity = V1)
#rename subject variable to "subject"
subject_train <- rename(subject_train, subject=V1)
#combine values with their activity and subject
master_train <- cbind(subject_train, y_train, x_train)

#reshape master_test by grouping by activty and subject, putting column names and values in rows
gather_train <- gather(master_train, key=activity, subject )

#rename measurement column to "measurement_code"
names(gather_train)[3] <- "measurement_code"

#rename activity variable to "activity"
names(gather_train)[4] <- "value"

#remove "V" character in measurement column, to prepare for merge with features
gather_train$measurement_code <- gsub('V','',gather_train$measurement_code)

######MERGE TRAIN AND TEST######################

master.train_test <- rbind(gather_train, gather_test)


###FEATURES FILE###

features <- read.table("data_source/UCI HAR Dataset/features.txt")
str(features)

##identify columns with mean() calculation
features$mean <- grepl("mean()\\>", features$V2)

##identify columns with std() calculation
features$std <- grepl("std()\\>", features$V2)

##double check ###
feature_code <- select(test_train_feature.subset, unique(measurement_code))
unique.feature_code <- unique(feature_code)
str(unique.feature_code)


######MERGE TRAIN AND TEST WITH FEATURES######################
test_train_feature <- merge(master.train_test, features, by.x="measurement_code", by.y="V1")

test_train_feature <- test_train_feature %>% 
  rename(measurement_name = V2) 

str(test_train_feature)


#keep only measurements with mean or std calculations
test_train_feature.subset <- filter(test_train_feature, mean == TRUE | std == TRUE)

test_train_feature.subset$activity_desc <- test_train_feature.subset$activity

test_train_feature.subset$activity_desc <- gsub('1','WALKING',test_train_feature.subset$activity_desc )
test_train_feature.subset$activity_desc <- gsub('2','WALKING_UPSTAIRS',test_train_feature.subset$activity_desc )
test_train_feature.subset$activity_desc <- gsub('3','WALKING_DOWNSTAIRS',test_train_feature.subset$activity_desc )
test_train_feature.subset$activity_desc <- gsub('4','SITTING',test_train_feature.subset$activity_desc )
test_train_feature.subset$activity_desc <- gsub('5','STANDING',test_train_feature.subset$activity_desc )
test_train_feature.subset$activity_desc <- gsub('6','LAYING',test_train_feature.subset$activity_desc )

###Averages and Tidy Data #####

act_subj.mean <- test_train_feature.subset %>% 
  group_by(subject, activity_desc, measurement_name ) %>%
  summarize(mean(value)) %>%
  rename(average = `mean(value)`)

tidy_act_subj.mean <- tbl_df(act_subj.mean)
rename(tidy_act_subj.mean, activity = activity_desc)
                        
str(tidy_act_subj.mean)

write.table(x=tidy_act_subj.mean, file = "tidy_act_subj_mean.txt", row.names=FALSE)


