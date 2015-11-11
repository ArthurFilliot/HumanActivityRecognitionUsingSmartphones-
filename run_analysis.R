library(data.table)

getMergedData <- function(trainfile, testfile) {
    ml = lapply(list(trainfile,testfile),fread,sep=" ")
    rbindlist(l = ml)
}

subject     <- getMergedData("./Dataset/train/subject_train.txt","./Dataset/test/subject_test.txt")
X           <- getMergedData("./Dataset/train/X_train.txt","./Dataset/test/X_test.txt")
y           <- getMergedData("./Dataset/train/y_train.txt","./Dataset/test/y_test.txt")
#body_acc_x  <- getMergedData("./Dataset/train/Inertial Signals/body_acc_x_train.txt",
#                                "./Dataset/test/Inertial Signals/body_acc_x_test.txt")
#body_acc_y  <- getMergedData("./Dataset/train/Inertial Signals/body_acc_y_train.txt",
#                             "./Dataset/test/Inertial Signals/body_acc_y_test.txt")
#body_acc_z  <- getMergedData("./Dataset/train/Inertial Signals/body_acc_z_train.txt",
#                             "./Dataset/test/Inertial Signals/body_acc_z_test.txt")
#body_gyro_x  <- getMergedData("./Dataset/train/Inertial Signals/body_gyro_x_train.txt",
                              #                             "./Dataset/test/Inertial Signals/body_gyro_x_test.txt")
#body_gyro_y  <- getMergedData("./Dataset/train/Inertial Signals/body_gyro_y_train.txt",
                              #                              "./Dataset/test/Inertial Signals/body_gyro_y_test.txt")
#body_gyro_z  <- getMergedData("./Dataset/train/Inertial Signals/body_gyro_z_train.txt",
                              #                              "./Dataset/test/Inertial Signals/body_gyro_z_test.txt")
#total_acc_x  <- getMergedData("./Dataset/train/Inertial Signals/total_acc_x_train.txt",
                              #                              "./Dataset/test/Inertial Signals/total_acc_x_test.txt")
#total_acc_y  <- getMergedData("./Dataset/train/Inertial Signals/total_acc_y_train.txt",
#                              "./Dataset/test/Inertial Signals/total_acc_y_test.txt")
#total_acc_z  <- getMergedData("./Dataset/train/Inertial Signals/total_acc_z_train.txt",
#                              "./Dataset/test/Inertial Signals/total_acc_z_test.txt")
#measurements <- list(subject, x,y,body_acc_x,body_acc_y,body_acc_z,body_gyro_x,body_gyro_y,
#                     body_gyro_z,total_acc_x, total_acc_y, total_acc_z)

features <- fread("./Dataset/features.txt",sep=" ")
ourfeaturesindex <- grep(".*mean\\(\\)|std\\(\\).*",features[[2]])
ourdatas <- X[,ourfeaturesindex,with=FALSE]
