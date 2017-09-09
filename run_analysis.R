# load the packages needed in the script
library(data.table)
library(stringr)
library(reshape)
#read in training data from the files and merge them into one data set
train_set<-fread("UCI HAR Dataset/train/X_train.txt")
train_label<-fread("UCI HAR Dataset/train/y_train.txt",
                   col.names = "label")
train_subject<-fread("UCI HAR Dataset/train/subject_train.txt",
                     col.names = "subject")
train_data<-cbind(train_subject,train_label,train_set)
#read in test data from the files and merge them into one data set
test_set<-fread("UCI HAR Dataset/test/X_test.txt")
test_label<-fread("UCI HAR Dataset/test/y_test.txt",
                  col.names = "label")
test_subject<-fread("UCI HAR Dataset/test/subject_test.txt",
                    col.names="subject")
test_data<-cbind(test_subject,test_label,test_set)
#merge the training data and test data into one data set
data<-rbind(test_data,train_data)
#Extracts only the measurements on the mean and standard deviation for each measurement
feature<-read.table("UCI HAR Dataset/features.txt")
feature<-apply(feature,1,"[",2)
mean_std<-which(grepl("std()|mean()|angle()",feature))+2
data_good<-data[,c(1,2,as.numeric(mean_std)),with=F]
#Uses descriptive activity names to name the activities in the data set
data_good$label<-as.character(data_good$label)%>%
  str_replace_all("1","walking")%>%
  str_replace_all("2","walking_upstairs")%>%
  str_replace_all("3","walking_downstairs")%>%
  str_replace_all("4","sitting")%>%
  str_replace_all("5","standing")%>%str_replace_all("6","laying")
#Labels the data set with descriptive variable names
colnames(data_good)<-c("subject","activity",feature[mean_std-2])
#Creates an independent tidy data set with the average of each variable for each activity and each subject
data_tidy<-melt(data_good,id=c("subject","activity"))
data_tidy<-cast(data_tidy,subject+activity~variable,mean)
#load "data_tidy" into a .txt file 
file.create("tidy_data.txt")
write.table(data_tidy,file,row.names = F)
