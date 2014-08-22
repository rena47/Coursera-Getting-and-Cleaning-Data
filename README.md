## The data

This dataset consists of two different types of data (test data and training data) that were obtained with 30 participants and collected using accelerometers from the Samsung Galaxy S smartphone.  Each of the 30 participants completed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) with an embedded accelerometer and gyroscope.  They were randomly assigned to the two groups with 70% of the volunteers selected for generating training data and 30% for the test data. 

A full description of the study is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Processing steps

The run_analysis.R clean up script does all of the following:

- merges the training and the test sets to create one data set.
- extracts only the measurements on the mean and standard deviation for each measurement. 
- uses descriptive activity names to name the activities in the data set
- appropriately labels the data set with descriptive variable names
- creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



## Description of the script

- The run_analysis.R script merges data from a number of .txt files and produces a tidy data set.

- It first loads the reshape2 and plyr packages.

- It then reads all required .txt files and labels the datasets

- Activity IDs and subject IDs are extracted and appended to the test and the training data.  

- Test and training data are then combined into a single data frame

- All columns with mean() and std() values are extracted using the grep() function.

- A new dataframe is then created with activity ID, subject ID, means, and standard deviation columns.  

- The merge function is used to merge descriptive activity names into this dataset. 

- A tidy dataset is then created using the melt and dcast functions to convert columns into rows and remove all unnecessary columns and display the average of each variable for each activity and each subject. 

- The resulting clean dataset contains one row for each subject/activity pair and separate columns for subject, activity, and every feature that was a mean or standard deviation from the original dataset.
