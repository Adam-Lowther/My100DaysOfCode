#Day 64- creating functions and saving in different environment

deal()
environment(deal)

deal()

DECK <- deck[-1,]
deck <- deck[-1,]

head(deck, 3)

deal <- function(){
    card <- deck[1,]
    assign("deck", deck[-1,], envir = globalenv())     #assigning "deck" to the global environment
    card
}

deal() #now deal will clean up the global copy of deck

shuffle <- function(cards){
    random <- sample(1:52, size=52)
    cards[random, ]
}

head(deck, 3)

a <- shuffle(deck)
head(deck, 3)

head(a, 3)


shuffle <- function(cards){
    random <- sample(1:52, size=52)
    assign("deck", DECK[random, ], envir = globalenv())
}

shuffle()
deal()

#Storing deck in a runtime envir so it is safe

setup <- function(deck){ #saving a copy of deck as DECK in runtime envir
    DECK <- deck
    
DEAL <- function(){
    card <- deck[1,]
    assign("deck", deck[-1, ], envir = globalenv())
}

SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
 }



DEAL <- function(){
    card <- deck[1,]
    assign("deck", deck[-1, ], envir = globalenv())
    card
}

list(deal = DEAL, shuffle = SHUFFLE)

cards <- setup(deck)

deal <- cards$deal
shuffle <- cards$shuffle

str(cards)

deal
shuffle

environment(deal)
environment(shuffle)

#deal and shuffle to work exlusively with objeccts in the parent (enclosing) envir of their runtime environments

setup <- function(deck){
    DECK <- deck

DEAL <- function(){
    card <- deck[1, ]
    assign("deck", DECK[random, ], envir = parent.env(environment()))
}

SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
}

list(deal = DEAL, shuffle = SHUFFLE)

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

rm(deck)
shuffle()

deal()
