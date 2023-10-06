#Day 48 - Data Frames

#Importing Data

#Method 1: Select the file manually
stats <- read.csv(file.choose())

#Method 2: Set the WD and read data
getwd() #see what current WD is
setwd("/Users/adamlowther/Home/Documents/Data Science/ R Working Directory")
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")

#-------------------------------- Exploring Data
stats
nrow(stats)
ncol(stats)


head(stats, n=10)
tail(stats)
str(stats)     #str-structure  runif(r-unif)- Random variables distributed normally
summary(stats)
#-------------------------------- Using the $ sign (works for df but not matrix)
head(stats)
stats[3,3]
stats[3, "Birth.rate"]

stats$Country.Name
stats$Country.Name[2]
stats[,"Country.Name"]

#-------------------------------- Basic Operations with a DF
stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

is.data.frame(stats[1,]) #no need for drop=F (for df)
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])

#multiply cols
head(stats)
stats$Birth.rate * stats$Internet.users
#add column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users #To add new col 
head(stats)

stats$xyz <- 1:5 #this will be recycled - but it must be a multiple of the nrows
head(stats, n=10)

#remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#--------------------------------Filtering a DF

head(stats)
stats$ratio <- stats$Birth.rate/stats$Internet.users
head(stats)









