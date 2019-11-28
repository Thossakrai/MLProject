# Title     : Cardiovascular Disease Prediction
# Objective : Predicting CV Disease based on Kaggle's Dataset
# Dataset : https://www.kaggle.com/sulianova/cardiovascular-disease-dataset
# Created by: Thossakrai Nakkasem
# Created on: 28/11/19


# read csv file 
cardio <- read.csv("cardio_train.csv",sep =  ";")
str(cardio)

#data cleaning
cholesterol <- factor(cardio$cholesterol,levels = c("1", "2", "3"), ordered = TRUE)

#data exploratory
summary(cardio$height)
summary(cardio$weight)

#Train Test Split
cardio_train <- cardio[[1:49000, ]]
