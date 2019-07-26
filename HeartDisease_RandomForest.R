#Installing Library for use

library(ggplot2)
install.packages("cowplot")
install.packages("randomForest")
library(cowplot)
library(randomForest)

# Loading Data into R HeartDisease Dataset

data<-read.csv("heart.csv")
head(data)
str(data)
# Data Cleaning for Better Results

data$sex <- ifelse(test=data$sex==0,"Female","Male")
data$sex <-as.factor(data$sex)
str(data$sex)

# Converting Factor variables#
data[data=="?"] <- NA
data$cp <-as.factor(data$cp)
data$fbs <-as.factor(data$fbs)
data$restecg <-as.factor(data$restecg)
data$exang <-as.factor(data$exang)
data$slope <-as.factor(data$slope)
str(data$target)
data$target <- ifelse(test = data$target==0,"healthy","unhealthy")
data$target <-as.factor(data$target)
data$ca <- as.factor(data$ca)
str(data$target)
#########################################################3

#Building Random Forest

set.seed(42)
model<-randomForest(target~.,data=data,proximity=TRUE)
model
