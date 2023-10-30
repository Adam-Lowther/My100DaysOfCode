#Day 60/61
#Function
deal <- function(cards){
    cards[1, ]
}

deal(deck)

deck2 <- deck[1:52, ]
head(deck2)

deck3 <- deck[c(2, 1, 3:52), ]
head(deck3)

random <- sample(1:52, size = 52)
random

deck4 <- deck[random, ]
deck4

shuffle <- function(cards){
    random <- sample(1:52, size = 52)
    cards[random, ]
}

deal(deck)
deal(deck2)

deck$value
mean(deck$value)
median(deck$value)

lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst

lst$logical
lst$strings
lst$numbers

lst[[1]] #We can subset a list with double-brackets- R returns values that inside and element of the list. 
lst["numbers"]
lst[["numbers"]]
lst$numbers

#--------------------Modifying Values
deck2 <- deck
deck2

vec <- c(0,0,0,0,0,0)
vec
vec[1] <- 1000

vec[c(1, 3, 5)] <- c(1, 1, 1)
vec
vec[4:6] <- vec[4:6] + 1

vec[7] <- 0 #Create values that do not exist
vec

deck2$new <- 1:52
head(deck2)
deck2$new <- NULL

deck2[c(13, 26, 39, 52), ]#Ace appear every 13
deck2[c(13, 26, 39, 52), 3 ]
deck2$value[c(13, 26, 39, 52)]

deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14) #we can do this or just put <- 14
deck2$value

head(deck3)

#Logical tests
1>2
1> c(0,2,3)
c(1,2,3)>c(3,2,1)

1 %in% c(3, 4, 5)
c(1,2,3,4) %in% c(3,4,5)

# = assigns a value to an object, == is equal to

deck2 <- read.csv("cards.csv")
head(deck2)

sum(deck2$face=="ace") #Counting how many cards are ace

deck3$face == "ace"
deck3$value[deck3$face == "Ace"] <- 14
head(deck3)


deck4 <- deck
deck4$value <- 0
head(deck4, 13)

deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"] <- 1

#Boolean operations
a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)

a==b
b==c
a==b & b==c

queenOfSpades <- deck$face == "queen" & deck$suit == "spades"
deck4[queenOfSpades,]
deck4$value[queenOfSpades] <- 13

w <- c(-1, 0 , 1)
w>= 0

x <- c(5, 15)
x>10 & x<20

y <- "February"
y == "February"

z <- c("Monday", "Tuesday", "Friday")
all(z %in% c("Monday", "Tuesday", " Wendnesday", "Thursday", "Friday", "Saturday", "Sunday"))

#Blackjack
deck5 <- deck
head(deck5, 13)

facecard <- deck5$face %in% c("king", "queen", "jack")
deck5$value[facecard] <- 10
deck5[facecard, ]

head(deck5, 13)

#Missing Information
#na.rm
sum(is.na(mtcars))

deck5$value[deck5$face == "ace"] <- NA

head(deck5, 13)
