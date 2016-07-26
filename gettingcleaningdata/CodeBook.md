# Variables
Here there is a description about all the variables used in the code, though
I find the names to be very descriptive.

- `args` <- Variables that come from the command line
- `inputpath/outputpaht` <- where the data is/will be written out.
- `folder`<- structure of the Data
- `featuresFilename` <- filepath where the description of the feature is
- `featuresNames` <- data frame with the features information
- `activitiessFilename` <- filepath where the description of the activities is
- `activities` <- data frame with the features information
- `mode` <- different data types, either if they belong to the training dataset or to the test dataset.
- `testFiles` <- files that belong to the test dataset
- `trainFiles` <- files that belong to the train dataset
- `wholeTrain` <- merged dataset for train data
- `wholeTest`<- merged dataset for test data
- `whole` <- merged data set  (both test and training)
- `mean/stdIndexes` <- position where column names of the `whole` variable were related to mean or standard deviation.
- `splitData` <- dataset is split by `subjectid`
- `splitd` <- dataset is split by `activity`
- `summData` <- where the mean information per subject per activity is stored

# Transformations

- Column transformation to ensure that data was numeric, specifically, double:

```
whole[,4:ncol(whole)]<-apply(whole[,4:ncol(whole)],2,as.double)
```

- Column transformation from numbers to their specific factor name

```
whole$activity<-factor(whole$activity,levels = activities$activityid,labels = activities$activityname)
```
