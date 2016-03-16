# Turns each book into a single vector of characters.
library(xml2)
# List files in that directory
books_dir <- list.files("../gap-html/gap-html/", full.names = T)
books <- list()
for (book in books_dir) {
    files <- list.files(book, full.names = T)
    book_text <- vector()
    book_titles <- vector() 
    for (page in files) {
        
        # Extract raw text from HTML by searching for class nodes
            # This is important due to html_text joining words on new lines
        html <- read_html(page)
        html_text <- xml_text(xml_find_all(html, "//span[@class='ocr_cinfo']"))
        if (length(html_text) == 0) next 
        
        # Find the title characters, done because they are in their own paragraph
        print(page)
        title <- xml_find_all(html, "//p[@class='ocr_par']")[1] %>%
            xml_children() %>% 
            xml_children() %>% 
            xml_text()
        
        # Remove title characters if at the start of the entire text
        # Warnings are typically on the first / last pages where the title is not present.
        ifelse(all(html_text[1:length(title)] == title),
            html_text <- html_text[length(title)+1:length(html_text)],
            warning('Title(', title, ') not found on page: ', 
                    tail(strsplit(page, "/")[[1]],1))
        )
        
        # Very basic preprocessing, removing spaces, punctuation and make everything lowercase
        #processing_text <- gsub("[[:space:]]+", "", html_text)
        #processing_text <- gsub("[[:punct:]]", "", processing_text)
        #processing_text <- tolower(processing_text)
        
        # Concatonate all pages into one book 
        book_text <<- c(book_text, processing_text)
        #book_titles <<- c(book_titles,  paste0(title, collapse = " "))
    }
    # Build a single list of books Labeled with their directory name and title
    books[[book]] <- book_text
    #attr(books, "title") <- c(attr(books,"title"), 
    #                          names(head(sort(table(book_titles), decreasing = T),1)))
}
 
saveRDS(books, "Data/vector_books.RDS")
