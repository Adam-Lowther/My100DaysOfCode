#Day 38 Natural Language Processing (NLP)

#install.packages('tm')
#install.packages('twitteR')
#install.packages('wordcloud')
#install.packages('RColorBrewer')
#install.packages('e1017')
#install.packages('class')
library(tm)
library(twitteR)
library(wordcloud)
library(RColorBrewer)
library(e1071)
library(class)

args(grep)
grep('A', c('A','B','C','D','A'))

args(nchar)
nchar('helloworld')
nchar('hello world')

#Replacement of matching patterns
args(gsub)
gsub('pattern','replacement','hello have you seen the pattern here?')

#Text Manipulation
print(paste('A','B','C',sep='...'))

str('abcdefg',start=2,stop = 5)
strsplit('2016-01-23',split='-')

#Couldn't create Twitter App as must pay (but working code below)
setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)

soccer.tweets <- searchTwitter("soccer", n=2000, lang="en") #Searching for the term 'soccer'
soccer.text <- sapply(soccer.tweets, function(x) x$getText())

#Cleaning the Data - removing the emoticons and creating a corpus

soccer.text <- iconv(soccer.text, 'UTF-8', 'ASCII') # remove emoticons
soccer.corpus <- Corpus(VectorSource(soccer.text)) # create a corpus

#Creating a doc term matrix
term.doc.matrix <- TermDocumentMatrix(soccer.corpus,
                                      control = list(removePunctuation = TRUE,
                                                     stopwords = c("soccer","http", stopwords("english")),
                                                     removeNumbers = TRUE,tolower = TRUE))
#Check out the matrix
head(term.doc.matrix)
term.doc.matrix <- as.matrix(term.doc.matrix)

#Get word counts
word.freqs <- sort(rowSums(term.doc.matrix), decreasing=TRUE) 
dm <- data.frame(word=names(word.freqs), freq=word.freqs)

#Create Word Count
wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))
