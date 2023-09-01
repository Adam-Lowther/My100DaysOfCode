#Day 30 - Tidyr

#install.packages('tidyr')
#install.packages('data.table')
library(tidyr)
library(data.table)

#gather - collapsing columns into a key-pari value
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)

gather(df, Quarter, Revenue, Qtr1:Qtr4)

#Spread
stocks <- data.frame(
    time = as.Date('2009-01-01') + 0:9,
    X = rnorm(10, 0, 1),
    Y = rnorm(10, 0, 2),
    Z = rnorm(10, 0, 4)
)
stocks

head(stocks)
stocks.gathered <- stocks %>% gather(stock, price, X,Y,Z)

stocks.gathered %>% spread(stock, price)
spread(stocks.gathered, time, price)

#Seperate - Turn a single character column into multiple columns
df <- data.frame(new.col=c(NA, "a.x", "b.y", "c.z"))
separate(df,new.col,c('ABC','XYZ'))

#Unite - convenience function to paste multiple cols into one
df.sep <- separate(data=df, col = new.col, into = c("abc","xyz"))
df.sep
unite(df.sep, new.joined.col, abc, xyz, sep = "---")