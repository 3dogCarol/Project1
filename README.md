---
title: "README"
author: "Carol"
date: "July 28, 2015"
output: html_document
---

Wearable Computing Data:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For each record in the dataset the following is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Using the data as described above, this project used the mean and standard deviation values obtained from the measurements and for each subject in the study and each activity measured the mean of the means and the mean of the standard deviations were computed. The new data was created by a program called run_analysis.R. This program along with a careful description of the steps and the code are given in a Codebook.md included.

The data has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  to the file accelerometers.zip. When this file is unzipped we have a directory called UCI HAR Dataset which was renamed to  UCIHARdataset. This directory contains a file README.txt which explains the experiments from which the data was derived as well as a description of the other files in the directory.

There is a file called activity_labels.txt with the names of the activities.
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

There is a file called features.txt which contains a list of names for the different measures taken for each of the 30 subjects and contained in the data, in the order that they occur in the data. Along with this file there is a file called features_info.txt describing each of the names in features.txt and methods and sources of the data. The 30 subjects were divided into two groups, one called test and the other called training. 70% of the subjects were in the training group and 30% in the test group.

There are two subdirectories, test and train. Each contains a directory called Inertial Signals containing raw measurements, a file called X_train.txt and X_test.txt respectively. These files contain the values for their respective groups by subject, activity and measurement as named in the features.txt file. There are a files subject_text.txt and subject_train.txt containing the number of the subject that corresponds to the values in the X_train.txt and X_test.txt files. There are files y_test.txt and y_train.txt containing the corresponding activity of the values in the X_train.txt and X_test.txt files.

In the data set we want to compile, we are only interested in the columns of data in the X_train.txt and X_test.txt that are either the mean or standard deviation of the collected data. We can determine these columns by choosing the variables in the features.txt file that are means or standard deviations.








