library(tm)
library(dplyr)
library(SnowballC)
books <- readRDS("Data/vector_books.RDS")

corpus <- vector()
for (book in books) {
    corpus <<- c(corpus, as.String(book))
}
corpus <- VCorpus(VectorSource(corpus))
saveRDS(corpus, "Data/corpus_raw.RDS")

# Additional words to be removed
stopwords_new <- c(stopwords("english"), letters,  "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "p", "na", "â", "ib", "ib", "tt", "lb", "â")

# Remove roman numerals and a pattern presumed to be a construction of the printing process
f <- content_transformer(function(x, pattern) gsub(pattern, "", x))
corpus <- tm_map(corpus, f, "[xivXIV]+")
corpus <- tm_map(corpus, f, "[^a-z ]")

# Tokenise
corpus <- corpus %>% 
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>% # Casefold
    tm_map(removeNumbers)
saveRDS(corpus, "Data/corpus_cleaner.RDS")

corpus <- tm_map(corpus, removeWords, stopwords_new) %>% # Stopword removal
    tm_map(stemDocument) # Equivalence class

saveRDS(corpus, "Data/corpus.RDS")
