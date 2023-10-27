#Day 58-60

dim(die) <- c(2, 3)
typeof(die)

class(die)

attributes(die)

#------------------Dates & Times
Sys.time()
now <- Sys.time()
now

typeof(now)
class(now)

gender <- factor(c("male","female","female","male"))

typeof(gender)
attributes(gender)
unclass(gender) #we can see exactly how R is storing the factor with unclass

gender
as.character(gender)

card <- c("ace", "hearts", 1) #This is a problem as we are putting multiple tyes of data type into a vector so R turns them into one

#Coercion

sum(c(1,1,0,0))

as.character(1)
as.logical(1)
as.numeric(FALSE)

#We can avoid coercion by using a list
list1 <- list(100:130, "R", "D", list(TRUE, FALSE))
list1

card <- list("ace", "hearts", 1)
card

#------------------Data Frames
df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df)
#using data.frame to store a deck of cards would be a nightmare- time consuming + open to typos .. instead load data

#----------------- Loading Data
deck <- read.csv('deck.csv')
head(deck)
tail(deck)
str(deck)
summary(deck)

write.csv(deck, file = "cards.csv", row.names = FALSE) #Saving a copy of deck as a new .csv file - so can easily email to a collague (as an ex)
getwd()

#----------------- Chapter 4 - R Notation - 

deck[1,1]
deck[1, c(1,2,3)] 
deck[1, 1:3]
deck[c(1,1), c(1,2,3)]

vec <- c(1,2,3,4,5,6)
vec[1:4]
vec[-3]

deck[1:2, 1]
deck[1:2, 1, drop = FALSE]

#Negative Integers
deck[-1, 1:3]
deck[-(2:52), 1:3]

deck[0,0]

#Blank spaces
deck[1, ]
#logical values
deck[1, c(T,T,F)] #So this returns 1st row, then the first 2 cols as they are = T

vec <- c(1, 4, 5, 7, 8, 12)
vec[c(T, T, F, F, F, T)]

#Names
deck[1, c("face", "suit", "value")]
deck[ , "value"]



