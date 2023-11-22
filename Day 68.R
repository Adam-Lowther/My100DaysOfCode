#Day 68

#Generic functions
print(pi)
pi
print(head(deck))
head(deck)

print(play())
play()

print.POSIXct().     #methods of print - R functions that use UseMethod (which calls a specalised method) to handle a specific class of print input
#FUNCTION (X, ...)
print.factor()
methods(print) #almost 200 methods, hence, many classes exist in R
    ``
#Method Dispatch
class(one_play) <- "slots"
args(print)
print.slots <- function(x, ... ){
    cat("I'm using the print.slots method")
}
print(one_play)
rm(print.slots)


print.slots <- function(x, ...){
    slot_display(x)
}

one_play

#Modifying play function so it assigns slots to the class attribute of its output
play <- function(){
    symbols <- get_symbols()
    structure(score(symbols), symbols = symbols, class = "slots")
}

class(play())
play()

#Classes
methods(class = "factor")
class(score)

