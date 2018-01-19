# create data tables from .txt files using read.table function
X_train <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/test/subject_test.txt")

activity_labels<-read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/activity_labels.txt")
features_labels<-read.table("~/Desktop/Coursera_DS/UCI HAR Dataset/features.txt")

# combine each data table by rows with rbind function
FEATURES <- rbind(X_train, X_test)
ACTIVITIES <- rbind(y_train, y_test)
SUBJECTS <- rbind(subject_train, subject_test)

# rename variable names in data tables SUBJECTS and ACTIVITIES
names(SUBJECTS)<-c("SUBJECT")
names(ACTIVITIES)<-c("ACTIVITY")

# rename variable names in data table FEATURES
# by matching names of observations in second column of features_labels
colnames(FEATURES)<-features_labels[,2]

# rename observations in ACTIVITIES by matching labels and label id's in activity_labels
# use [] to keep order of how data is sorted in ACTIVITIES
# answers Question 3 = "Uses descriptive activity names to name the activities in the data set"
ACTIVITIES[]<-activity_labels$V2[match(unlist(ACTIVITIES),activity_labels$V1)]

# merge all data to create one clean data set using cbind function
# answers Question 1 = "Merges the training and the test sets to create one data set"
MYDATA<-cbind(SUBJECTS,ACTIVITIES,FEATURES)

# answers Question 2 = "Extract only the measurements on the mean and standard deviation for each measurement"
# use subset of grepl function
MYDATA_EXTRACT<-MYDATA[grepl("mean|std|SUBJECT|ACTIVITY",colnames(MYDATA))]

# Question 4 = "Appropriately labels the data set with descriptive variable names"
# clean FEATURES labels by replacing difficult to read labels
# use gsub function
names(MYDATA)<- gsub("\\()", "", names(MYDATA))
names(MYDATA)<- gsub("^t", "Time", names(MYDATA))
names(MYDATA)<- gsub("^f", "Frequency", names(MYDATA))
names(MYDATA)<- gsub("mad", "Median", names(MYDATA))
names(MYDATA)<- gsub("mean", "Mean", names(MYDATA))
names(MYDATA)<- gsub("std", "Standard", names(MYDATA))
names(MYDATA)<- gsub("Mag", "Magnitude", names(MYDATA))
names(MYDATA)<- gsub("sma", "Signal", names(MYDATA))
names(MYDATA)<- gsub("maxInds", "Index", names(MYDATA))
names(MYDATA)<- gsub("bandsEnergy", "Energy", names(MYDATA)) 
                             
# Question 5 = "Creates a second, independent tidy data set with the average of each variable for each activity and each subject"
# use ddply function from plyr library
# sort by subject then activity
# use numcolwise (colwise is base) to get mean across all columns and entire data frame MYDATA
library(plyr)
MYtidyDATA<- ddply(MYDATA, c("SUBJECT","ACTIVITY"), numcolwise(mean))

write.table(MYtidyDATA, file="MYtidyDATA.txt", row.names = FALSE)