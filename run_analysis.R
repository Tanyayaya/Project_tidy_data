library(data.table)
train_set<-fread("UCI HAR Dataset/train/X_train.txt")
train_label<-fread("UCI HAR Dataset/train/y_train.txt",
                   col.names = "label")
train_subject<-fread("UCI HAR Dataset/train/subject_train.txt",
                     col.names = "subject")
train_data<-cbind(train_subject,train_label,train_set)
test_set<-fread("UCI HAR Dataset/test/X_test.txt")
test_label<-fread("UCI HAR Dataset/test/y_test.txt",
                  col.names = "label")
test_subject<-fread("UCI HAR Dataset/test/subject_test.txt",
                    col.names="subject")
test_data<-cbind(test_subject,test_label,test_set)
data<-rbind(test_data,train_data)
feature<-read.table("UCI HAR Dataset/features.txt")
feature<-apply(feature,1,"[",2)
library(stringr)
mean_std<-which(grepl("std()|mean()",feature))+2
data_good<-data[,c(1,2,as.numeric(mean_std)),with=F]
data_good$label<-as.character(data_good$label)%>%
  str_replace_all("1","walking")%>%
  str_replace_all("2","walking_upstairs")%>%
  str_replace_all("3","walking_downstairs")%>%
  str_replace_all("4","sitting")%>%
  str_replace_all("5","standing")%>%str_replace_all("6","laying")
colnames(data_good)<-c("subject","activity",feature[mean_std-2])
library(reshape)
data_tidy<-melt(data_good,id=c("subject","activity"))
data_tidy<-cast(data_tidy,subject+activity~variable,mean)
