Two tidy data sets are created by an R script called "run_analysis.R". This script defines a function called "run_analysis()" which performs the following 
steps,

1. Downloads the raw data from the web.
2. Merges the training and the test sets to create one data set called "tidy_data_set_1.txt".
3. The file "tidy_data_set_1.txt"contains the measurements on the mean and standard deviation for each measurement (86 observations are included).
4. The script uses descriptive activity names to name the activities in "tidy_data_set_1.txt".
5. The script appropriately labels the data set with descriptive variable names. 
6. It creates a second data set called "tidy_data_set_2.txt", it contains independent tidy data set with the average of each variable for each activity
   and each subject. 

The repository contains the following files,

a. README.md.
b. CodeBook.md -> Decribes the process implemented to get tidy data sets from the raw data. The variables and observations contained in the tidy data are 
   described, as well as the their units.
b. run_analysis.R -> the script implemented to get and clean the raw data. The code has comments which explain step by step how it works; the tidy data
   files "tidy_data_set_1.txt" and "tidy_data_set_2.txt" are the output or tidy data and they are saved on the local working directory. Please, keep in mind
   that only the file "tidy_data_set_2.txt" was uploaded on the coursera´s submission platform.