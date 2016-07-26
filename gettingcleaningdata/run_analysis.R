# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names activity and each subject.

args <- commandArgs(TRUE)
if (length(args)<2) {
  stop("ERROR: Not enough parameters", call.=FALSE)
}
inputpath=args[1]
outputpath=args[2]
if(inputpath==""){inputpath="."}
if(outputpath==""){outputpath="."}

folder<-paste0(inputpath,"/UCI HAR Dataset/")
featuresFilename<-paste0(folder,"features.txt")
# Reading Features
featuresNames<-read.table(featuresFilename,sep=" ", col.names=c("featureid", "featurename"))
# Reading activity_labels
activitiesFilename<-paste0(folder,"activity_labels.txt")
activities<-read.table(activitiesFilename,sep=" ",col.names = c("activityid","activityname"))

mode<-c("test","train")
testFiles<-c(paste0(folder,mode[1],"/","subject_", mode[1], ".txt"),
             paste0(folder,mode[1],"/",c("X_","y_"), mode[1],".txt"),
             paste0(folder,mode[1],"/",
                    "Inertial Signals/",
                    paste0(
                      paste(rep(c("body_acc","body_gyro","total_acc")),
                            rep(c("x","y","z"),each=3),
                            mode[1],
                            sep="_"),
                      rep(".txt",9))
             )
)
trainFiles<-c(paste0(folder,mode[2],"/","subject_", mode[2], ".txt"),
              paste0(folder,mode[2],"/",c("X_","y_"),mode[2], ".txt"),
              paste0(folder,mode[2],"/",
                     "Inertial Signals/",
                     paste0(
                       paste(rep(c("body_acc","body_gyro","total_acc")),
                             rep(c("x","y","z"),each=3),
                             mode[2],
                             sep="_"), 
                       rep(".txt",9))
              )
)

wholeTrain<-data.frame(subjectid=read.table(trainFiles[1]),
                       activity=read.table(trainFiles[3]),
                       feature=read.table(trainFiles[2],col.names=featuresNames[,2])
                       )
wholeTrain$dataset<-rep(factor("TRAIN"), nrow(wholeTrain)); 
# Test Dataset
wholeTest<-data.frame(subjectid=read.table(testFiles[1]),
                      activity=read.table(testFiles[3]),
                      feature=read.table(testFiles[2],col.names=featuresNames[,2])
)
wholeTest$dataset<-rep(factor("TEST"), nrow(wholeTest)); 

whole<-rbind(wholeTrain,wholeTest)

# Keeping only those columns with mean or standard deviation calculations
meanIndexes<-grep("mean",as.character(colnames(whole)))
stdIndexes<-grep("std",as.character(colnames(whole)))
keep<-sort(c(meanIndexes,stdIndexes))
whole<-whole[,c(grep("dataset",colnames(whole)),1,2,keep)]

# Rearranging colnames
colnames(whole)[1:3]<-c("dataset","subjectid","activity")
colnames(whole)<-gsub("\\.t","Time",colnames(whole))
colnames(whole)<-gsub("\\.f","Frequency",colnames(whole))
colnames(whole)<-gsub("\\.","",colnames(whole))
colnames(whole)<-tolower(colnames(whole))


# Assuring variables are numbers
whole[,4:ncol(whole)]<-apply(whole[,4:ncol(whole)],2,as.double)

# Assigning lables to activities
whole$activity<-factor(whole$activity,levels = activities$activityid,labels = activities$activityname)
# Subsetting and getting information about mean per subjectid per activity
splitData<-split(whole,whole$subjectid)
summData<-c()
for (item in splitData){
  splitd<-split(item,item$activity)
  meand<-t(sapply(splitd,function(x){apply(x[4:ncol(whole)],2,mean)}))
  summData<-rbind(summData,cbind(rep(item$dataset,length(names(meand))),rep(item$subjectid,length(names(meand))), meand))
}

write.table(summData, paste0(outputpath,"output.txt"),row.name=FALSE) 
