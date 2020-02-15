VARIABLES:

1.subject_test: To the store the Subject_test dataset.

2.x_test: To store the X_test dataset.

3.y_test: To store the y_test dataset.

4.subject_train: To store the Subject_train dataset.

5.x_train: To store the X_train dataset.

6.y_train: To store the y_train dataset.

7.features: To store the features dataset.

8.test: To store the dataset formed by combining the datasets from the test set. 
9.train: To store the dataset formed by combining the datsets from the train set.

10.finaldf:To store the dataset formed by combining the test and train datasets obtained previously. Its dimensions are 10299 563

11.In order to name the 563 columns I have used the features dataset to name the 561 columns and in order to name the remaining 2 columns I have created a vector "cnames" 

12.featuresvector: A vector to store the 561 features present in the features dataset.

13.columnnames: A vector of dimension 563 formed by combining the cnames and featuresvector.

14.correctconames: Vector formed by correcting the names in the columnnames vector.

15.subfinaldf: To store the data frame formed by subsetting the "finaldf" data frame based on mean and standard deviation in the column names.

16.subfinaldf1: Dataset formed by binding the Subject and Activity.Label columns to groupedfinaldf.Its dimensions are 10299 8

17.activity_label: A vector which stores the 6 activity labels. This vector is indexed to give descriptive activity names in the second column of the data frame.

18.groupedfinaldf: Dataset formed by grouping the "subfinaldf1" dataset based on Subject and Activity Label 10299 81

19dfmean1: The dataset formed by summarising the "groupedfinaldf" based on mean function.Its dimensions are 180 81


DATA AND TRANSFORMATIONS:

Files used--Subject_test,X_test,y_test,Subject_train,X_train,y_train,features

Transformations-- 
1.The col_bind() function has been used to bind the datasets in the test and train data seperately. The row_bind() function has been used to bind the 2 datasets formed with column binding
2.In order to extract only the measurements on mean and standard deviation for each measurement the grepl() function was used with "mean()|std()" as the pattern.
3.In order to name the columns the features data set was loaded and the 561 activity names were assigned to the columns
4.A vector containing the 6 activity lables(walking,walking_upstairs,walking_downstairs,sitting,standing,laying) was created and indexed to name the elements in the second column of the data frame.
5.The group_by() function was used to group the data based in Subh=ject and Activity Label. The summarize_all() function was used to get the mean of each activity of each subject.