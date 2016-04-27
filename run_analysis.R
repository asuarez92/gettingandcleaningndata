#*******************************************************************************
# GETTING AND CLEANING DATA COURSE PROJECT
# A Suarez-Pierre
#*******************************************************************************

library(reshape2)
setwd("C:/Users/asuarez8/Desktop")


# downloading the data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename = "humanactivity.zip"
download.file(url, filename)
unzip(filename)


setwd("C:/Users/asuarez8/Desktop/UCI HAR Dataset")


# activity labels
labels = read.table("activity_labels.txt")
features = read.table("features.txt")

      # converting to characters
      labels[,2] = as.character(labels[,2])
      features[,2] = as.character(features[,2])


# extract only mean and sd
extracts = grep(".*mean.*|.*std.*", features[,2])
            

# loading the datasets
trainMeasurements = read.table("train/X_train.txt")[extracts]
trainActivities = read.table("train/Y_train.txt")
trainSubjects = read.table("train/subject_train.txt")

testMeasurements = read.table("test/X_test.txt")[extracts]
testActivities = read.table("test/Y_test.txt")
testSubjects = read.table("test/subject_test.txt")


# merge datasets
train = cbind(trainSubjects, trainActivities, trainMeasurements)
test = cbind(testSubjects, testActivities, testMeasurements)

df = rbind(train, test)
colnames(df) = c("subject", "activity", features[extracts,2])


# delete useless tables
rm(train, trainMeasurements, trainActivities, trainSubjects)
rm(test, testMeasurements, testActivities, testSubjects)


# turn first two columns into factors
df$activity = factor(df$activity, levels=labels[,1], labels=labels[,2])
df$subject = as.factor(df$subject)


# melt and summarize data
df.melt = melt(df, id=c("subject", "activity"))
df.mean = dcast(df.melt, subject+activity~variable, mean)


# exporting dataset
write.table(df.mean, "tidy.txt", quote=FALSE, row.names=FALSE)    # MONEY $$$
