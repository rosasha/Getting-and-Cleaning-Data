#package dplyr for select & group data
install.packages("dplyr")
library(dplyr)
#create working directory
setwd("C:/Users/Александр/datasciencecoursera")
#download required files
X_test <- read.table("./Datasetuci/test/X_test.txt")
X_train <- read.table("./Datasetuci/train/X_train.txt")
features <- read.table("./Datasetuci/features.txt")
Y_test <- read.table("./Datasetuci/test/Y_test.txt")
Y_train <- read.table("./Datasetuci/train/Y_train.txt")
subj_test <- read.table("./Datasetuci/test/subject_test.txt")
subj_train <- read.table("./Datasetuci/train/subject_train.txt")
labels<-read.table("./Datasetuci/activity_labels.txt")
#merge & combine required data
Xcomp<-rbind(X_test,X_train)
Ycomp<-rbind(Y_test,Y_train)
SUBJcomp<-rbind(subj_test,subj_train)
SYcomp<-cbind(Ycomp,SUBJcomp)
#set names for column
colnames(SYcomp)<-c("id","Subject")
colnames(labels)<-c("id","Activity")
#merge with dplyr
all<-inner_join(SYcomp,labels,by = "id")
all<-select(all,-id)
#select mean&std in column name
features<-as.character(features$V2) 
colnames(Xcomp)<-features
Xcompclean1<-Xcomp[,grep("mean|std",names(Xcomp))]
#create tidy data
end<-cbind(all,Xcompclean1)
# creates a independent tidy data with the average of each variable for each activity and each subject. 
end1<-end %>%
        group_by(Activity,Subject) %>%
        summarise_each(funs(mean(., na.rm=TRUE)))
#write tidy&group data in working directory
write.table(end1,"C:/Users/Александр/datasciencecoursera/Datasetuci/data_analysis.txt",row.names = FALSE)
