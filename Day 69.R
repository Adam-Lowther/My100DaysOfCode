#Day 69


die <- c(1,2,3,4,5,6)
rolls <- expand.grid(die, die)
rolls$value <- rolls$Var1 + rolls$Var2
head(rolls, 3)

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
prob

rolls$Var1
prob[rolls$Var1]


rolls$prob1 <- prob[rolls$Var1]
rolls$prob2 <- prob[rolls$Var2]
rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls, 3)

#Expected value = sum of the dice values multiplied by the dice probabilities
sum(rolls$value * rolls$prob)

#Calculate the payout rate of the slot machine, this will = the expercted value of the slot machine's prize
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
combos

get_symbols <- function(){
    wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
    sample(wheel, size = 3, replace = TRUE,
           prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)) #the probabilities are based on a group of video lottery terminals from Manitoba, Canada.(http://bit.ly/jse_Braun)
}

prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

head(combos, 3)

combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
sum(combos$prob)

#calculating prize
symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
score(symbols)

#---------------------------- for loop
for (value in c("My", "first", "for", "loop")){
    print("one run")
}

for (value in c("My", "second", "for", "loop")){
    print(value)
}

chars <- vector(length = 4)
words <- c("My", "fourth", "for", "loop")

for (i in 1:4) {
    chars[i] <- words[i]
    
}

chars


#---------------------------- 
combos$prize <- NA
head(combos, 3)