#Natural Language Processing 
#install.packages('tm')
#install.packages('SnowballC')
#Importing the dataset
dataset_original = read.delim("Restaurant_Reviews.tsv", quote = '', stringsAsFactors = FALSE)

#Cleaning the texts
library(tm)
library(SnowballC) #Req for stemming (reduce to base/root form)
corpus = VCorpus(VectorSource(dataset$Review))
corpus = tm_map(corpus, content_transformer(tolower)) #All reviews transformed to lowercase
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)

#Creating the Bag of Words Model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999) #looking at the matrix and keep 99.9% of the cols that have most 1's
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Fitting Random Forest Classification to the Training set
install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred) #73% accuracy which isn't bad considering we only trained the model on 800 reviews
