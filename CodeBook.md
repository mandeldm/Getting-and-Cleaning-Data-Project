This code book describes the variables, the data, and the work performed to clean up the data.
 
* The data for the project is available here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 Within this archive the variables are described in features_info.txt file and the data is described in README.txt. 
 
 A full description is available at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
* To process the data I use a single script run_analysis.R, which takes the following steps:
 - Sets the working directory to the folder where unzipped archive resides
 - Reads all components of the test set into R
 - Reads all components of the training set into R
 - Reads activity labels and features
 - Combines the 3 components of the test set into a single data frame
 - Combines the 3 components of the training set into a single data frame
 - Further combines the resulting test set and training set dataframes into a 'big' data frame
 - Builds a vector of properly ordered descriptive variable names from the features data frame
 - Renames the columns of the 'big' data frame using this vector
 - Identifies the features that should be kept (measurements of the mean & standard deviation)
 - Builds a vector of only those features we are keeping
 - Creates a "shrunken" version of the 'big' data frame, retaining only the features we are interested in 
 - Uses merge() function to add a column with descriptive activity names
 - Uses melt() & dcast() functions to create a tidy data set with each line containing the average of each variable for a combination of DescriptiveActivityName and Subject 
 - Saves the result in a text file
