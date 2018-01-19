# Programming Assignment 3
Repository for Getting and Cleaning Data for R Programming on Coursera

## Goal of Programming Assignment 3
```
Demonstrate ability to collect, work with, and clean a data set.
```
### Task

Create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy `data set` with the average of each variable for each activity and each subjec

### Review critera

1. The submitted `data set` is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a codebook that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

### Source of data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Script Analysis
```
run_analysis.R
```
### Prerequisites
Download and unpack zip to working directory. No script is used for that operation.
Refer to codebook to learn more about each data file that are analysed with the script.

### Step 1

Create data tables from .txt files using `read.table` function
```
example: X_train <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/train/X_train.txt")
```
### Step 2
Combine each data table by rows with `rbind` function
```
example: FEATURES <- rbind(X_train, X_test)
```

### Step 3 
Rename variable names in data tables
```
example: names(SUBJECTS)<-c("SUBJECT")
```
```
example: colnames(FEATURES)<-features_labels[,2]
```

#### (Question 3) We use `[]` to keep order of how data is sorted in ACTIVITIES: `ACTIVITIES[]<-activity_labels$V2[match(unlist(ACTIVITIES),activity_labels$V1)]`

### Step 4

(Question 1) Merge all data to create one clean data set using `cbind` function
```
MYDATA<-cbind(SUBJECTS,ACTIVITIES,FEATURES)
```

### Step 5

(Question 2) Extract only the measurements on the mean and standard deviation for each measurement

Subset of `MYDATA` with `grepl` function.

```
MYDATA_EXTRACT<-MYDATA[grepl("mean|std|SUBJECT|ACTIVITY",colnames(MYDATA))]
```

### Step 6

(Question 4) Appropriately label the data set with descriptive variable names

Clean FEATURES labels by replacing difficult to read labels: use `gsub` function

```
example: names(MYDATA)<- gsub("\\()", "", names(MYDATA))
```
                             
### Step 7

(Question 5) Create a second, independent tidy `data set` with the average of each variable for each activity and each subject

For this question we use the `ddply` function from the `plyr` library
We then sort new tidy `data set` first by subject, second by activity
We use `numcolwise` (`colwise` is the base function) to create a loop and get the mean across all columns and entire data frame MYDATA

Loading plyr
```
library(plyr)
```
Applying ddply
```
MYtidyDATA<- ddply(MYDATA, c("SUBJECT","ACTIVITY"), numcolwise(mean))
```

### Step 8
Output the data set to a .txt file in the working directory
```
write.table(MYtidyDATA, file="MYtidyDATA.txt", row.names = FALSE)
```
