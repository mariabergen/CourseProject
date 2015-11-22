# Codebook for the Getting and Cleaning Data course project

## Study Design 
Course project using data collected by: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. All the information regarding the conducted experiment is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Briefly, the experiment consist on collecting data from Samsung smartphones accelerometers and gyroscopes. Thirty volunteers wore the smartphones around their waists while performing a series of activities: walking, climbing and descending stairs, sitting, standing and laying. The volunteers were divided in two groups, 30% were chosen to be the test group, and 70% the train group.

### Raw data 
The raw data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. When unzipping the data, a main directory named "UCI HAR Dataset" is composed by two subdirectories: "test" and "train", plus four text files with common information for both the test and train data: README.txt, features_info.txt, features.txt, and activity_labels.txt. Inside the subdirectories three extra text files plus an additional subdirectory appear. 

For the current project the following files are needed: X_test.txt, X_train.txt, subject_test.txt, subject_train.txt, y_test.txt, y_train.txt, features_info.txt, features.txt, activity_labels.txt, and README.txt.

#### Variables in the raw data set

The smartphone provided measurements for the accelerometer and the gyroscope, 3-axial linear acceleration and 3-axial angular velocity, tAcc-XYZ, tGyro-XYZ. Furthermore, the accelerator measurements were separated in Body and Gravity (tBodyAcc-XYZ, and tGravityAcc-XYZ). Also, the Jerk signals were obtained (tBodyAccJerk-XYZ, tBodyGyroJerk-XYZ). Those were measured a number of times, therefore, more than a single measurement appeared in the original data set by volunteer and activity. With the measurements, a number of variables were created. For the purpose of this project, only the mean and standard deviation variables were used. See features_info.txt in the original dataset for more information.

The following measurements are provided in the X_test.txt and the X_train.txt.
A few common features make easier to understand the descriptive names applied. "t" stand for time, and the variables preceded by t indicate the time domain of the signal. "Acc" stands for accelerometer. "Body" stands for body acceleration. "Gravity" stands for gravity acceleration. "Gyro" stands for gyroscope. Jerk" stands for Jerk signal (derivative of acceleration with time). "Mag" stands for magnitude, after a Fast Fourier Transformation was applied to the signal. "f" indicates frequency domain. mean() and std() stand for mean and standard deviation.

tBodyAcc-mean()-XYZ: three variables, as they are separated in -X, -Y, and -Z

tBodyAcc-std()-XYZ

tGravityAcc-mean()-XYZ

tGravityAcc-std()-XYZ

tBodyAccJerk-mean()-XYZ

tBodyAccJerk-std()-XYZ

tBodyGyro-mean()-XYZ

tBodyGyro-std()-XYZ

tBodyGyroJerk-mean()-XYZ

tBodyGyroJerk-std()-XYZ

tBodyAccMag-mean()

tBodyAccMag-std()

tGravityAccMag-mean()

tGravityAccMag-std()

tBodyAccJerkMag-mean()

tBodyAccJerkMag-std()

tBodyGyroMag-mean()

tBodyGyroMag-std()

tBodyGyroJerkMag-mean()

tBodyGyroJerkMag-std()

fBodyAcc-mean()-XYZ

fBodyAcc-std()-XYZ

fBodyAccJerk-mean()-XYZ

fBodyAccJerk-std()-XYZ

fBodyGyro-mean()-XYZ

fBodyGyro-std()-XYZ

fBodyAccMag-mean()

fBodyAccMag-std()

fBodyBodyAccJerkMag-mean()

fBodyBodyAccJerkMag-std()

fBodyBodyGyroMag-mean()

fBodyBodyGyroMag-std()

fBodyBodyGyroJerkMag-mean()

fBodyBodyGyroJerkMag-std()

The measurements (called features in the files) are normalized in a [-1,1] range.

The features.txt indicates the names of the variables in both the X_test.txt and X_train.txt files. y_test.txt and y_train.txt provide the activities performed by the subjects (numerical) and subject_text.txt and subject_train.txt provide the subjects identifiers (numerical, as they are all anonymous)

### Creating the tidy dataset

The script run_analysis.R is done in steps following the directions from the project. The first step, prior to any data wrangling is to read (download) the data into R. This is done using read.table for the files X_test.txt, subject_test.txt, y_test.txt, X_train.txt, subject_train.txt, y_train.txt, and features.txt.

A more detailed description of the process is provided in https://github.com/mariabergen/CourseProject/README.md.

1. The data from the test set and the train set is merged together. First, the test data is joined in a single table, with the subjects, activities and features data, (in that precise order in the columns) in a data frame named test_table. Next, the same is produced for the train set, train_table. Finally, the two data frames are merged together, creating a data frame named single_table.

2. Extract the mean and standard deviation features from the single table just created. Inspecting the feature.txt file, we can see that there is a number of features with names ending in either -mean()* or -std()* (66 variables). Those are the feautures chosen for the new table. Defining the exact columns that need to be chosen by indexing, we can create a subset of the initial single_table. This new data frame is named short_table and has a dimension of 10299x68.

3. Rename the variables in the activities column to be more descriptive. The activity_labels.txt file indicates the equivalence between the numbers that appear in both the y_test.txt and the y_train.txt files and the precise activity undertaken by the subjects. The variable is renamed using replace.

4. Appropriately label the data set with descriptive variable names.
The names provided by the original data files in features.txt are used in this case, as they are sufficiently descriptive. The feature.txt file is read and the data frame is transposed to convert the column with the features names into a row to be added to the short_table using names(short_table).

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. The last step is done by grouping by "Subject" and "Activity", using group_by and calculating the mean using summarize_each. The resulting table, tidy_table is composed by the 30 volunteers and each of the 6 activities they performed, and the mean for each of the 66 initial measurements ending in either -mean()* or -std()*.

### Code book

#### Variables in the tidy dataset

The tidy dataset consists of a data frame of 180x68. The 180 rows represent the 30 volunteers and the 6 activities they performed. 

Variables:

Subject: anonymous volunteer, identified by a number (integer class)

Activity: activity performed (i.e. walking, standing, ..., as described above) (character class)

For the rest of the 66 variables, the names described above, when explaining the raw data variables, are used (all numeric). 

#### Packages used

dplyr.



