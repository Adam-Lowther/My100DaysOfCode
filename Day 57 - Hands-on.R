#Day 57

is.vector(die)
length(die)

int <- 1L
is.integer(1L)
is.vector(1L)
text <- "ace"
is.character("ace")

int <- c(1L, 5L)
text <- c("ace", "hearts")

#Double (or numeric) Vector - stores regular numbers
die <- c(1,2,3,4,5,6)
die

typeof(die) #ask R what the type of object is


cards <- c("ace", "king", "queen", " jack", "ten")
cards

#Attributes
attributes(die)
names(die)

names(die) <- c("one", "two", "three", "four", "five", "six")
names(die) #now die has name attributes

die + 1
names(die) <- NULL
die

#Transforming vector into an n-dimensional array

dim(die) <- c(3, 2)
die

dim(die) <- c(1, 2, 3) #1x2x3 hypercube (1 row, 2 cols, 3 "slices") - 3Dstructure displayed on the 2D screen
die

#Matrices
m <- matrix(die, nrow = 2, byrow = TRUE)
m

#Arrays
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

hand1 <- c("ace","king","queen","jack", "ten", "spaces", "spaces", "spaces", "spaces", "spaces")
matrix(hand1, nrow = 2, byrow = T)


