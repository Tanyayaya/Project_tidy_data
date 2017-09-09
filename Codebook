# Code book
This is the code book for the data cleaning coursera project.
Find here descriptions of variables, data and any transformations peformed to clean up the data.

## Data
X_train.txt: Measurements of training data.  
Y_train.txt: Activity of training data. Numbers represent activities.  
subject_train.txt: Subject who performed the activity for each window sample. Its range is from 1 to 30.   
X_test.txt: Measurements of test data.  
Y_test.txt: Activity of test data. Numbers represent activities.  
subject_test.txt:Ssubject who performed the activity for each window sample. Its range is from 1 to 30.  
features.txt: names for all the measurements.  

## Variables
train_data:includes the subjects,labels and measurements of training data
test_data:includes the subjects,labels and measurements of test data
data:includes both training data and test data
data_good:includes the subjects,labels,averages and standard deviations for each measurements in test and training.
data_tidy:includes the averages of each variable for each activity and each subject in test and training.

## Transformations
Train and test data was read in and combined using rbind.   
The required columns were selected using a regular expression.  
Activity labels substituted numbers in the activity column and data in the "activity_labels.txt" file.  
Data was grouped and averaged using the melt and cast functions in the "reshape" package to produce the final data set "data_tidy".
