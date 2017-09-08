# Project_tidy_data
The script “run_analysis.R” can change the data in the directory"UCI HAR Dataset/train" into a tidy data table.
First, it will read the test data and train data from the files in the directory into two data sets:"test_data","train_data".
Then we merge the two data sets into one data table:"data".
Next, we extract only the measurements on the mean and standard deviation for each measurement.
We use descriptive activity names to name the activities in the data set and labels the data set with descriptive variable names.
Last,we create a second, independent tidy data set:"data_tidy" with the average of each variable for each activity and each subject.


