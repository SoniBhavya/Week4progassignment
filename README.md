# Week4progassignment
Getting and Cleaning Data-week4-Programming Assignment
1)library(dplyr)
  The dplyr package was loaded to use the row_bind() and col_bind() functions


2)subject_test<-read.table("D:/getting and cleaning data/UCI HARDataset/test/subject_test.txt",header = FALSE)
  The reqired files were loaded using the read.table() function
  
3)
#______STEP1: Bindind the test and train datasets to get a single dataset
test<-bind_cols(subject_test,y_test,x_test)
train<-bind_cols(subject_train,y_train,x_train)
finaldf<-bind_rows(test,train)

#__________STEP3:The column names were given using the features dataset containing the 156 features description
cnames<-c("Subject","Activity Label")
featuresvector<-as.vector(features$V2)
columnnames<-c(cnames,featuresvector)#binding the vectors cnames and featuresvector
correctconames<-make.names(columnnames,unique = TRUE)
colnames(finaldf)<-correctconames

#__________STEP2:The mergred dataset was subsetted to extract measurements on mean and standard deviation.The first two columns were added using bind_cols and bind_rows and renamed as Subject and Activity.Label
subfinaldf<-finaldf[grepl("mean()|std()",names(finaldf))]#extracting the measurements on mean and sd
col1<-bind_rows(subject_test,subject_train)
col2<-bind_rows(y_test,y_train)
subfinaldf1<-bind_cols(col1,col2,subfinaldf)
colnames(subfinaldf1)[1]<-"Subject"
colnames(subfinaldf1)[2]<-"Activity.Label"


#__________STEP4: The activity labels were given in the second column through indexing the activity_label vector made from the activity labels file
activity_label<-c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
subfinaldf1$`Activity.Label`<- activity_label[subfinaldf1$`Activity.Label`]

#_________STEP5:The dataframe was grouped first by Subject then by Activity.Label and the mean was calculated using the summarise_all function from the dplyr package
groupedfinaldf1<-group_by(subfinaldf1,`Subject`,`Activity.Label`)
dfmean1<-summarise_all(groupedfinaldf1,funs(mean))

