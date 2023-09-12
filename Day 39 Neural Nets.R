#Day 39 Neural Nets

library(MASS)
set.seed(101)
data <- Boston
str(data)

summary(data)
head(data)
any(is.na(data))

#Neural Net Model
install.packages('neuralnet',repos = 'http://cran.us.r-project.org')
library(neuralnet)

#Training the Model
maxs <- apply(data, 2, max) 
mins <- apply(data, 2, min)
maxs

mins

scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins))
head(scaled)

#Train and Test Sets
library(caTools)
split = sample.split(scaled$medv, SplitRatio = 0.70)

train = subset(scaled, split == TRUE)
test = subset(scaled, split == FALSE)

#Training the Model
# Call package
library(neuralnet)

# Get column names
n <- names(train)
n

# Paste together
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
f
nn <- neuralnet(f,data=train,hidden=c(5,3),linear.output=TRUE)

#Neural Net Visualisation
plot(nn)

#Predictions using the Model

# Compute Predictions off Test Set
predicted.nn.values <- compute(nn,test[1:13])

# Its a list returned
str(predicted.nn.values)

# Convert back to non-scaled predictions
true.predictions <- predicted.nn.values$net.result*(max(data$medv)-min(data$medv))+min(data$medv)

# Convert the test data
test.r <- (test$medv)*(max(data$medv)-min(data$medv))+min(data$medv)

# Check the Mean Squared Error
MSE.nn <- sum((test.r - true.predictions)^2)/nrow(test)
MSE.nn

Visualise Error

error.df <- data.frame(test.r,true.predictions)

head(error.df)

library(ggplot2)
ggplot(error.df,aes(x=test.r,y=true.predictions)) + geom_point() + stat_smooth()
