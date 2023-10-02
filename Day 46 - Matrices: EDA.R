#Day 46 - Matrices

#matrix() - vector into a matrix
?matrix
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5) #n of rows/cols
A
A[2,3]

B <- matrix(my.data, 4, 5, byrow=T)
B
B[2,5]

#rbind() - vector into matrix row by row
r1 <- c("I","am","happy")
r2 <- c("what","a","day")
r3 <- c(1,2,3)
C <- rbind(r1,r2,r3)
C

#cbind() - v-matrix col by col
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D

############

#Named Vectors
Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c("a","b","c","d","e") #assigning a vector to a function
Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL #to clear the names
Charlie

############

# Naming Matrix Dimensions
temp.vec <- rep(c("a","B","zZ"), each=3) #each element in vector x3
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How","are","you?")
Bravo

colnames(Bravo) <- c("X","Y","Z")
Bravo

Bravo["are", "Y"] <- 0
Bravo

rownames(Bravo) <- NULL
Bravo
############

#----------------------------
#Basketball Dataset Analysis

Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]

FieldGoals

round(FieldGoals / Games,1)


round(MinutesPlayed / Games)

z <- round(Points / Games)
z
z["KobeBryant", mean(8:10)]
z["LeBronJames", mean(8:10)]

round(FieldGoals/ FieldGoalAttempts,2)

############


