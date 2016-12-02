#Creates a word cloud made up of complaints made to Comcast within the last 5-6 years.
#Dataset came from:  https://www.kaggle.com/archaeocharlie/comcastcomplaints
#read in dataset
comcastwc <- read.csv('comcast_consumeraffairs_complaints.csv', stringsAsFactors=F)

#load libraries
library(tm)
library(SnowballC)
library(wordcloud)

#load data as a corpus
comcastcorpus <- Corpus(VectorSource(comcastwc$text))
#create plain text document
comcastcorpus <- tm_map(comcastcorpus, PlainTextDocument)
#convert text to lowercase 
comcastcorpus <- tm_map(comcastcorpus, content_transformer(tolower))
#remove punctuation
comcastcorpus <- tm_map(comcastcorpus, removePunctuation)
#remove common words 
comcastcorpus <- tm_map(comcastcorpus, removeWords,c(stopwords('english'),"they","the","said","call","called", "get","told","comcast"))
#remove extra white spaces
comcastcorpus <- tm_map(comcastcorpus, stripWhitespace)


#Create Word Cloud
wordcloud(comcastcorpus, max.words = 100, random.order = FALSE, colors=brewer.pal(8, "Dark2"))

#Build a text document matrix
dtm <- TermDocumentMatrix(comcastcorpus)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

#Retrieve 50 most common words
head(d, 50)

findFreqTerms(dtm, lowfreq = 5000)
findAssocs(dtm, terms = "service", corlimit = 0.3)
