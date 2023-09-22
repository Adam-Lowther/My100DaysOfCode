#Day 42 - for loop, if statement + recap

counter <- 1
while(counter <12){
    print(counter)
    counter <- counter + 1
}

for(i in 1:5){
    print("Hello R")
}

for(i in 5:10){
    print("Hello R")
}

#----- -2 ---- -1 ---- 0 ---- 1 ----- 2 -----
#if, else if, else statement - chaining statements

rm(answer)
x <- rnorm(1)
if(x > 1){
    answer <- "Greater than 1"
} else if(x >=-1){
        answer <- "Between -1 and 1"
} else{
answer <- "Less than -1"
}

#Law of large numbers exercise 

N <- 1000 #input
counter <- 0
for (i in rnorm(N)){
 if(i > -1 & i < 1){
     counter <- counter + 1
 }
}
counter / N

#compare to 68.2% or 0.682