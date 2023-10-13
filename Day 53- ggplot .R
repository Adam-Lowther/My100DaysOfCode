#Day 53- ggplot - mapping vs setting +histogram/density chart

q + geom_point(aes(x=BudgetMillions)) + ##the x-axis will still keep the old name of q unless we specify
    xlab("Budget Millions $$$")

#Mapping vs Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add colour
#1 Mapping (what we've done so far)
r + geom_point(aes(colour=Genre))

#Setting
r + geom_point(colour="DarkRed")

#Error:
#r + geom_point(aes(colour="DarkGreen"))

#1 Mapping
r + geom_point(aes(size=BudgetMillions))
#Setting
r + geom_point(size=10)
#Error:
#r + geom_point(aes(size=10))

#-------------------------------- Histograms & Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#add colour
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add a boarder
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#3 (improved)

#Density Chart
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = "stack")

#-------------------------------- Starting Layer Tips

#one way:
t <- ggplot(data =movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="White", colour="Blue")

#another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White", colour="Blue")
#Which way we do depends on what we are visualising - will the 'x' be changing? Then we may want to use 2nd approach

#4 chart

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", colour="Blue")

#5
t <- ggplot() #skeleton plot - when we want to create a plot but use different datasets on the plot

