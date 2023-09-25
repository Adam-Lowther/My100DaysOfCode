#Day 43 - Fundementals of R

w <- c("a","b","c","d","e")
w

#######Square Brackets

w[1] #use square brackets to access a particular element of the vector
w[2]
w[3]

w[-1] #all letters apart from the first one
v <- w[-3]
w[1:3] #passing a vector into the square brackets to get specific elements
w[3:5]

w[c(1,3,5)] #we create a vector to get 3 specific elements
w[c(-2,-4)]
w[-3:-5] #returns a & b
w[1:2] #return a & b

#lygometry - the study of quantifying what you don't know

#######

#Vectorised Operations

x <- rnorm(5)
x

#R-specific programming loop
for(i in x) {
    print(i)
    
}

print(x[1]) #the 1 is the i
print(x[2]) #the 2 is the i..
print(x[3])
print(x[4])
print(x[5])

#Conventional programming loop
for (j in 1:5) {
    print(x[j])
}

#---------------------------------

N <- 100
b <- rnorm(N)

#Vectorised approach (native to R) - is the faster method
c <- a * b

#De-vectorised approach - slower method
d <- rep(NA,N)
for (i in 1:N) {
    d[i] <- a[i] * b[i]
}

#R acts almost as a 'wrapper' for C code or another programming code and basically calls that language to perform the hard labor for R
