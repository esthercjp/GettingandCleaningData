#Read data
trainsetdat <- read.table("X_train.txt", header=FALSE)
testsetdat <- read.table("X_test.txt", header=FALSE)
trainlabdat <- read.table("y_train.txt", header=FALSE)
testlabdat <- read.table("y_test.txt", header=FALSE)
testsubject <- read.table("subject_test.txt", header=FALSE)
trainsubject <- read.table("subject_train.txt", header=FALSE)
features <- read.table("features.txt", colClasses=c("character"))
activity_labels <- read.table("activity_labels.txt", col.names= c("ActivityId", "Activity"))

#Overview of datasets
dim(trainsetdat)#7351 rows, 561 cols
dim(trainlabdat)#7351 rows, 1 col
dim(testsetdat)#2946 rows, 561 cols
dim(testlabdat)#2946 rows, 1 col
dim(testsubject)#2946 rows, 1 col
dim(trainsubject)#7351 rows, 1 col


#Merges the training and the test sets to create one data set.
training <- cbind(cbind(trainsetdat, trainsubject), trainlabdat)
sensor <- cbind(cbind(testsetdat, testsubject), testlabdat)
fulldata <- rbind(training, sensor)

#Tidy up table, remove columns "()"
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Extract mean and standard deviation
meanstd <- grep(".*Mean.*|.*Std.*", features[,2])

# Filter out unwanted rows from table
features <- features[meanstd,]

# Add last two columns (subject and activity)
meanstd <- c(meanstd, 562, 563)

# Subset data to only keep variables we want
fulldata <- fulldata[,meanstd]

# Add column (features) to fulldata
colnames(fulldata) <- c(features$V2, "Activity", "Subject")
colnames(fulldata) <- tolower(colnames(fulldata))
currentActivity = 1
for (currentActivityLabel in activity_labels$V2) {
  fulldata$activity <- gsub(currentActivity, currentActivityLabel, fulldata$activity)
  currentActivity <- currentActivity + 1
}
fulldata$activity <- as.factor(fulldata$activity)
fulldata$subject <- as.factor(fulldata$subject)
tidy = aggregate(fulldata, by=list(activity = fulldata$activity, subject=fulldata$subject), mean)
# Remove subject and activity columns
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")











