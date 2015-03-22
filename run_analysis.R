# Set the working directory to the folder where unzipped archive resides
setwd("~/DataScience/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

# Read all components of the test set into R
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subj_test <- read.table("./test/subject_test.txt")

# Read all components of the training set into R
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subj_train <- read.table("./train/subject_train.txt")

# Read activity labels and features
act_labels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")

# Combine the 3 components of the test set into a single data frame
testset <- cbind(X_test, subj_test, y_test)

# Combine the 3 components of the training set into a single data frame
trainset <- cbind(X_train, subj_train, y_train)

# Combine the test set and training set dataframes into a big data frame
bigset <- rbind(trainset, testset)

# Build a vector of properly ordered descriptive variable names from
# the features data frame
allfeaturenames <- c(as.vector(features$V2), "Subject", "y")

# Rename the columns of the big data frame
names(bigset) <- allfeaturenames

# Identify the features that should be kept (measurements of the mean &
# standard deviation)
keep <- grepl("mean()", features$V2, fixed=TRUE) |
        grepl("std()", features$V2, fixed=TRUE)

# Build a vector of only those features we are keeping
keepfeat <- features[keep,]
featurestokeep <- c(as.vector(keepfeat$V2), "Subject", "y")

# Create a "shrunken" version of the big data frame, retaining only the features
# we are interested in 
shrunkset <- bigset[,featurestokeep]

# Use merge() function to add a column with descriptive activity names
names(act_labels) <- c("y", "DescriptiveActivityName")
mergedset <- merge(shrunkset, act_labels, by="y")

# Use melt() & dcast() functions to create a tidy data set with
# each line containing the average of each variable for a combination of
# activity and subject 
library(reshape2)
mergedMelt <- melt(mergedset, id=c("y", "DescriptiveActivityName", "Subject"),
                     measure.vars=as.vector(keepfeat$V2))
summary <- dcast(mergedMelt, DescriptiveActivityName + Subject ~ variable, mean)
write.table(summary, file="summary.txt", row.names=FALSE)
