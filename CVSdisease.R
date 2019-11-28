# Title     : Cardiovascular Disease Prediction
# Objective : Predicting CV Disease based on Kaggle's Dataset
# Dataset : https://www.kaggle.com/sulianova/cardiovascular-disease-dataset
# Created by: Thossakrai Nakkasem
# Created on: 28/11/19

# read csv file 
cardio <- read.csv("cardio_train.csv",sep =  ";")
str(cardio)

#data cleaning
normalize <- function(x) {
  return( (x-min(x)) / (max(x)-min(x)))
}

scale_age <- scale(cardio$age)
cardio$age <- as.vector(apply(scale_age, 2, normalize))
scale_height <- scale(cardio$height)
cardio$height <- as.vector(apply(scale_height, 2, normalize))
scale_weight <- scale(cardio$weight)
cardio$weight <- as.vector(apply(scale_weight, 2, normalize))
scale_aphi <- scale(cardio$ap_hi)
cardio$ap_hi <- as.vector(apply(scale_aphi, 2, normalize))
scale_aplo <- scale(cardio$ap_lo)
cardio$ap_lo <- as.vector(apply(scale_aplo, 2, normalize))

#data exploratory
summary(cardio$height)
summary(cardio$weight)

#Train Test Split
cardio_train <- cardio[1:49000, ]
# cardio_train_label <- cardio[1:49000, 12]
cardio_test <- cardio[49001: 70000,]
# cardio_test_label <- cardio[49001: 70000, 12]

#model
# install.packages("neuralnet")
require(neuralnet)
cardio_model <- neuralnet(cardio ~ age + gender + height + weight + ap_hi + ap_lo + cholesterol + gluc + 
                            smoke + alco + active, data = cardio_train, hidden = 1)














 

