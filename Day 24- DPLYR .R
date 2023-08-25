#DPLYR
#install.packages('dpylr')
#intall.packages('nycflights13')
library(dpylr)
library(nycflights13)

#filter() (and slice())
head(filter(flights, month==11, day==3, carrier== 'AA')) #Filter rows based on condition
slice(flights, 1:10) #Return rows by position

#arrange() - re-orders the rows
head(arrange(flights, year, month, day, arr_time))

#select() (and rename())
head(select(flights, carrier, arr_time))
head(rename(flights, airline_carrier = carrier))

#distinct (select unique values)
distinct(select(flights,carrier))

#Mutate - create new cols built off some sort of function of old cols
head(mutate(flights, new_col = arr_delay-dep_delay))
head(transmute(flights, new_col = arr_delay-dep_delay)) #return new col only

#summarise
summarise(flights,avg_air_time = mean(air_time, na.rm = TRUE))
summarise(flights,total_air_time = sum(air_time, na.rm = TRUE))

#sample_n and sample_frac - take a random sample of rows
sample_n(flights,10)
sample_frac(flights,0.1)

