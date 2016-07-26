title: 'Coursera: Getting and cleaning data course project'
author: "Merly Escalona <merlyescalona@uvigo.es>"

# Introduction 

The purpose of this project repository is to demonstrate my ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be used
for later analysis. 

In order to do this I have used the following dataset:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Which is data collected from the accelerometers from the Samsung  Galaxy S smartphone from an experiment
related to the analysis of wearables data. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data organization

Once the dataset is dowloaded and extracted, the data should look like this:

```
UCI HAR Dataset/
    activity_labels.txt
    features.txt
    features_info.txt
    README.txt
    test/
        y_test.txt
        X_test.txt
        subject_test.txt
        Intertial Signals/
            body_acc_x_test.txt 
            body_gyro_x_test.txt 
            total_acc_x_test.txt
            body_acc_y_test.txt 
            body_gyro_y_test.txt
            total_acc_y_test.txt 
            body_acc_z_test.txt 
            body_gyro_z_test.txt 
            total_acc_z_test.txt
    train/
        y_train.txt
        X_train.txt
        subject_train.txt
        Intertial Signals/
            body_acc_x_train.txt 
            body_gyro_x_train.txt 
            total_acc_x_train.txt
            body_acc_y_train.txt 
            body_gyro_y_train.txt
            total_acc_y_train.txt 
            body_acc_z_train.txt 
            body_gyro_z_train.txt 
            total_acc_z_train.txt
```

# Scripts

I have created an R script called `run_analysis.R` that does the following.

1. Merges the training and the test sets to create one data set.
    + Merging includes files "y_*", "X_*", "subject_*" files, for both training and test datasets.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names activity and each subject.

## Running the script

In order to be able to run the script you should:

```
Rscript --vanilla <input_path> <output_path>
```

- `<input_data>` is the path to where the "UCI HAR Dataset" folder is.
- `<output_data>` is the path to where to write down the output file.
