library(tm)
library(dplyr)
books <- readRDS("vector_books.RDS")

corpus_clean <- list()
for (book in books) {
    corpus <- VCorpus(VectorSource(as.String(book)))
    
    corpus2 <- corpus %>% 
        tm_map(stripWhitespace) %>%
        tm_map(content_transformer(tolower)) %>%
        tm_map(removeWords, stopwords("english")) %>%
        tm_map(stemDocument) 
    
    corpus_clean[[book]] <<- corpus2
    print(paste(book, length(book)))
}