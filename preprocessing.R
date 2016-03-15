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

# Additional words to be removed
words <- c("i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x")
words <- c(words, "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten")
words <- c(words, "p", "na", "â", letters)

corpus <- corpus %>% 
    tm_map(removeNumbers) %>%
    tm_map(removeWords, words)
saveRDS(corpus, "Data/corpus.RDS")
