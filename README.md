# Getting-and-Cleaning-Data-Project

The purpose of this file is to explain how run_analysis.R works and how it should be used.

 * Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip onto your local drive 
 * Download run_analysis.R into the folder containing the unzipped data and set this folder as your working directory
 * Use source('run_analysis.R') to run the script
 * The script will create an output file summary.txt (68 columns, 180 rows) in the same directory
 * Read it into R using   data <- read.table("summary.txt", header=TRUE)
 * Each of the 180 rows of the resulting dataframe will correspond to a combination of one of 6 activities and one of 30 subjects
 * Columns from 3 thru 68 will contain mean values of 66 variables of interest to us 

