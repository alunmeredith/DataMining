dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)


# Following rpubs article https://rpubs.com/lmullen/nlp-chapter
library(NLP)
library(openNLP)
library(magrittr)

processing_text <- as.String(processing_text)
word_ann <- Maxent_Word_Token_Annotator()
sent_ann <- Maxent_Sent_Token_Annotator()
annotations <- annotate(processing_text, list(sent_ann, word_ann))
head(annotations)

#test <- VCorpus(VectorSource(as.String(book)))
#page <- "../gap-html/gap-html/gap_-C0BAAAAQAAJ/00000100.html"


