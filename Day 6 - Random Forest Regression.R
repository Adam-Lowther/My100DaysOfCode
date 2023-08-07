#Random Forest Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# Fitting the Regression Model to the dataset
#install.package('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 100)

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the Regression Model results
# install.packages('ggplot2')
library(ggplot2)

# Visualising the Regression Model results (for higher resolution and smoother curve)

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary),
               colour = 'red') +
    geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
              colour = 'blue') +
    ggtitle('Truth or Bluff (Random Forest Regression)') +
    xlab('Level') +
    ylab('Salary')