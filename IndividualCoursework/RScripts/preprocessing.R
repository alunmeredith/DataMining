library(tm)
library(dplyr)
library(SnowballC)
books <- readRDS("Data/vector_books.RDS")

corpus <- vector()
for (book in books) {
    corpus <<- c(corpus, as.String(book))
}
corpus <- VCorpus(VectorSource(corpus))
saveRDS(corpus, "Data/corpus_raw.RDS") # 424582 terms

# Remove roman numerals and a pattern presumed to be a construction of the printing process
f <- content_transformer(function(x, pattern) gsub(pattern, "", x))
corpus <- tm_map(corpus, f, "[xivXIV]+") # 396444 terms

# Tokenise
corpus <-tm_map(corpus, content_transformer(tolower)) # Casefold
corpus <- tm_map(corpus, f, "[^a-z ]+")
corpus <- tm_map(corpus, stripWhitespace) # 213016 terms
saveRDS(corpus, "Data/corpus_cleaner.RDS")


# Additional words to be removed
stopwords_new <- c(stopwords("english"), letters,  "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "p", "na", "â", "ib", "ib", "tt", "lb", "â")

corpus <- tm_map(corpus, removeWords, stopwords_new) # Stopword removal, 18191 terms
corpus <- tm_map(corpus, stemDocument) # Equivalence class, 188108 terms

g <- content_transformer(function(x, pattern) gsub(pattern, "constantnopl", x))
corpus <- tm_map(corpus, g, "constantn")
corpus <- tm_map(corpus, g, "constantnoplopl")

saveRDS(corpus, "Data/corpus.RDS")
