#Support Vector Machines

library(ISLR)
head(iris)

#Building the Model
#install.packages('e1071',repos = 'http://cran.us.r-project.org')
library(e1071)

help(svm)

model <- svm(Species ~ ., data=iris)
summary(model)

predicted.values <- predict(model,iris[1:4])
table(predicted.values,iris[,5])

#Tuning
# Tune for combos of gamma 0.5,1,2
# and costs 1/10 , 10 , 100
tune.results <- tune(svm,train.x=iris[1:4],train.y=iris[,5],kernel='radial',
                     ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))

summary(tune.results)

tuned.svm <- svm(Species ~ ., data=iris, kernel="radial", cost=1, gamma=0.5)
summary(tuned.svm)

tuned.predicted.values <- predict(tuned.svm,iris[1:4])
table(tuned.predicted.values,iris[,5])

#Couldn't improve the model- likely due to having too little data
