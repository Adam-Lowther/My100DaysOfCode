#Built in R Features & Functions

#seq():create sequence
seq(0,10, by=2)
seq(0,100, by=10)
seq(0,24, by=2)

#sort(): sort a vector
v <- c(1,4,7,2,13,3,11)
sort(v)
sort(v, decreasing = TRUE)
cv <- c('b','d','a','C')
cv
sort(cv)

#rev():Reverse Elements in Object
v <- c(1:10)
v
rev(v)

#str(): Show the structure of an object
str(1:10)
str(mtcars)
summary(mtcars)

#append(): Merge objects together (works on vectors and lists)
v <- c(1:10)
v2 <- 35:40
v
v2
append(v, v2)

#is. (Checking data type)
v <- c(1,2,3)
is.vector(v)
is.data.frame(v)
is.data.frame(mtcars)

#as. (Convert into another data type)
as.list(v)
as.matrix(v)


print(sample(x = 1:10,1)) #We get X1 random number 1 through 10
print(sample(x = 1:100,3))

#Apply
v <- c(1:5)
addrand <- function(x){
    ran <- sample(1:100, 1)
    return(x+ran)
}

result<- sapply(v,addrand)
print(result) 
#We took a function and applied to every element in the vector

v <- c(1:5)
times2 <- function(num){
    return(num*2)
}

result <- sapply(v, times2)
print(result)
# We pass in the vector and then the function on sapply/lapply/vapply

#Anonymous Functions - create a function without having to name it
v <- c(1:5)

function(num){num*2}

result <- sapply(v,function(num){num*2})

print(result)

#Apply with multiple inputs
add_choice <- function(num,choice){
    return(num+choice)
}

print(sapply(v, add_choice, choice =100)) #(Vector, function, any additional arguments)
