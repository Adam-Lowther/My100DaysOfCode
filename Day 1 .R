# Day 1 of the challenge

print('Hello World')

#Course: Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023] (On Udemy)

#Importing the dataset

dataset = read.csv('Data.csv')

#Taking care of missing data

dataset$Age = ifelse(is.na(dataset$Age),
                     mean(dataset$Age, na.rm = TRUE),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        mean(dataset$Salary, na.rm = TRUE),
                        dataset$Salary)

#Encoding Categorical Data

dataset$Country = factor(dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No' , 'Yes'),
                           labels = c(0, 1))

#Splitting the data set into the training and test set
#install.packages('caTools')

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE )
test_set = subset(dataset, split == FALSE )

#Feature Scaling

training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3]) 


