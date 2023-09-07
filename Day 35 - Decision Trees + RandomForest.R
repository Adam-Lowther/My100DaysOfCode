#Day 35 - Decision Treess and Random Forest

install.packages('rpart')
library(rpart)

str(kyphosis) #kyphosis- exaggerated, forward rounding of the upper back
head(kyphosis)

#Decision Tree
tree <- rpart(Kyphosis ~ .,method = 'class',data = kyphosis)
printcp(tree)
plot(tree, uniform = T, main = 'Kyphosis Tree') #Not the best way to plot DT
text(tree, use.n = T, all = T)

install.packages('rpart.plot')
library(rpart.plot) #This is a much nicer package for decision tree plots
prp(tree)

#Random Forest
install.packages('randomForest')
library(randomForest)
rf.model <- randomForest(Kyphosis ~ . , data = kyphosis)
print(rf.model)

rf.model$ntree
rf.model$confusion
rf.model$classes
rf.model$forest