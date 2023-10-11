#Day 51-52 - ggplot2 intro

getwd()
setwd("~/Documents/Data Science/R Working Directory")

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
tail(movies)

#Renaming columns
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)


#Converting film, genre, year from chr to factor
movies$Genre <- factor(movies$Genre)
movies$Film <- factor(movies$Film)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

#--------------------------------Aesthetics
library(ggplot2)

#Number 1 visualisation

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
#Add geometry
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) +
    geom_point()

#Add colour + size
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                          colour=Genre, size= BudgetMillions)) +
    geom_point()

#-------------------------------- Plotting With Layers

p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                          colour=Genre, size= BudgetMillions)) #p (the starting layer) is an object that includes all this data
#Point
p + geom_point() #p has the data, aes and we just overlay the geometry

#Lines
p+geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() +geom_point()

#-------------------------------- Overriding Aesthetics

q <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               colour=Genre, size= BudgetMillions))
#add geom layer
q + geom_point()

#overriding aes
#ex1
q + geom_point(aes(size=CriticRating)) #this argument has overriden the size saved in q

#ex2
q + geom_point(aes(colour=BudgetMillions))

q + geom_point() #this shows the original q - as we are not modifying q 

#ex3
q + geom_point(aes(x=BudgetMillions)) + ##the x-axis will still keep the old name of q unless we specify
    xlab("Budget Millions $$$")
#ex4
p + geom_line() +geom_point()
#reduce line size
p + geom_line(size=1) +geom_point() #here we are setting (instead of mapping) the aes.. we don't specify aes = 

