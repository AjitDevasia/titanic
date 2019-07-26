# Importing Libraries
library(ggplot2)
library(cowplot)
library(randomForest)
library(stringr)

# Reading file into R

data <-read.csv("titanic.csv")
head(data)

str(data)

# Data Cleaning and Arrangement

#Extracting Titles from Name
data$Name <- as.character(data$Name)

data$Title <- gsub('(.*, )|(\\..*)', '', data$Name)
str(data$Title)

#Converting Predictor variable Survived into Factor
data$Survived <- as.factor(data$Survived)
str(data$Survived)
data$Survived <- ifelse(test=data$Survived==0,"Dead","Survived")
str(data$Survived)
data$Survived <-as.factor(data$Survived)
str(data$Survived)

#Converting Title Variable to Factor
data$Title <-as.factor(data$Title)
str(data$Title)

#Converting PClass variable to factor

data$Pclass<-as.factor(data$Pclass)
str(data$Pclass)

#Checking for Missing Data and Summarizing Data
anyNA(data)
summary(data)

set.seed(42)
model <- randomForest(Survived~., data=data,proximity=TRUE)
library(dplyr)
data2<-data
data2 <-select(data2,-c(Name))

# RandomForest Model
model <- randomForest(Survived~., data=data2,proximity=TRUE)
model
