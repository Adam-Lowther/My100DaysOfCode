#Day 37 K-Means Clustering

library(ISLR)
head(iris)

#Visualising the data
library(ggplot2)
pl <- ggplot(iris,aes(Petal.Length,Petal.Width, color=Species))
print(pl+ geom_point(size=4))

#K-Means
set.seed(101)
irisCluster <- kmeans(iris[,1:4],3,nstart = 20)
print(irisCluster)

table(irisCluster$cluster,iris$Species)

#Cluster Visualisation
library(cluster)
clusplot(iris,irisCluster$cluster,colour =T, shade = T, labels = 0, lines = 0)