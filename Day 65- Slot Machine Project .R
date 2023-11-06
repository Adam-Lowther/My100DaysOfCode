#Day 65- Project- Creating a Slot Machine & calculating payout rate

#We need to: generate three symbols + calculate a prize based on those symbols.

#Common slot machine symbols used:
#diamonds(DD), sevens(7), triple bars(BBB), double bars(BB), single bars(B), cherries(C), and zeroes(0)

#RULES:

#Player will win prize if they get: Three of the same type of symbol (except for three zeros), Three bars (of mixed variety), One of more cherries
#Monetary value of the prize is determined by the exact combination of symbols, and further modified byt the presense of diamonds. Diamonds can be considered any other symbol if it would increase
#a players prize. EG: a player who rolls  7 7 D D would earn a prize for getting three sevens. 
#The one exception to this rule: a diamond cannot be considered a cherry unless the player also gets on real cherry- this prevents a dud roll like, 0 DD 0 from being scored as 0 c 0
#Every diamond that appears in a combination doubles the amount of the final prize. So 7 7 DD (£160) would actually be scored higher than 7 7 7 (£80). The jackpot is DD DD DD

#--------------------------------------

get_symbols <- function(){
    wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
    sample(wheel, size = 3, replace = TRUE,
           prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)) #the probabilities are based on a group of video lottery terminals from Manitoba, Canada.(http://bit.ly/jse_Braun)
}

get_symbols()

#The complete slot machine simulation will involve subtasks that are arranged both in series and in parellel:

# Get symbols > display symbols > choose: three of a kind(look up prize), all bars(assign £5), other(count cherries) >>> adjust for diamonds

if (#case 1: all the same){
    prize <- #look up the prize
    } else if (#case 2: all bars){
        prize <- #assign £5
        } else {
            #count cherries
            prize <- #calculate a prize
        }
#count diamonds
# double prize if necessary

#-------------------------------------- First Subtask
 
symbols <- c("7", "7", "7")
symbols <- c("B", "BB", "BBB")
symbols <- c("C","DD","0")

symbols[1]==symbols[2] & symbols[2]==symbols[3]
all(symbols==symbols[1])
#or
length(unique(symbols)) == 1

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]

if (same) {
    prize <- #look up the prize
    } else if (#case 2: all bars){
        prize <- #assign £5
        } else {
            #count cherries
            prize <- #calculate a prize
        }

#Subtask 2- Second prize
symbols <- c("B", "BBB", "BB")

symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" &        # <inefficient way
    symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
    symbols[3] == "B" | symbols[3] == "BB" | symbols[3] == "BBB"

all(symbols %in% c("B", "BB", "BBB")) # < much easier

bars <- symbols %in% c("B", "BB", "BBB")

#Subtask 3- Assign symbols a prize


