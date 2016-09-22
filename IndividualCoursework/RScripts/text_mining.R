library(tm)
library(dplyr)
library(SnowballC)
books <- readRDS("Data/vector_books.RDS")

corpus <- vector()
for (book in books) {
    corpus <<- c(corpus, as.String(book))
}
corpus <- VCorpus(VectorSource(corpus))

#test <- VCorpus(VectorSource(c(as.String(books[[20]]), as.String(books[[15]]) )))
a <- Sys.time()

corpus <- corpus %>% 
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removeWords, stopwords("english")) %>%
    tm_map(stemDocument) 
    # Stemcompletion?

saveRDS(corpus, "Data/corpus.RDS")
Sys.time() - a
 