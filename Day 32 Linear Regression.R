#Linear Regression
df <- read.csv('student-mat.csv',sep = ';')
head(df)
summary(df)

any(is.na(df))
str(df)

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)

#EDA

#Numeric Only
num.cols <- sapply(df, is.numeric)
#Filter
cor.data <- cor(df[, num.cols])
print(cor.data)

install.packages('corrgram')
install.packages('corrplot')

print(corrplot(cor.data,method = 'color'))

corrgram(df)
corrgram(df,order = TRUE, lower.panel = panel.shade, upper.panel = panel.pie,text.panel = panel.txt) #Correlation by shade

ggplot(df, aes(x=G3)) + geom_histogram(bins = 20, alpha= 0.5, fill = 'blue') #Histogram

#Spliting data into training and test set
#install.packages('caTools')
library(caTools)
set.seed(101)
sample <- sample.split(df$G3, SplitRatio = 0.7)

train <- subset(df,sample == TRUE)
test <- subset(df,sample == FALSE)

#Building the linear regression model
model <- lm(y ~ x1 + x2,data) #selected features
model <- lm(y ~. , data) #uses all the features

#Train and build model
model <- lm(G3 ~ ., data = train)

print(summary(model))

#Grabbing the residuals
res <- residuals(model)
class(res)
res <- as.data.frame(res)
head(res)

ggplot(res, aes(res)) + geom_histogram(fill = 'blue', alpha = 0.5)

#Predictions
plot(model)

G3.predictions <- predict(model, test)

results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
print(head(results))

#Taking care of the -ve residual values
to_zero <- function(x){
    if (x<0){
        return(0)
    }else{
        return(x)
    }
}

#Apply 0 function
results$predicted <- sapply(results$predicted, to_zero)

#Means squared error
mse <- mean( (results$actual - results$predicted)^2)
print('MSE')
print(mse)