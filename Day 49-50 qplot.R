#Day 49/50- Qplot, building df, merging df

#--------------------------------Filtering a DF

head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate> 40,] #true/false vector
stats[stats$Birth.rate> 40 & stats$Internet.users < 2,] #Both conditions must be true to show
stats[stats$Income.Group == "High income" ,]

stats[stats$Country.Name == "Malta", ]

#-------------------------------- qplot() Inro
#install.packages('ggplot2')
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users) #no need to put stats first as qplot() knows our data=stats
qplot(data = stats, x=Income.Group, y=Birth.rate)
qplot(data = stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))
qplot(data = stats, x=Income.Group, y=Birth.rate, geom = "boxplot")
     
#-------------------------------- Visualising what we need
qplot(data = stats, x=Internet.users, y=Birth.rate)
qplot(data = stats, x=Internet.users, y=Birth.rate,
      size=I(4))
qplot(data = stats, x=Internet.users, y=Birth.rate,
      colour=I("red"), size=I(4))
qplot(data = stats, x=Internet.users, y=Birth.rate,
      colour=Income.Group, size=I(3)) #We can clearly see as low income countries, have less access to the internet and higher birth rate. High income countries, have high internet users, and low birth rate


#-------------------------------- Building Dataframes
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,
                   Regions_2012_Dataset)
#head(mydf)
#colnames(mydf) <- c("Country","Code","Region")
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset) #This saves lots of time.. instead of creating df then renaming cols.. we can create df whilst naming cols (also works for cbind+rbind)

head(mydf)
tail(mydf)
summary(mydf)

#-------------------------------- Merging Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged, 5)

#-------------------------------- Visualising with qplot()
qplot(data = stats, x=Internet.users, y=Birth.rate,
      colour=I("red"), size=I(4))

qplot(data = merged, x=Internet.users, y=Birth.rate)
qplot(data = merged, x=Internet.users, y=Birth.rate,
      colour=Region)

#1 Shapes
qplot(data = merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(15)) 

#Transparancy(alpha)
qplot(data = merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(19),
      alpha=I(0.5)) #making part transparant means no data points are hidden under others

# Title
qplot(data = merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(19),
      alpha=I(0.5),
      main ="Birth Rate vs Internet Users")