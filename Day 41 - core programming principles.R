#Day 41 - Core Programming Principles

#Types of Variables

#integer
x <- 2L
typeof(x)

#double
y <- 2.5
typeof(y)

#complex
z <- 3 + 2i
typeof(z)

#character
a <- "h"
typeof(a)

#logical
q1 <- T
typeof(q1)
q2 <- FALSE
typeof(q2)

###########

A <- 10
B <- 5
C <- A+B
C

var1 <- 2.5
var2 <- 4

result <- var1/var2
print(result)

answer <- sqrt(var2)
answer

greeting <- "hello"
name <- "Bob"
message <- paste(greeting, name)
message
###########

#Logical operators: T or F

4 < 5
10 > 100
4==2

# == 
# !=
# <
# >
# <=
# >=
# ! 
# |              - OR
# &
#isTRUE(x)

result <- 4 < 5
result
typeof(result)

result2 <- !(5 > 1) #the "!" means that if something in the bracket is not T, then it will become True
result2

result | result2
result & result2

isTRUE(result)
###########

#While Loop
while(TRUE) {          #infinite loop
    print("Hello")
}

counter <- 1
while(counter <12){
    print(counter)
    counter <- counter + 1
}

temp <- 5
while(temp<10){
    print("It is cold today")
    temp <- temp + 1
}