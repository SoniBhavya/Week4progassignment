library(dplyr)# for bind_cols and bind_rows
install.packages("rlang")
library(rlang)

subject_test<-read.table("D:/getting and cleaning data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
x_test<-read.table("D:/getting and cleaning data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test<-read.table("D:/getting and cleaning data/UCI HAR Dataset/test/y_test.txt",header = FALSE)
subject_train<-read.table("D:/getting and cleaning data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)
x_train<-read.table("D:/getting and cleaning data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train<-read.table("D:/getting and cleaning data/UCI HAR Dataset/train/y_train.txt",header = FALSE)
features<-read.table("D:/getting and cleaning data/UCI HAR Dataset/features.txt",header = FALSE)

#______STEP1_______
test<-bind_cols(subject_test,y_test,x_test)
train<-bind_cols(subject_train,y_train,x_train)
finaldf<-bind_rows(test,train)

#__________STEP3________
cnames<-c("Subject","Activity Label")
featuresvector<-as.vector(features$V2)
columnnames<-c(cnames,featuresvector)#binding the vectors cnames and featuresvector
correctconames<-make.names(columnnames,unique = TRUE)
colnames(finaldf)<-correctconames

#__________STEP2_______
subfinaldf<-finaldf[grepl("mean()|std()",names(finaldf))]#extracting the measurements on mean and std

col1<-bind_rows(subject_test,subject_train)
col2<-bind_rows(y_test,y_train)
subfinaldf1<-bind_cols(col1,col2,subfinaldf)
colnames(subfinaldf1)[1]<-"Subject"
colnames(subfinaldf1)[2]<-"Activity.Label"

#________STEP4
activity_label<-c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
subfinaldf1$`Activity.Label`<- activity_label[subfinaldf1$`Activity.Label`]
#________STEP5
groupedfinaldf1<-group_by(subfinaldf1,`Subject`,`Activity.Label`)
dfmean1<-summarise_all(groupedfinaldf1,funs(mean))

write.table(dfmean1,"D:/getting and cleaning data/week4/prog assignment/tidydata.txt",sep="\t",row.names = FALSE)




