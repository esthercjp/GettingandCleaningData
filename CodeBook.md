---
## Codebook for Tidy Dataset : Getting and Cleaning Data Course Project

---

#Data
 
This data is originally sourced from Human Activity Recognition Using Smartphones Data Set. Reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For more details on feature selection, please refer to features.txt and feature_info.txt. 

#Analysis

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).


#Feature
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag

#Data transformations

This analysis plan "extracts only the measurements on the mean and standard deviation for each measurement" as required by the course project.

The codes seek to bind three datasets ("...train", "...test" and "...subject..") into one dataset. 

From this merged dataset, an intermediate dataset is created, containing the values of estimated mean (i.e. variables that capture mean) and standard deviation (i.e. variables with labels that contain 'std') of each measurement.

Description of activity names are then added for ease of reference and understanding. 

From this intermediate dataset, a final tidy dataset is created -- tidy.txt 


