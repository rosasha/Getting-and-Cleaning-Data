install.packages("dplyr")
library(dplyr)
setwd("C:/Users/Александр/datasciencecoursera")

X_test <- read.table("./Datasetuci/test/X_test.txt")
X_train <- read.table("./Datasetuci/train/X_train.txt")
features <- read.table("./Datasetuci/features.txt")
Y_test <- read.table("./Datasetuci/test/Y_test.txt")
Y_train <- read.table("./Datasetuci/train/Y_train.txt")
subj_test <- read.table("./Datasetuci/test/subject_test.txt")
subj_train <- read.table("./Datasetuci/train/subject_train.txt")
labels<-read.table("./Datasetuci/activity_labels.txt")

Xcomp<-rbind(X_test,X_train)
Ycomp<-rbind(Y_test,Y_train)
SUBJcomp<-rbind(subj_test,subj_train)

SYcomp<-cbind(Ycomp,SUBJcomp)

colnames(SYcomp)<-c("id","Subject")
colnames(labels)<-c("id","Activity")

labels<-data.frame(labels)
SYcomp<-data.frame(SYcomp)

all<-inner_join(SYcomp,labels,by = "id")
all<-select(all,-id)
features<-as.character(features$V2) 
colnames(Xcomp)<-features

Xcompclean1<-Xcomp[,grep("mean|std",names(Xcomp))]
end<-cbind(all,Xcompclean1)

end1<-end %>%
        group_by(Activity,Subject) %>%
        summarise_each(funs(mean(., na.rm=TRUE)))