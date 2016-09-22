#######
corpus <- readRDS("corpus.rda")   
dtm <- DocumentTermMatrix(corpus)
#dtm <- findFreqTerms(test2, 50)
test <- removeSparseTerms(dtm, 0.01)
test2 <- as.data.frame(as.matrix(test))
Distances <- dist(test2, method = "euclidean")
Clusters <- hclust(Distances, method= "ward.D")
plot(Clusters)

#Construct a vector of book names manually###
metadata <- data.frame(names = character(), path = character(), author = character(), date = character())

names <- c(names, "Greek and Roman Geography")
names <- c(names, "The History of the Peloponnesian War")
names <- c(names, "The History of the Decline and Fall of the Roman Empire")