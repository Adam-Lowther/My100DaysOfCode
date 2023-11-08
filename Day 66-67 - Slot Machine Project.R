#Day 66- Project- Creating a Slot Machine & calculating payout rate

#Subtask 3- Assign symbols a prize (with lookup table)

payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25,
             "B" = 10, "C" =10, "0" = 0)

payouts["BBB"]
payouts["DD"]
unname(payouts["DD"])

#subsetting payouts by symbols[1]
symbols <- c("7","7","7")
symbols[1]

payouts[symbols[1]]
symbols <- c("C", "C", "C")
payouts[symbols[1]]

#--------------------------------------


same <- symbols[1] == symbols[2] && symbols[2] == symbols[3] #subtask 1
bars <- symbols %in% c("B", "BB", "BBB") #subtask 2
payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25,
             "B" = 10, "C" =10, "0" = 0) #subtask 3


#Subsetting the vector to receive the correct prize

c(0, 2, 5)[1]   #prize is £0, £2 or £5
cherries + 1

c(0, 2, 5)[cherries + 1]


#updated code >>>

if (same){
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25,
                 "B" = 10, "C" =10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
} else if(all(bars)){
    prize <- 5
} else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
}

