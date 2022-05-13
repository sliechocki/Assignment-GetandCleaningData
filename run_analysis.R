### Getting and Cleaning Data 
### Assignment - week 4
#Step1 
library(tidyverse)


##Read all files## Step 2 and 3
features <- read_table("features.txt", col_names = c("count","features"))
head(features)
activity<-read_table("activity_labels.txt", col_names = c("label","type"))
head(activity)
y_train <- read_table("train/y_train.txt",col_names = c("label"))
head(y_train)
x_train <- read_table("train/x_train.txt",col_names = features$features)
head(x_train)
subject_train <- read_table("train/subject_train.txt", col_names = "id")
head(subject_train)
y_test <- read_table("test/y_test.txt",col_names = c("label"))
head(y_test)
x_test <- read_table("test/x_test.txt",col_names = features$features)
head(x_test)
subject_test <- read_table("test/subject_test.txt", col_names = "id")
head(subject_test)

##Bind train and test data## Step 4 -7
exercisetype<-rbind(y_train,y_test)
measurements<-rbind(x_train,x_test)
subject<-rbind(subject_train,subject_test)

compdata<-cbind(subject,exercisetype,measurements)
str(compdata) ##check complete data

### Extract needed features## Step 8

compdata<-compdata%>%
  select(id, label,contains(c("mean","std")))

#Collect names## Step 9 and 10
name<-colnames(compdata)

name<- lapply(name, gsub, pattern = 'Acc', replacement = 'Accelerometer')
name<- lapply(name, gsub, pattern = 'Gyro', replacement = 'Gyroscope')
name<- lapply(name, gsub, pattern = 'BodyBody', replacement = 'Body')
name<- lapply(name, gsub, pattern = '^t', replacement = 'Time-')
name<- lapply(name, gsub, pattern = '^f', replacement = 'Frequency-')
name<- lapply(name, gsub, pattern = 'Mag', replacement = 'Magnitude')
colnames(compdata)<-name ## assign new names

compdata<-compdata%>%
  mutate(label=as.character(label))%>%
  mutate(label = case_when(
      endsWith(label, "1") ~ "walking",
    endsWith(label, "2") ~ "walking_upstairs",
    endsWith(label, "3") ~ "walkingdownstairs",
    endsWith(label, "4") ~ "sitting",
    endsWith(label, "5") ~ "standing",
    endsWith(label, "6") ~ "laying"))

##Getting tidy data## Step 11
tidydata<-compdata%>%
  group_by(id,label)%>%
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))

#Step 12
head(tidydata)
write_csv(tidydata,"path", col_names = TRUE)
  
