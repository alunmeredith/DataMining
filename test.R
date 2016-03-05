library(rvest)
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

rating <- lego_movie %>% 
    html_nodes("strong span") %>%
    html_text() %>%
    as.numeric()
rating
#> [1] 7.8

test <- html_text(lego_movie)

# Now we have an issue identifying the title. :S
# Find a way to identify the title then split into words and remove that many words from start of vector if they match. 

############### OLD WAY ########
book <- ""
invisible(sapply(files, function(page){
    
    # Extract raw text from HTML
    html <- read_html(page)
    html_text <- xml_text(html)
    html_text # Some words which wrap around are combined together
    
    # Remove the OCR Output, pagenumber and title from the start of the string. 
    processing_text <- gsub(".*(\\n){7}", "", html_text)
    # Remove spaces and punctuation
    processing_text <- gsub("[[:space:]]+", " ", processing_text)
    #processing_text <- gsub("[[:punct:]]", "", processing_text)
    
    # 
    book <<- paste(book, processing_text)
}))



page = files[191]
html_structure(html)
x <- xml_text(xml_find_all(html, "//span"))
y <- sapply(x, paste)
# This gives seperated words!!!
x <- xml_text(xml_find_all(html, "//span[@class='ocr_cinfo']"))

# Need to combine the words together again to do the deeper analysis stuff from rpubs. 
# May want to do that deeper part later and simply do the stop words removal etc. on a vector like this. 


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

library(tm)
library(dplyr)
books <- readRDS("vector_books.RDS")

test <- VCorpus(VectorSource(c(as.String(books[[20]]), as.String(books[[15]]) )))

test <- test %>% 
    tm_map(stripWhitespace) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removeWords, stopwords("english")) %>%
    tm_map(stemDocument) 
# Stemcompletion?

saveRDS(test, "test.RDS")

dtm <- DocumentTermMatrix(test)

test <- findFreqTerms(dtm, 50)

docsdissim <- dist(test, method = "cosine")
