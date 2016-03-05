library(tm)
library(dplyr)
books <- readRDS("vector_books.RDS")

corpus <- vector()
for (book in books) {
    corpus <<- c(corpus, as.String(book))
}
corpus2 <- VCorpus(VectorSource(corpus))

test <- VCorpus(VectorSource(c(as.String(books[[20]]), as.String(books[[15]]) )))

corpus3 <- corpus2 %>% 
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removeWords, stopwords("english")) %>%
    tm_map(stemDocument) 
    # Stemcompletion?

saveRDS(corpus3, "corpus3.RDS")

dtm <- DocumentTermMatrix(test)

test <- findFreqTerms(dtm, 50)

docsdissim <- dist(test, method = "cosine")


test <- VCorpus(VectorSource(c(as.String(books[[20]]), as.String(books[[15]]) )))
a <- Sys.time()
test <- test %>% 
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removeWords, stopwords("english")) %>%
    tm_map(stemDocument) 
# Stemcompletion?

saveRDS(test, "test.RDS")

dtm <- DocumentTermMatrix(test)
Sys.time() - a
test <- findFreqTerms(dtm, 50)

    
