Getting and Cleaning data
======================
# Installation and execution
Here are some instructions on how to use my script `run_analysis` which merges and cleanups properly some raw data provided in the course `Getting and Cleaning Data` on Coursera.

This script has been tested using `RStudio`, please try with it.

* Download the raw data archive  [from the link provided](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* Open the downloaded zip file and place the directory `UCI HAR Dataset` where you want.

* When you are in RStudio, please remember to get into the directory you have unzipped the file so that my script is read properly, give a `setwd(YOUR_DIRECTORY)` in that case. The script assumes that you have put the `UCI HAR Dataset` directory in `~/Desktop`

* Download the script [`run_analysis.R`](https://github.com/keexa/getting_and_cleaning_data/blob/master/run_analysis.R) from this git repository

* Open RStudio and open the script `run_analysis.R`.

* Press the `Source` button. 

You now have a `global_data` data frame which contains all the big amount of data and a `final` data frame which contains all the averages of each variable for each activity and subject.

A file `final.txt` has also been saved in your current directory


#Codebook
You can find the Codebook for this project here [`codebook.R`](https://github.com/keexa/getting_and_cleaning_data/blob/master/codebook.md)
