# this is the initial version of the getting and cleaning data project

#0.  Load data files from the zip file provided online
#0.1 Load Feature Labels for training data and test data
feature_names <- read.csv("UCI_HAR_Dataset/features.txt",
                        header=FALSE, sep="")
act_labels <- read.csv("UCI_HAR_Dataset/activity_labels.txt",
                         header=FALSE, sep="")
# load activirt labelsfor training examples

#0.2 Load test and training data
# read.fwf has memory problems trying another read method
test_data <- read.csv("UCI_HAR_Dataset/test/X_test.txt", header=FALSE, sep="")
train_data <- read.csv("UCI_HAR_Dataset/train/X_train.txt", header=FALSE, sep="")

#apply appropriate column labels
names(test_data) <- feature_names[,2]
names(train_data) <- feature_names[,2]

#set size of training sets
train_size <- 2497
test_size <- 7352

# load lables for training and test data sets
test_labels <- read.csv("UCI_HAR_Dataset/test/y_test.txt", header=FALSE, sep="")
train_labels<- read.csv("UCI_HAR_Dataset/train/y_train.txt", header=FALSE, sep="")

# make new column in test and training sets for labels
test_data$activity <- test_labels[,1]
train_data$activity <- train_labels[,1]

#load subject labels for the test and training data
sub_test_labels <- read.csv("UCI_HAR_Dataset/test/subject_test.txt", header=FALSE, sep="")
sub_train_labels<- read.csv("UCI_HAR_Dataset/train/subject_train.txt", header=FALSE, sep="")

# add a column to data with the subject information
test_data$subject <- sub_test_labels[,1]
train_data$subject <- sub_train_labels[,1]



#1.  Merges the training and the test sets to create one data set.
#trouble gettin this working going on
total <- rbind(test_data, train_data)

#2.  Extracts only the measurements on the mean and standard deviation for each measurement.
total_cut <-total[,grep("std|mean|activity|subject", names(test_data))]

#3.  Uses descriptive activity names to name the activities in the data set
total_cut$activity <- factor(total_cut$activity, act_labels[,1], act_labels[,2])

#4.  Appropriately labels the data set with descriptive variable names.
#should aready be labeled
#should I already change the names

#5.  Create a second, independent tidy data set with the average of each variable for each activity and each subject.
final_table_prep <- melt(total_cut, id.vars = c("subject", "activity"))
final_table <- dcast(final_table_prep, subject + activity ~ variable, mean)
write.table(final_table, file = "getting_cleaning_project.txt", row.name=FALSE)

