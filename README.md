# Cleaning data coursera project
This project contains one script "run_analysis.R". All actions are contained withing the script. 
The script will load data contained in the "UCI HAR Dataset" folder and its subfolders.
Merge the various files for (X,Y, subjects, features) into one data set for both train and test data. It will then combine the two data sets, train and test, into one data set.
## Usage
__Prerequisites__  
Unzip the data archive to the working directory.
The run_analysis.R scripts expects the Samsung data in "UCI HAR Dataset". 
Train data should be put in: "UCI HAR Dataset/train"
Test data should be put in: "UCI HAR Dataset/test"
Feature, Subject and Activity information files should be put in "UCI HAR Dataset".
__Run__
If all conditions are met, run "run_analysis.R" which should produce a file "tidy_data.txt" in the working directory.
This file contains the new tidy data set with averages for the groups.


### The data
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Taken from 30 subjects during 6 different categories:  
* Laying
* Sitting
* Standing
* Walking
* Walking downstairs
* Walking upstairs

