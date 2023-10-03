#Day 47 - Visualising with Matplot/subsetting/creating functions


?matplot
matplot(t(FieldGoals/Games), type = "b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01,legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

FieldGoals
t(FieldGoals/FieldGoalAttempts)

matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01,legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

#-----------------
#Subsetting

x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]


Games
Games[1:3, 6:10]
Games[c(1, 10),]
Games[,c("2008", "2009")]

Games[1,]
is.matrix(Games[1,]) #False as this is a vector
is.vector(Games[1,]) #T

Games[1,5]

Games[1,,drop=F] #Subsetting - To get the square brackets to be consistent and return matrix. Drop set to T by default

#-----------------
Data <- MinutesPlayed[1,,drop=F] #By default drop =T
matplot(t(Data), type = "b", pch=15:18, col=c(1:4,6)) #t-transpose data
legend("bottomleft", inset=0.01,legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)

Data

#-----------------

#Creating a Function
myplot <- function(data,rows=1:10){ #we have set a default parameter for rows = 10 when user doesn't specify
    Data <- data[rows,,drop=F]
    matplot(t(Data), type = "b", pch=15:18, col=c(1:4,6))
    legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(MinutesPlayed/Games, 3)

#-----------------
#Basketball Insights

#Salary
myplot(Salary)
myplot(Salary/ Games)
myplot(Salary/ FieldGoals) #These aren't ideal to visualise together as salary is not effected by injury, whereas in-game stats are.

#In-Game Metrics
myplot(MinutesPlayed)
myplot(Points) #Points scored dropped due to injury - to mitigate this we can normalise in-game metrics

#In-Game Metrics Normalised
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games) #Although DwayneWade has high accuracy,  doesn't make many attempts - so has low poitns. Maybe due to position on court? (more domain knowledge needed)
myplot(Points/Games)

#Interesting Observation
myplot(MinutesPlayed/Games) #mins played has been dropping overall
myplot(Games) #games are quite consistent

#Time is valuable
myplot(FieldGoals/MinutesPlayed) #Kevin Durant scores most goals/mins played + two distinct groups

#Play Style
myplot(Points/FieldGoals) #Kevin Durant historically scored less points per field goal (going for 2 point shots more), then he starts scoring more points (going for more 3 point shots?)

