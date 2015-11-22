# README file for the Getting and Cleaning Data course project

The script run_analysis.R is done in steps following the directions from the project. 

1. Read the data into R. This is done using read.table() for the files X_test.txt, subject_test.txt, y_test.txt, X_train.txt, subject_train.txt, y_train.txt, and features.txt.

2. The data from the test set and the train set are merged together. First, the test data is joined in a single table, with the subjects, activities and features data, (in that precise order in the columns) in a data frame named test_table, using cbind. Next, the same is produced for the train set, train_table. Finally, the two data frames are merged together by using rbind, creating a data frame named single_table, since they both have the same number of columns (563, as well as them representing the same variables).

3. Extract the mean and standard deviation features from the single table just created. Inspecting the feature.txt file, we can see that there is a number of features with names ending in either -mean()* or -std()*. Those are the features chosen for the new table. Defining the exact columns that need to be chosen by indexing, we can create a subset of the initial single_table. This new data frame is named short_table and its columns are the subject (volunteer), activity and the 66 columns that represent all the measurements ending in either -mean()* or -std()*.

4. Rename the variables in the activities column to be more descriptive. The activity_labels.txt file indicates the equivalence between the numbers that appear in both the y_test.txt and the y_train.txt files and the precise activity undertaken by the subjects. The variable is renamed using replace (for that we need to use the "dplyr" package).

5. Appropriately label the data set with descriptive variable names.
The names provided by the original data files in features.txt are used in this case, as they seem very descriptive (the CodeBook.md gives a reasoning behind using this nomenclature). The feature.txt file is read using read.table() (and named features). The resulting data frame is then "shortened" by choosing only the variables ending in either -mean()* or -std()* by indexing (neededFeatures_bis). The short table is named short_features (dimensions 66 x 2). The data frame is transposed using as.matrix. This results in a transposed data frame where the second row has all the features names. The "Subject" and "Activity" characters are added to this second row (previously selected by indexing). The resulting character vector has the right number of variables and can be added to the short_table using names(short_table).

6. From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject. The last step is done by grouping by "Subject" and "Activity", using group_by and calculating the mean using summarize_each. The resulting table, tidy_table is composed by the 30 volunteers and each of the 6 activities they performed, and the mean for each of the 66 initial measurements ending in either -mean()* or -std()*. The table is then exported out of R using write.table(), choosing row.names=FALSE




