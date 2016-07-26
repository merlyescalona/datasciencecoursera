# Information about the data
- Data set used for the processing was extracted from the UCI HAR Dataset (further description [here], http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

- Output file  has the following columns:
`subjectid`
`activity`
`featuretimebodyaccmeanx`
`featuretimebodyaccmeany`
`featuretimebodyaccmeanz`
`featuretimebodyaccstdx`
`featuretimebodyaccstdy`
`featuretimebodyaccstdz`
`featuretimegravityaccmeanx`
`featuretimegravityaccmeany`
`featuretimegravityaccmeanz`
`featuretimegravityaccstdx`
`featuretimegravityaccstdy`
`featuretimegravityaccstdz`
`featuretimebodyaccjerkmeanx`
`featuretimebodyaccjerkmeany`
`featuretimebodyaccjerkmeanz`
`featuretimebodyaccjerkstdx`
`featuretimebodyaccjerkstdy`
`featuretimebodyaccjerkstdz`
`featuretimebodygyromeanx`
`featuretimebodygyromeany`
`featuretimebodygyromeanz`
`featuretimebodygyrostdx`
`featuretimebodygyrostdy`
`featuretimebodygyrostdz`
`featuretimebodygyrojerkmeanx`
`featuretimebodygyrojerkmeany`
`featuretimebodygyrojerkmeanz`
`featuretimebodygyrojerkstdx`
`featuretimebodygyrojerkstdy`
`featuretimebodygyrojerkstdz`
`featuretimebodyaccmagmean`
`featurefrequencybodyaccjerkmeanfreqz`
`featuretimebodyaccmagstd`
`featuretimegravityaccmagmean`
`featuretimegravityaccmagstd`
`featuretimebodyaccjerkmagmean`
`featuretimebodyaccjerkmagstd`
`featuretimebodygyromagmean`
`featuretimebodygyromagstd`
`featuretimebodygyrojerkmagmean`
`featuretimebodygyrojerkmagstd`
`featurefrequencybodyaccmeanx`
`featurefrequencybodyaccmeany`
`featurefrequencybodyaccmeanz`
`featurefrequencybodyaccstdx`
`featurefrequencybodyaccstdy`
`featurefrequencybodyaccstdz`
`featurefrequencybodyaccmeanfreqx`
`featurefrequencybodyaccmeanfreqy`
`featurefrequencybodyaccmeanfreqz`
`featurefrequencybodyaccjerkmeanx`
`featurefrequencybodyaccjerkmeany`
`featurefrequencybodyaccjerkmeanz`
`featurefrequencybodyaccjerkstdx`
`featurefrequencybodyaccjerkstdy`
`featurefrequencybodyaccjerkstdz`
`featurefrequencybodyaccjerkmeanfreqx`
`featurefrequencybodyaccjerkmeanfreqy`
`featurefrequencybodygyromeanx`
`featurefrequencybodygyromeany`
`featurefrequencybodygyromeanz`
`featurefrequencybodygyrostdx`
`featurefrequencybodygyrostdy`
`featurefrequencybodygyrostdz`
`featurefrequencybodygyromeanfreqx`
`featurefrequencybodygyromeanfreqy`
`featurefrequencybodygyromeanfreqz`
`featurefrequencybodyaccmagmean`
`featurefrequencybodyaccmagstd`
`featurefrequencybodyaccmagmeanfreq`
`featurefrequencybodybodyaccjerkmagmean`
`featurefrequencybodybodyaccjerkmagstd`
`featurefrequencybodybodyaccjerkmagmeanfreq`
`featurefrequencybodybodygyromagmean`
`featurefrequencybodybodygyromagstd`
`featurefrequencybodybodygyromagmeanfreq`
`featurefrequencybodybodygyrojerkmagmean`
`featurefrequencybodybodygyrojerkmagstd`
`featurefrequencybodybodygyrojerkmagmeanfreq`

# Information about the script
## Variables
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

## Transformations

- Column transformation to ensure that data was numeric, specifically, double:

```
whole[,4:ncol(whole)]<-apply(whole[,4:ncol(whole)],2,as.double)
```

- Column transformation from numbers to their specific factor name

```
whole$activity<-factor(whole$activity,levels = activities$activityid,labels = activities$activityname)
```

# Refereces

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
