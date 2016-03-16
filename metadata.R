require(tm)
# Years are not always accurate, probably +/- 50 years at 95% confidence. 

# Patterns noticed:
#   The books are either about rome or greece
#   There are several volumes of the same books
#   There are a few books about geography.

corpus <- readRDS("Data/corpus.RDS")


#### Manually create meta data table. ######
metadata <- data.frame(title = character(),
                       author = character(),
                       year = numeric(),
                       translation_year = character(),
                       topic = character(),
                       directory = character(),
                       description = character(),
                       stringsAsFactors = F
                       )

metadata[1,] <- c("dictionary of greek and roman geography, volume II",
                 "Sir William Smith",
                 1872,
                 NA,
                 "Greek/Roman Geography",
                 "gap_-C0BAAAAQAAJ/",
                 "Dictionary"
                )

metadata[2,] <- c("Tacitus, volume III, the History of Tacitus",
                  "Cornelius Tacitus",
                  100,
                  1793,
                  "Roman",
                  "gap_2X5KAAAAYAAJ/",
                  NA)

metadata[3,] <- c("The History of the Peloponnesian War, Vol II",
                  "Thucydides",
                  -431,
                  1781,
                  "Greek",
                  "gap_9ksIAAAAQAAJ/",
                  NA)

metadata[4,] <- c("The History of Rome, Vol I",
                  "Titus Livius",
                  17,
                  1979,
                  "Roman",
                  "gap_Bdw_AAAAYAAJ/",
                  "Also known as 'Livy'")

metadata[5,] <- c("The History of the Decline and Fall of the Roman Empire, Vol III",
                  "Edward Gibbon, Esq",
                  1776,
                  NA,
                  "Roman",
                  "gap-images/gap_CSEUAAAAYAAJ",
                  NA)

metadata[6,] <- c("The Whole Genuine works of Flavius Josephus, Vol II",
                  "Josephus Flavius",
                  100,
                  1829,
                  "Roman",
                  "gap_CnnUAAAAMAAJ",
                  "Jewish, initially antagonistic to Rome"
                  )

metadata[7,] <- c("The Description of Greece",
                  "Pausanias",
                  180,
                  1918,
                  "Greek Geography",
                  "gap_DhULAAAAYAAJ",
                  NA)

metadata[8,] <- c("Livy, Vol III",
                  "Titus Livius",
                  17,
                  1833,
                  "Rome",
                  "gap_DqQNAAAAYAAJ",
                  "Also by Titus Liviticus, different translation of a different volume of his works. "
                  )

metadata[9,] <- c("Gibbon's History of the Decline and Fall of the Roman Empire, Vol IV",
                  "Edward Gibbon Esq",
                  1776,
                  1826,
                  "Rome",
                  "gap_GIt0HMhqjRgC",
                  "Another book in Gibbins Series, Reprinted to remove immoral/irreligous text"
)

metadata[10,] <- c("Gibbon's History of the Decline and Fall of the Roman Empire, Vol II",
                   "Edward Gibbon Esq",
                   1776,
                   1826,
                   "Rome",
                   "gap_IlUMAQAAMAAJ",
                   "Another book in Gibbins Series, Reprinted to remove immoral/irreligous text"
                   )

metadata[11,] <- c("The Historical Annals of Cornelius Tacitus, Vol I",
                   "Cornelius Tacitus",
                   100,
                   1829,
                   "Rome",
                   "gap_MEoWAAAAYAAJ",
                   "Written by same author as Hisotry of Tacitus"
)

metadata[12,] <- c("Livy, Vol V",
                   "Titus Livius",
                   17,
                   1834,
                   "Rome",
                   "gap_RqMNAAAAYAAJ",
                   "Also by Titus Liviticus, different translation of 'The History of Rome"
)

metadata[13,] <- c("The Genuine works of Flavius Josephus, Vol I",
                   "Flavius Josephus",
                   100,
                   1821,
                   "Rome",
                   "gap_TgpMAAAAYAAJ",
                   "Part of series, Josephus was initially antagonistic to rome in roman-jewish war"
)

metadata[14,] <- c("The History of the Decline and Fall of the Roman Empire, Vol V",
                   "Edward Gibbon, Esq",
                   1821,
                   NA,
                   "Rome",
                   "gap_VPENAAAAQAAJ",
                   "Not the rewritten version"
)

metadata[15,] <- c("The Histories of Caius Cornelius Tacitus",
                   "William Seymour Tyler",
                   100,
                   1864,
                   "Rome",
                   "gap_WORMAAAAYAAJ",
                   "Different translation of Tacitus' histories "
)

metadata[16,] <- c("The History of the Decline and Fall of the Roman Empire, Vol VI",
                   "Edward Gibbon, Esq",
                   1825,
                   NA,
                   "Rome",
                   "gap_XmqHlMECi6kC/",
                   "Part of series, not the rewritten version"
)

metadata[17,] <- c("The History of the Decline and Fall of the Roman Empire, Vol I",
                   "Edward Gibbon, Esq",
                   1776,
                   NA,
                   "Rome",
                   "gap_aLcWAAAAQAAJ",
                   "Part of series, not the rewritten version"
)

