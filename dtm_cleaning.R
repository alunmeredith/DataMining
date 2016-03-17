# This file includes functions that have been defined to process document term matrices so they are ready to be fed into clustering algorithms.
# The functions are freq_table which tables the 10 highest weighted terms in the document term matrix. dtm_clean which adds metadata, removes sparsity and applies tf-idf. dissim which produces a cosine dissimilarity matrix. 


# Defie a function which returns frequency table for document term matrix
freq_table <- function(dtm) {
    if (!is.data.frame(dtm)) dtm <- as.data.frame(as.matrix(dtm))
    if (dim(dtm)[1] > dim(dtm)[2]) dtm <- t(dtm)
    apply(dtm, 1, function(x) {
        x %>%
            sort(decreasing = T) %>%
            head(10) %>%
            names()
    })
}

# Define a function that cleans the document term matrix to a point where a dissimilarity matrix can be made. 
dtm_clean <- function(dtm, meta = metadata, sparsity = .95, idf = TRUE, normalise = TRUE){
    rownames(dtm) <- meta$shortname
    dtm <- removeSparseTerms(dtm, sparsity)
    if (idf == TRUE) {
        dtm <- weightTfIdf(dtm, normalize = normalise)
    }
    if (normalise == TRUE & idf == FALSE) { 
    norm_m <- function(m) m/apply(m, MARGIN = 1, FUN=function(x) sum(x^2)^.5)
    dtm <- norm_m(dtm)
    }
    return(dtm)
}

# Define a function which computes cosine dissimilarity matrix of a dtm
dissim <- function(dtm, meta = metadata){
    # Convert into sparse matrix from "Matrix" package
    m <- Matrix::sparseMatrix(i = dtm$i, j = dtm$j, x = dtm$v,
                              dims = c(dtm$nrow, dtm$ncol)) 
    
    # Normalise lengths of documents
    row_norms <- sqrt(rowSums(m ^ 2))
    row_norms <- t(crossprod(sign(m), Diagonal(x = row_norms)))
    row_norms@x <- 1/row_norms@x
    m_norm <- m * row_norms
    
    # Finally, we can find cosine similarity
    sim <- tcrossprod(m_norm)
    colnames(sim) <- meta$shortname
    rownames(sim) <- meta$shortname
    return(1 - sim)
}
