#Day 54 

#---------------Statistical Transformations
?geom_smooth

#smoother
u <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating,
                            colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip/hack
u + geom_boxplot(size=1.2) + geom_jitter()
#another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) #better way - clearer

u <- ggplot(data=movies,aes(x=Genre, y=CriticRating,
                            colour=Genre))
u + geom_boxplot(size=1.2)

#--------------- Using Facets

v <- ggplot(data = movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black")
#facets
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black") +
    facet_grid(Genre~., scales = "free")

#scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3) +
    facet_grid(Genre~.)

w + geom_point(size=3) +
    facet_grid(.~Year)

w + geom_point(size=2) +
    facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre~Year)

#--------------- Coordinates

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))
m + geom_point()

m + geom_point() +
    xlim(50,100)
    ylim(50,100)
    
#won't work well always 
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
    ylim(0,50)

#instead - zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
    coord_cartesian(ylim = c(0,50))

#improve #1
w + geom_point(aes(size=BudgetMillions)) +
    geom_smooth() +
    facet_grid(Genre~Year) +
    coord_cartesian(ylim = c(0,100))
