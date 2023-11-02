#Day 62-63

deck
deal(deck)

#------------------------Environments
install.packages("pryr")
library(pryr)
parenvs(all=TRUE)
as.environment("package:stats")

globalenv()  #accesor functions
baseenv()
emptyenv()

parent.env(emptyenv()) #view the parent environment - the empty is the only one without a parent 

ls(emptyenv()) #view objects saved in the environment
ls(globalenv())

head(globalenv()$deck, 3) #using $ to access an object in a specific environment

assign("new", "Good Morning, Legends!", envir = globalenv()) #using assign function to save object into a specific envir
globalenv()$new


environment()

environment: R_GlobalEnv

new
new <- "Hello Active"

roll <- function(){                           #every time R runs a funtion, it creates a new active environment to evaluate the function in
    die <- 1:6
    dice <- sample(die, size = 2, replace = TRUE)
    sum(die)
}

#runtime environments
show_env <- function(){
    list(ran.in = environment(),
         parent = parent.env(environment()),
         objects = ls.str(environment()))
}

show_env() #R created a new environment called 0x15280a860 to run show_env() in.
#R creates a new environment each time you run a function

environment(show_env) #origin environment - global env
environment(parenvs) #origin environment - pryr package 

show_env <- function(){
    a <- 1
    b <- 2
    c <- 3
    list(ran.in = environment(),
         parent = parent.env(environment()),
         objects = ls.str(environment()))     #R stores a,b and c in the runtime environment- ensures R doesn't overwrite something it shouldn't
}

foo <- "take me to your runtime"

show_env()

show_env <- function(x = foo){
    list(ran.in = environment(),
         parent = parent.env(environment()),
         objects = ls.str(environment()))
}

show_env()
