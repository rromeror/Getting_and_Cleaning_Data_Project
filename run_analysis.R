run_analysis <- function(){
   #Download files from servers
   url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(url, destfile = "data.zip")
   #Unzip the file on the local machine
   unzip("data.zip")
   #"train" and "test" data frames are created, first the IDs of the subjects are written
   train <- read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
   test  <- read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
   #Second, the training and test labels for each data frame are added to the created data frames,
   y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
   y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt")
   y_train <- factor(y_train[,1])
   y_test  <- factor(y_test[,1])
   levels(y_train) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
   levels(y_test)  <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
   train <- cbind(train,as.character(y_train))
   test  <- cbind(test,as.character(y_test))
   names(train) <- c("Subjects","Activity")
   names(test)  <- c("Subjects","Activity")
   #third, the training and test data sets are read in
   buffer_train <- read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors = FALSE)
   buffer_test  <- read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors = FALSE)
   names  <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
   names(buffer_train) <- names[,2]
   names(buffer_test)  <- names[,2]
   #Fourth, mean and std estimates are written in "train" and "test" data frames
   estimates <- grep("mean|std",names[,2],ignore.case = TRUE,value=FALSE)
   train <- cbind(train,buffer_train[,estimates])
   test  <- cbind(test,buffer_test[,estimates])
   tidy_dataset_1 <- merge(train,test,all=TRUE)
   #Fifth, the second data set is created
   datamelt <- melt(tidy_dataset_1,id=c("Subjects","Activity"))
   tidy_dataset_2 <- dcast(datamelt, Subjects + Activity~variable,mean)
   #Sixth, two files are created on the local storage device
   write.table(tidy_dataset_1,"tidy_dataset_1.txt")
   write.table(tidy_dataset_2,"tidy_dataset_2.txt")
}

