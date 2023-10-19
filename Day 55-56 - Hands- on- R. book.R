#Day 55-56
#Hands-on programming with R - book

1+1
100:130

die <- 1:6
ls() #see what object names you have already used
die -1
die/2
die/die

#element-wise execution - each element of vector 1 interacts with the corresponding element of vector 2
#vector recyling - when vectors different lengths - will just keep going through the numbers

die %*% die #inner multiplication
die %o% die #outer multiplication

#Functions - rolling the die
round(3.14159)
factorial(3)

sample(x = 1:4, size = 2)

sample(x= die, size = 2)
sample(x= die, size = 4)

args(round) #to see the arguments used for function

round(3.1415,digits = 2)

sample(die, 2) #sample removes that 1st chosen num  from the pot, now this cannot be picked again - to counter this use arg replace=TRUE
sample(size=3, x=die)
dice <- sample(die, size = 2, replace=T)#with replace=T the die are now independent (sample with replacement- replaces each value after draw)
sum(dice)

#-------------------------- Writing Our Own Function
roll <- function(){
    die <- 1:6
    dice <- sample(die, size = 2, replace=TRUE,
                   prob = c(1/8,1/8,1/8,1/8,1/8,3/8)) #adding prob arg to unfairly weight the dice towards high numbers
    sum(dice)
}

roll2 <- function(bones){
    die <- sample(die, size = 2, replace=TRUE)
    sum(die)
}

roll2(bones = 1:4)
roll2(bones = 1:6)
roll2(1:20)

#-------------------------- qplot
install.packages("ggplot2")
library(qplot)

x <- c(-1,-0.8,-0.6,-0.4,-0.2,0, 0.2,0.4,0.6,0.8,1)
y <- x^3
qplot(x,y)

x <- c(1,2,2,2,3,3)
qplot(x, binwidth= 1, ylab = "count")

x2 <- c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2, binwidth = 1)

x3 <- c(0,1,1,2,2,2,3,3,4)
qplot(x3, binwidth = 1)

replicate(4, 5/2)
replicate(10, roll())

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

?sample



