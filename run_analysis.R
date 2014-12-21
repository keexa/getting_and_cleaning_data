setwd("~/Desktop")

library("reshape2")
features <- read.table("UCI HAR Dataset/features.txt", sep="",colClasses = c("character"))

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep="")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep="")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", sep="")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep="")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep="")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep="")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep="")

# Merge the rows of the test and train data sets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Change the names of the columns
colnames(X) <- features[,2]
colnames(y) <-c("label_id")
colnames(subject) <- c("subject_id")
colnames(activity_labels) <- c("id", "activity")

# Retrieve only the columns which contains the word mean( and std(
cols_with_mean <- grep("-mean\\(\\)", features[,2], value=TRUE)
cols_with_std <- grep("-std\\(\\)", features[,2], value=TRUE)

X_filtered <- X[,c(cols_with_mean, cols_with_std)]
# Product a data frame of y with the descriptive labels of the activities
merged_activity_labels <- merge(y, activity_labels, by.x="label_id", by.y="id")[,2]

# Create a global data set from the other data sets

global_data <- cbind(subject, X_filtered, merged_activity_labels)
colnames(global_data)[colnames(global_data)=="merged_activity_labels"] <-"activity"

melted <- melt(global_data, id = c("subject_id", "activity"))
final <- dcast(melted, subject_id + activity  ~ variable, mean)

#final2 = aggregate(global_data, by=list(activity = global_data$activity, subject=global_data$subject_id), mean)

write.table(final, file = "./final.txt", row.name=FALSE)
#write.table(final2, file = "./final2.txt", row.name=FALSE)