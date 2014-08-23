# set working directory
setwd("UCI HAR Dataset/")

## Open required libraries
library(reshape2)
library(plyr)

## Read in all activities and label the columns with activity labels
activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))

## Read the features names (column 2)
features <- read.table("features.txt")
feature_names <-  features[,2]

## Read the test data and label columns with feature names
testdata <- read.table("./test/X_test.txt")
colnames(testdata) <- feature_names

## Read the training data and label columns with feature names
traindata <- read.table("./train/X_train.txt")
colnames(traindata) <- feature_names

## Read test subjects IDs and label columns with subject IDs
test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"

## Read test data activity IDs and label columns with activity IDs
test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) <- "activity_id"

## Read training subjects IDs and label columns with subject IDs
train_subject_id <- read.table("./train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"

## Read training data activity IDs and label columns with activity IDs
train_activity_id <- read.table("./train/y_train.txt")
colnames(train_activity_id) <- "activity_id"

## Combine test subject ID, test activity ID and test data 
## by widening the dataframe
test_data <- cbind(test_subject_id , test_activity_id , testdata)

## Combine training subject ID, training activity ID and training data 
## by widening the dataframe
train_data <- cbind(train_subject_id , train_activity_id , traindata)

##Combine test data and training data into final dataframe by 
## adding vertically to dataframe
all_data <- rbind(train_data,test_data)

##Keep only columns with means and SD values
mean_col_ids <- grep("mean",names(all_data),ignore.case=TRUE)
mean_col_names <- names(all_data)[mean_col_ids]
std_col_ids <- grep("std",names(all_data),ignore.case=TRUE)
std_col_names <- names(all_data)[std_col_ids]
mean_std_data <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]

## Merge activities with  mean/STD values to get single dataset with 
## descriptive activity names
descriptive_names <- merge(activity_labels,mean_std_data,by.x="activity_id",by.y="activity_id",all=TRUE)

## Melt the dataset with the descriptive activity names
data_melt <- melt(descriptive_names,id=c("activity_id","activity_name","subject_id"))

## Cast the melted dataset using average of each variable across subjects
mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)

## Create a file with the new tidy dataset
write.table(mean_data,"./tidy_data.txt", sep="\t", row.names=FALSE)


