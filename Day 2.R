#Day 2 - Simple Linear Regression
 
# Importing the dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset [, 2:3]

# Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Simple Linear Regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting the Test Results
y_pred = predict(regressor, newdata = test_set)

#Visualising the Training set results
#install.packages("ggplot2")
#library(ggplot2)

ggplot() +
    geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
               colour = 'red') +
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
              colour = 'blue') +
    ggtitle('Salary Vs Experience (Training Set)') +
    xlab('Years of Experience') +
    ylab('Salary')
