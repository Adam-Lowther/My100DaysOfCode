#Day 29 - Pipe Operator & Dpylr Exercise
#install.packages('dplyr')
library(dplyr)
df <- mtcars

#Pipe Operator
result <- df %>%
    filter(mpg > 20) %>%
    sample_n(size = 5) %>%
    arrange(desc(mpg))

print(result)

#Dpylr Exercise using mtcars
head(mtcars)
filter(mtcars, mpg>20, cyl==6)

arrange(mtcars, cyl, desc(wt)) #Reorder df 

select(mtcars,mpg, hp)

distinct(select(mtcars,gear)) #Or
mtcars %>% select(gear) %>% distinct() #Distinct values of gear column

mutate(mtcars,performance = hp/wt) #New col

summarise(mtcars, avg_mpg = mean(mpg)) #Find mean mpg value using dplyr
 
mtcars %>% filter(cyl==6) %>% summarise(avg_hp = mean(hp)) #Pipe operators to get mean hp value 