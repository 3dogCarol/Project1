#Read the data

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
#download.file(url, dest = "accelerometers.zip" ,method = "curl")
#unzip("accelerometers.zip", exdir="./data")


#The first step in the analysis was to combine the files subject_test.txt, y_test.txt, and X_test.txt to create one file such that each row is identified by the subject and activity and contains all the variables for that case. The second step is to combine the files subject_train.txt, y_train.txt, and X_train.txt to generate the same kind of file for the subjects in the training group.


#Read the test data and the training data as well as the subject and activities files

testdata <- read.table("./UCIHARdataset/test/X_test.txt")
subjectsTest <- read.table("./UCIHARdataset/test/subject_test.txt")
activitiesTest <- read.table("./UCIHARdataset/test/y_test.txt")

traindata <- read.table("./UCIHARdataset/train/X_train.txt")
subjectsTrain <- read.table("./UCIHARdataset/train/subject_train.txt")
activitiesTrain <- read.table("./UCIHARdataset/train/y_train.txt")

#Using the features.txt file, find the headers and the pull out the ones containing means or std. 

headers <- read.table("./UCIHARdataset/features.txt")
meanAndstd <- grep(".*mean\\(.*|.*std\\(.*|*Mean|*meanFreq\\(.", headers$V2)
meanAndstd

#The vector meanAndstd contains the numbers of the columns that we want to keep. Now we pull those columns from the test data and the training data.

test1 <- testdata[,meanAndstd]
train1 <- traindata[,meanAndstd]

#Now bind the data sets together with the test data in the first rows and training data following

subjects <- rbind(subjectsTest,subjectsTrain)
activities <- rbind(activitiesTest,activitiesTrain)
data <- rbind(test1,train1)

#Next we want to rename the columns of the data by removing the ()

newnames <-headers$V2
n <- newnames[meanAndstd]
n <- sub("mean\\(\\)","mean",n)
n <- sub("std\\(\\)","std",n)
n <- sub("Freq\\(\\)","Freq",n)
n <- sub("\\(","",n)
n <- sub("\\)","",n)
numCols <- length(meanAndstd)
ar <- replace(names(data),c(1:numCols),n)
colnames(data) <- ar
#head(alldata)

#Give column names to subjects data and activities and then column bind the activities, subjects, and data.

colnames(subjects) <- c("subjects")
colnames(activities) <- c("activities")
totdata <- cbind(subjects,activities,data)

#The last step is to sort the data by subject and activity.

library(dplyr)
totdata <- arrange(totdata,subjects,activities)  #sorts data by subjects and then activities columns.
ncol(totdata)
nrow(totdata)

#The result "totdata" is our tidy data set.

file = "./meansAndStd.csv"
write.table(totdata,file,sep=",")

#Now compute the mean for each of the measures in the data set "meansAndStd.csv" by subject and activity.


file = "./meansAndStd.csv"
totdata = read.csv(file)



#The following code generates a data frame containing the means of the columns in totdata for each subject and activity in the study.
z <- data_frame()
for(i in 1:30){
  for(j in 1:5){
    x <- filter(totdata,subjects == i, activities == j)
    y <- colMeans(x[,c(3:88)])
    w <- c(i,j,y)
    z = rbind(z,w)
  }
}
names(z) <-names(totdata)
file = "./meansOfmeansAndstds.txt"
write.table(z,file,sep=" ",row.name = FALSE)

