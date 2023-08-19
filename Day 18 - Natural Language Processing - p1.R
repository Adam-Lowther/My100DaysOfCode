#Natural Language Processing 
#install.packages('tm')
#Importing the dataset
dataset = read.delim("Restaurant_Reviews.tsv", quote = '', stringsAsFactors = FALSE)

#Cleaning the texts
library(tm)
corpus = VCorpus(VectorSource(dataset$Review))
corpus = tm_map(corpus, content+transformer(tolower))
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm+map(corpus, stripWhitespace)