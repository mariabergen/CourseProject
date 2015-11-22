# CourseProject

README file for the Getting and Cleaning Data course project

Course project using data collected by: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. All the information regarding the conducted experiment is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Briefly, the experiment consist on collecting data from Samsung smartphones accelerometers. Thirty volunteers wore the smartphones around their waists while performing a series of activities: walking, climbing and descending stairs, sitting, standing and laying. 

The raw data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For the current project the following files are needed: X_test.txt, X_train.txt, subject_test.txt, subject_train.txt, y_test.txt, y_train.txt, features_info.txt, features.txt, activity_labels.txt, and Readme.txt.

The script run_analysis.R is done in steps following the directions from the project. The first step, prior to any data wrangling is to read the data into R. This is done using read.table for the files X_test.txt, subject_test.txt, y_test.txt, X_train.txt, subject_train.txt, y_train.txt, and features.txt.

1 .- The data from the test set and the train set is merged together. First, the test data is joined in a single table, with the subjects, activities and features data, (in that precise order in the columns) in a data frame named test_table, using cbind. Next, the same is produced for the train set, train_table. Finally, the two data frames are merged together by using rbind, creating a data frame named single_table, since they both have the same number of columns (as well as them representing the same variables).

2 .- Extract the mean and standard deviation features from the single table just created. Inspecting the feature.txt file, we can see that there is a number of features with names ending in either _mean or _std. Those are the feautures chosen for the new table. Defining the exact columns that need to be chosen by indexing, we can create a subset of the initial single_table. This new data frame is named short_table.

3. - Rename the variables in the activities column to be more descriptive. The activity_labels.txt file indicates the equivalence between the numbers that appear in both the y_test.txt and the y_train.txt files and the precise activity undertaken by the subjects. The variable is renamed using replace.

 4.- Appropriately label the data set with descriptive variable names.
The names provided by the original data files in features.txt are used in this case, as they seem descriptive enough. The feautre.txt file is read and the data frame is transposed to convert the column with the features names into a row to be added to the short_table using names(short_table).

5 .-
