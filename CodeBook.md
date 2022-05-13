---
title: "Assignment W4- Getting and Cleaning Data"
author: "SL"
date: "5/13/2022"
output:
  pdf_document: default
  html_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Information about "Human Activity Recognition Using Smartphones Dataset" preprocessing

The scrip "run_analysis.R" will perform a series of steps to get a collection of tables and put all the needed information in a tidy data that can be easily used in further analysis. 

This codeBook refers to numbered steps of the "run_analysis.R" script

## Obtaining the dataset

The dataset is avalaible at "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".

Download the data by using "download.files" function or using the link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" offered at Coursera Webpage and save it on your computer. 

## Working on data

1. Load the package needed for processing the data: Tidyverse 
2. Load all files and assigned them to a variable: read_table(). Note: Column names must be assigned.
3. Check if the files where loaded properly: head()
  
features <- features.txt : 561 rows, 2 variables
List of all features used in the database. Raw signals from Triaxial acceleration (accelerometer) and Triaxial Angular velocity(gyroscope). 

activities <- activity_labels.txt : 6 rows, 2 variables 
List of activities performed: label and descriptive name.

subject_train <- test/subject_train.txt : 7352 rows, 1 variable 
Contains the "id" of the 21 volunteers (70% of total subjects) observed during the training.

x_train <- test/X_train.txt : 7352 rows, 561 variables 
Contains the features measurements of the subject_train

y_train <- test/y_train.txt : 7352 rows, 1 variables 
Contains the activity label from x_train

subject_test <- test/subject_test.txt : 2947 rows, 1 variable
Contains the "id" of the 9 volunteers (30% of total subjects) observed during the test.

x_test <- test/X_test.txt : 2947 rows, 561 variables 
Contains the features measurements of the subject_test

y_test <- test/y_test.txt : 2947 rows, 1 variables 
Contains the activity label from x_test

4. Join the activities from test and train (y_train, y_test) and assign to a variable: rbind()
5. Join the measurements from test and train (x_train, x_test) and assign to a variable: rbind()
6. Join the subjects id from test and train (subject_train, subject_test) and assign to a variable: rbind()
7. Join all three variables in one single table and assign to a variable: cbind(). Use str() to check the complete data

8. Extract the only the mean and standard deviation values of the feature measurements: select()
9. Extract column names and replace it with more descriptive names: gsub() + colnames()
10. Replace activity labels with the descriptive names

11.Summarize all the measurements across the table and assign the tidy data to a new variable: summarize()
12. Check the final table and save it in a ".csv" file











