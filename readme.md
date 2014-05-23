# Assigment getting and cleaning data

## Introduction

This is a project assigment of coursera course "Getting and cleaning data". The purpose of this assigment is to learn students how to get and clean up dataset.

## Data


The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Script

* First You have to download the Run_analysis.R from the repository. 
* Start R or R Studio
* Source the Run_analysis.R
* Call the function Run_analysis, the argument is the location of the data.
  For Example: Run_analysis("D:\\coursera\\GADC\\UCI HAR Dataset")
* When the script is execute succesfully. In the data directory You will find the two required dataset.
  First data_avg_std.csv is the file containig mean/avg and std of the measurements
  The second file is data_avg.csv is the file containg the mean of the measurements.