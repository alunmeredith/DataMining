require(RWeka)
require(tm)

corpus <- readRDS("Data/corpus.RDS")

TrigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
trigrams <- TermDocumentMatrix(corpus, control = list(tokenize = TrigramTokenizer, 
                                                      wordLengths = c(3,Inf)))
saveRDS(trigrams, "Data/trigrams.RDS")


BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
bigrams <- TermDocumentMatrix(corpus, control = list(tokenize = BigramTokenizer, 
                                                     wordLengths = c(3,Inf)))
saveRDS(bigrams, "Data/bigrams.RDS")


NgramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 3))
ngrams <- TermDocumentMatrix(corpus, control = list(tokenize = NgramTokenizer,
                                                    wordLengths = c(3,Inf)))
saveRDS(ngrams, "Data/ngrams.RDS")
