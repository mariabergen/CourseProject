
## 1.- Merge the training and the test sets to create one data set.
## First, read the data into R.
## Test data
test <- read.table("./test/X_test.txt", sep="", dec=".") ## make sure to use dec="."
subj_test <- read.table("./test/subject_test.txt", sep="")
lab_test <- read.table("./test/y_test.txt", sep="")

## Train data
train <- read.table("./train/X_train.txt", sep="", dec=".")
subj_train <- read.table("./train/subject_train.txt", sep="")
lab_train <- read.table("./train/y_train.txt", sep="")

## Create a test table with subject, activity and features (all for now)
## act_subj_test <- cbind(subj_test, lab_test)
##names(act_subj_test) <- c("Subject", "Activity")
test_table <- cbind(subj_test, lab_test, test) 
## Check that the table has the right number of dimensions
dim(test_table) ## [1] 2947 563

## Idem for the train data
## act_subj_train <- cbind(subj_train, lab_train)
## names(act_subj_bis) <- c("Subject", "Activity")
train_table <- cbind(subj_train, lab_train, train)
dim(train_table) ## [1] 7352  563

## test_table and train_table have the same number of columns

## Create a single table
single_table <- rbind(test_table, train_table)

## 2.- Extract only the measurements on the mean and standard deviation 
## for each measurement.

## Check using the features.txt files which columns refer to either mean or std.
## Beware that by adding the activity and the subject columns in front of the 
## feature table, we need to move two spaces.
## Separate the mean and standard from the rest


neededFeatures <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 
                    216:217, 229:230, 242:243, 255:256, 268:273,
                    347:352, 426:431, 505:506, 518:519, 531:532,
                    544:545)
## neededFeatures represent the columns to keep, the subject, activity and all
## of the features ending in either _mean or _std.

short_table <- single_table[, neededFeatures]

## 3.- Use descriptive activity names to rename the activities in the data set.
## According to the activity_labels.txt file, the numbers in the activity files 
##(y_test.txt and y_train.txt) correspond to: 1 WALKING, 2 WALKING_UPSTAIRS, 
## 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING. 
## Since there are only 6 activities, I do it individually, for a larger number of 
## changes, a for loop could be more efficient.

short_table$V1.1 <- replace(short_table$V1.1, short_table$V1.1 == 1, "Walking")
short_table$V1.1 <- replace(short_table$V1.1, short_table$V1.1 == 2, "Walking_Upstairs")
short_table$V1.1 <- replace(short_table$V1.1, short_table$V1.1 == 3, "Walking_Downstairs")
short_table$V1.1 <- replace(short_table$V1.1, short_table$V1.1 == 4, "Sitting")
short_table$V1.1 <- replace(short_table$V1.1, short_table$V1.1 == 5, "Standing")
short_table$V1.1 <- replace(short_table$V1.1, short_table$V1.1 == 6, "Laying")


## 4.- Appropriately label the data set with descriptive variable names. 

features <- read.table("./features.txt", sep="")
## Get only the features that pertain to _mean and _std
neededFeatures_bis <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 
                        214:215, 227:228, 240:241, 253:254, 266:271,
                        345:350, 424:429, 503:504, 516:517, 529:530,
                        542:543)
## Shorten the features data frame to just the one we are interested in.
short_features <- features[neededFeatures_bis,]
## Transpose the matrix, from 66 x 2 to 2 x 66
features_labels <- t(as.matrix(short_features))
## We are only interested in the second row, the one with the variable names
features_names <- features_labels[2,]
## Add the Subject and Activity to the beginning of the character, so that
## it can be used to add it to the short_table already created
add_activity <- append("Activity", features_names)
add_subject <- append("Subject", add_activity)
## Add the names to the short table
names(short_table) <-add_subject


## 5.- From the data set in step 4, create a second, independent tidy data set 
## with the average of each variable for each activity and each subject. 


tidy_table <- short_table %>% group_by(Subject, Activity) %>% summarize_each(funs(mean),contains("mean()"), contains("std()"))

## The resulting tidy table has been then exported from R using:
write.table(tidy_table, "tidy_table.txt", sep="\t", row.names=FALSE)
## It can be read into R using read.table(). 


