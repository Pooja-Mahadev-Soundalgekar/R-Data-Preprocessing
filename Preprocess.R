library(RTextTools)
library(fpc)   
library(cluster)
library(tm)
library(stringi)
library(proxy)
library(wordcloud)

path = "C:/Users/Mounisha/Documents/IT 7th sem/DWDM/assign/lab3/corpus"
dir = DirSource(paste(path,"/texts/",sep=""), encoding = "UTF-8")
#corpus = Corpus(dir, readerControl=list(reader=readPDF))
corpus = Corpus(dir)
summary(corpus)
corpus <- tm_map(corpus,removePunctuation)
corpus <- tm_map(corpus,removeNumbers)
corpus <- tm_map(corpus,tolower)
corpus <- tm_map(corpus,removeWords,stopwords("english"))
corpus <- tm_map(corpus,stripWhitespace)
library(SnowballC)
corpus <- tm_map(corpus, stemDocument)
dtm<- DocumentTermMatrix(corpus)
dtm
summary(corpus)

write.csv((as.matrix(dtm)), "test.csv")
#head(sort(as.matrix(dtm)[18,], decreasing = TRUE), n=15)
dtm.matrix = as.matrix(dtm)
#wordcloud(colnames(dtm.matrix), dtm.matrix[28, ], max.words = 20)

inspect(dtm)


m  <- as.matrix(dtm)
# # # m <- m[1:2, 1:3]

#print(distMatrix)
#distMatrix <- dist(m, method="cosine")
#print(distMatrix)

groups <- hclust(distMatrix,method="ward.D")
plot(groups, cex=0.9, hang=-1)
rect.hclust(groups, k=5)

#distMatrix <- dist(m, method="euclidean")
#kfit <- kmeans(distMatrix, 2)   
#clusplot(as.matrix(distMatrix), kfit$cluster, color=T, shade=T, labels=2, lines=0)  
