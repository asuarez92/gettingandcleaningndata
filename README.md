# Getting and Cleaning Data Project
## Coursera by Johns Hopkins University 
#### by A Suarez-Pierre

The script `run_analysis.R` is designed to fullfil the following objectives:
  1. Merges the training and the test sets to create one data set. 
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set 
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The end result is written in a `.txt` file named: "tidy" which is included in this repo
***
### Comments
If trying to run this script in your own computer, make sure to adjust the working directory to the space in your computer where you wish to have all this done.

The script file `run_analysis.R` does most of the work for you  
* downloads the data from the web
* reads, cleans, merges, and melts
* generates `tidy.txt` which will be stored in you workin directory
