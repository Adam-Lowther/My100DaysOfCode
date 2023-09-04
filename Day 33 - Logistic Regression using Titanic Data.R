#Day 33 - Logistic Regression

df.train <- read.csv('titanic_train.csv')

#EDA

print(head(df.train))
print('      ')
print(str(df.train))

install.packages('Amelia') #Useful package for missing data
library(Amelia)
help("missmap")

missmap(df.train, main="Missings Map", 
        col=c("yellow", "black"), legend=FALSE) #approx. 20% of the age data is missing
        

library(ggplot2)
ggplot(df.train, aes(Survived)) + geom_bar()
ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill = factor(Pclass))) #num of passengers in each class
ggplot(df.train, aes(Sex)) + geom_bar(aes(fill = factor(Sex))) # num of male/female

ggplot(df.train,aes(Age)) + geom_histogram((bins=20, alpha=0.5, fill='blue'))

ggplot(df.train,aes(SibSp)) + geom_bar()
ggplot(df.train,aes(Fare)) + geom_histogram(fill = 'green', colour = 'black', alpha = 0.5)

pl <- ggplot(df.train,aes(Pclass,Age))
pl <- pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass),alpha=0.4))
pl +(scale_y_continuous(breaks = seq(min(0), max(80), by=2)) )
##########
#Imputation of age based on class
#########
impute_age <- function(age,class){
    out <- age
    for (i in 1:length(age)){
        
        if (is.na(age[i])){
            
            if (class[i] == 1){
                out[i] <- 37
                
            }else if (class[i] == 2){
                out[i] <- 29
                
            }else{
                out[i] <- 24
            }
        }else{
            out[i]<-age[i]
        }
    }
    return(out)
}
#########
fixed.ages <- impute_age(df.train$Age, df.train$Pclass)
#########
df.train$Age <- fixed.ages
########
missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)
missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)
missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)

#########
#########
#Building the Logistic Regression Model
library(dplyr)
df.train <- select(df.train,-PassengerId,-Name,-Ticket,-Cabin)
head(df.train)

#Setting factor cols
df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)
str(df.train)
###########
###########

#Training the Model
log.model <- glm(formula=Survived ~ . , family = binomial(link='logit'),data = df.train)
summary(log.model)

#Predicting Test Cases
library(caTools)
set.seed(101)

split = sample.split(df.train$Survived, SplitRatio = 0.70)

final.train = subset(df.train, split == TRUE)
final.test = subset(df.train, split == FALSE)

final.log.model <- glm(formula=Survived ~ . , family = binomial(link='logit'),data = final.train)
summary(final.log.model)

#Prediction Accuracy
fitted.probabilities <- predict(final.log.model,newdata=final.test,type='response')

#Calculate from Predicted Values
fitted.results <- ifelse(fitted.probabilities > 0.5,1,0)
misClasificError <- mean(fitted.results != final.test$Survived)
print(paste('Accuracy',1-misClasificError))

#Confusion Matrix
table(final.test$Survived, fitted.probabilities > 0.5)