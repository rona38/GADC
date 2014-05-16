# Helper function
# From  http://susanejohnston.wordpress.com/2012/10/01/find-and-replace-in-r-part-2-how-to-recode-many-values-simultaneously
#
recoderFunc <- function(data, oldvalue, newvalue) {

    # convert any factors to characters

    if (is.factor(data))     data     <- as.character(data)
    if (is.factor(oldvalue)) oldvalue <- as.character(oldvalue)
    if (is.factor(newvalue)) newvalue <- as.character(newvalue)

    # create the return vector

    newvec <- data

    # put recoded values into the correct position in the return vector

    for (i in unique(oldvalue)) newvec[data == i] <- newvalue[oldvalue == i]

    newvec

}

#
# set working directory
#
mywd<-"D:\\coursera\\GADC\\UCI HAR Dataset"
setwd(mywd)

# read the features of the UCI HAR Dataset, there are 561 rows, First column is the id and the second is the feature name.
features=read.table("features.txt")
# define the the column names
colnames(features)<-c("f_id", "featurename")

# read the activity description, there are 6 rows. First column is the id and the second is the activity description
activity_labels=read.table("activity_labels.txt")
colnames(activity_labels)<-c("act_id", "activitydescription")

# read the train measurement set
X_train=read.table(".\\train\\X_train.txt")
# read the train activities
y_train=read.table(".\\train\\y_train.txt")
# read the train subjectid
subject_train=read.table(".\\train\\subject_train.txt")

# read the test measurement set
X_test=read.table(".\\test\\X_test.txt")
# read the test activities
y_test=read.table(".\\test\\y_test.txt")
# read the test subjectid
subject_test=read.table(".\\test\\subject_test.txt")

# merge the train set with test set
X_set <- rbind(X_train, X_test)
y_set <- rbind(y_train, y_test)
subject_set <- rbind(subject_train, subject_test)

# set column names
colnames(X_set) <- features$featurename
colnames(y_set) <- c("activity")
colnames(subject_set) <- c("subjectID")

# find the columns with mean() and std()
cols=grep("mean()|std()",colnames(X_set))
# create the dataset
s1 <-cbind(subject_set,y_set,X_set[cols])
s1$activity<-recoderFunc(s1$activity, activity_labels$act_id, activity_labels$activitydescription)
write.csv(s1,"data_avg_std.csv", row.names = FALSE)

# find the columns with mean() and std()
cols=grep("mean()",colnames(X_set))
# create the dataset
s2 <-cbind(subject_set,y_set,X_set[cols])
s2$activity<-recoderFunc(s2$activity, activity_labels$act_id, activity_labels$activitydescription)
write.csv(s2,"data_avg.csv", row.names = FALSE)
