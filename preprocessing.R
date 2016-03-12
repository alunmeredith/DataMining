library(tm)
library(dplyr)
library(SnowballC)
books <- readRDS("Data/vector_books.RDS")

corpus <- vector()
for (book in books) {
    corpus <<- c(corpus, as.String(book))
}
corpus <- VCorpus(VectorSource(corpus))

# Tokenise
corpus <- corpus %>% 
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>% # Casefold
    tm_map(removeWords, stopwords("english")) %>% # Stopword removal
    tm_map(stemDocument) # Equivalence class
    # Stemcompletion?

saveRDS(corpus, "Data/corpus.RDS")
