## Code Book

## Original Data

The original datasets are taken from the smartphone accelerometer and gyroscope 3-axial raw signals, which have been processed using various signal processing techniques to measurement vector consisting of 561 features. 

## ID Fields

* Variable 1: `subject`
There are a total of 30 subjects.  The "subject" field refers to the participant's subject ID.
 
* Variable 2: `activity` 
This refers to the label of the activity performed when the corresponding measurements were taken.

There are six different activities:

- `WALKING` (value 1)

- `WALKING_UPSTAIRS` (value 2)

- `WALKING_DOWNSTAIRS` (value 3)

- `SITTING` (value 4)

- `STANDING` (value 5)

- `LAYING` (value 6)

* Variable 3: Features
A total of 79 features or measurements of activity were selected from the original data using a grep on "mean|std". These features (along with the above 2 variables) form a total of 81 columns.  The names of these variables are the same as in features.txt but the values are averages of each variable for each activity and each subject.

A small sample of the features is provided below:

* `tBodyAcc-mean()-X` (column `1`)
* `tBodyAcc-mean()-Y` (column `2`)
* `tBodyAcc-mean()-Z` (column `3`)
* `tBodyAcc-std()-X` (column `4`)
* `tBodyAcc-std()-Y` (column `5`)
* `tBodyAcc-std()-Z` (column `6`)
* `tGravityAcc-mean()-X` (column `41`)
* `tGravityAcc-mean()-Y` (column `42`)
* `tGravityAcc-mean()-Z` (column `43`)
* `tGravityAcc-std()-X` (column `44`)
* `tGravityAcc-std()-Y` (column `45`)
* `tGravityAcc-std()-Z` (column `46`)


A full description of the features is in the file features_info.txt, included with the original dataset.