metadata[18,] <- c("The History of Rome, Vol III",
                   "Theodor Mommsen",
                   1854,
                   1863,
                   "Rome",
                   "gap_dIkBAAAAQAAJ",
                   "Translated from german"
)

metadata[19,] <- c("The History of the Peloponnesian war, Vol I",
                   "Thucydides",
                   -431,
                   1818,
                   "Greek",
                   "gap_fnAMAAAAYAAJ",
                   NA
)

metadata[20,] <- c("Titus Livius Roman History",
                   "Titus Livius",
                   17,
                   1813,
                   "Rome",
                   "gap_m_6B1DkImIoC",
                   "By William Gordon"
)


metadata[21,] <- c("The Works of Josephus, With a Life, Vol IV",
                   "Flavius Josephus",
                   100,
                   1869,
                   "Rome",
                   "gap_ogsNAAAAIAAJ",
                   "William Wiston, A.M"
)

metadata[22,] <- c("The Works of Cornelius Tacitus, Vol IV",
                   "Cornelius Tacitus",
                   100,
                   1805,
                   "Rome",
                   "gap_pX5KAAAAYAAJ",
                   "Arthur Murphy, ESQ."
)

metadata[23,] <- c("The first and thirty-third books of Pliny's Natural History",
                   "Pliny",
                   79,
                   1828,
                   "Natural History",
                   "gap_udEIAAAAQAAJ",
                   "John Bostock, M.D., Early encyclopedia"
)

metadata[24,] <- c("The Works of Flavius Josephus, Vol III",
                   "Flavius Josephus",
                   100,
                   1806,
                   "Rome",
                   "gap_y-AvAAAAYAA",
                   "William Whitston, A.M"
)

# Add shortnames which are easier to plot
shortname <- c("Geo Dictionary", "Tacitus Hist 3", "Pelopennesian 2", "Livy 1", "Decline & Fall 3", "Josephus 2", "Description of Greece", "Livy 3", "Decline & Fall 4", "Decline and Fall 2", "Tacitus Annals 1", "Livy 5", "Josephus 1", "Decline & Fall 5", "Tacitus Hist", "Decline & Fall 6", "Decline & Fall 1", "History of Rome 3", "Pelopennesian 1", "Livy History", "Josephus 4", "Tacitus Hist 4", "Pliny Nat. Hist", "Josephus 3")
metadata$shortname <- shortname

# Ad numerical id variable to check against later construct names. 
metadata$id <- seq_along(metadata[,1])

metadata[1,"volume"] <- 2
metadata[1,"translator"] <- NA

metadata[2,"translator"] <- "Arthur Murphy"
metadata[2, "title"] <- "Works of Cornelius Tacitus"
metadata[2, "volume"] <- 5
metadata[2, "translation_year"] <- 1805

metadata[4, "translation_year"] <- 1797

metadata[5, "translation_year"] <- 1830

metadata[6, "description"] <- "Added 3 additional dissertations to original trnlsation"

metadata[7, "translation_year"] <- 1794
metadata[13, "description"] <- "Revised by Samuel Burder"
metadata[18, "description"] <- "Original Language German"

##### TRANSLATOR
metadata$translator <- c(NA, "Arthur Murphy", "William Smith", "George Baker", "Edward Gibbon", "Havercamp", "unknown", "George Baker", "Thomas Bowdler", "Thomas Bowdler", "Arthur Murphy", "George Baker", "William Whiston", "Edward Gibbon", "William Tyler", "Edward Gibbon", "Edward Gibbon", "William Dickson", "William Smith", "William Gordon", "William Whiston", "Arthur Murphy", "John Bostock", "William Whiston")

##### Volume
metadata$volume <- c(2, 5, 2, 1, 3, 2, 3, 3, 4, 2, 1, 5, 1, 5, NA, 6, 1, 3, 1, NA, 4, 4, NA,3)

metadata$group <- c("Dictionary", "Tacitus", "Peloponnesian", "Livy", "Decline & Fall", "Josephus", "Description of Greece", "Livy", "Decline & Fall", "Decline & Fall", "Tacitus", "Livy", "Josephus", "Decline & Fall", "Tacitus", "Decline & Fall", "Decline & Fall", "History of Rome", "Pelopennesian", "Livy", "Josephus", "Tacitus", "Pliny", "Josephus")
metadata$group <- as.factor(metadata$group)

############# Apply metadata to corpus #######################

for (i in seq_along(corpus)){
    meta(corpus[[i]], "author") <- metadata[i,"author"]
    meta(corpus[[i]], "title") <- metadata[i,"title"]
    meta(corpus[[i]], "year") <- metadata[i, "year"]
    meta(corpus[[i]], "translation_year") <- metadata[i,"translation_year"]
    meta(corpus[[i]], "topic") <- metadata[i, "topic"]
    meta(corpus[[i]], "directory") <- metadata[i, "directory"]
    meta(corpus[[i]], "description") <- metadata[i, "description"]
    meta(corpus[[i]], "shortname") <- metadata[i, "shortname"]
    meta(corpus[[i]], "group") <- metadata[i, "group"]
}


saveRDS(metadata, "Data/metadata.RDS")
saveRDS(corpus, "Data/corpus.RDS")
