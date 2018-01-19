# Codebook for Programming Assignment 3
Getting and Cleaning Data for R Programming on Coursera

## Original files included in zip file

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features. Links the class labels with their features name.
`561 observations of 2 variables V1 (numeric) and V2 (character)`

- 'activity_labels.txt': List of all activities. Links the class labels with their activity name.
`6 observations of 2 variables V1 (numeric) and V2 (character)`

- 'train/X_train.txt': Training set. `7352 observations of 561 variables` Observations are connected to subject_train observations.
Variables are connected to features/txt observations.

- 'train/y_train.txt': Training labels. `7352 observations of 1 variable V1` Variable is connected to features/txt observations.

- 'test/X_test.txt': Test set. `2947 observations of 561 variables` Observations are connected to subject_test observations.
Variables are connected to features/txt observations.

- 'test/y_test.txt': Test labels. `2947 observations of 1 variable V1` Variable is connected to features/txt observations.

- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
`subject_test: 2947 observations of 1 variable V1`. Note: V1 variable in subject_test has different data than V1 variable for subject_train (no duplicate).
`subject_train: 7352 observations of 1 variable V1`. Note: V1 variable in subject_train has different data than V1 variable for subject_test (no duplicate).

- 'train/Inertial Signals/.txt' and 'test/Inertial Signals/.txt' files: are data originating from sensor signals (accelerometer and gyroscope).

## New files created by analysis

- `features.txt` is renamed `features_labels.txt` to remain consistent with activity_labels file name.
- `FEATURES`: combines X_train and X_test by rows. Result is `10299 observations of 561 variables`
- `ACTIVITIES`: combines y_train and y_test by rows. Result is `10299 obserbations of 1 variable`
- `SUBJECTS`: combines subject_train and subject_test by rows. Result is `10299 obserbations of 1 variable`
- `MYDATA`: combines FEATURES, ACTIVITIES and SUBJECTS tables by columns. Result it `10299 observations of 563 variables`
- `MYDATA_EXTRACT`: is an extract of MYDATA and only keeps columns for subject ID, activity names and all sensor signal data that include characters `mean` and `std`.
Result is `10299 observations of 81 variables`
- `MYtidyDATA`: is an extract of MYDATA after (1) cleaning / renaming column names in MYDATA and (2) getting the mean for each FEATURES in the entire data set.
Result is `180 observations of 466 variables`.

None of the other original data files are used.


