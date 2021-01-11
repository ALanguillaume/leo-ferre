
library(tesseract)
suppressPackageStartupMessages(
  library(tidyverse)
)

parse_songs = function(raw_text) {

  # Escape lines in raw text
  raw_lines = str_split(raw_text, "\n") %>%
    unlist() %>%
    str_subset("")

  # Define patterns matching track number artefacts
  start_line_patterns = c(
    one_letter = "^[a-z]",
    one_or_two_letters_one_dot = "^[a-z]{1,2}\\.",
    one_special_char_one_dot = "^.\\.",
    one_number = "^\\d",
    one_number_one_dot = "^\\d\\.",
    one_special_char_one_comma = ".,",
    hashtag = "^#",
    one_special_char = "^æ|^«"
  )
  regex_pattern = paste(start_line_patterns, collapse = "|")

  # Combine song names spread accross multiple lines
  # based on track number artefacts
  songs = vector("character", 20)
  for (i in 2:length(raw_lines)) {
    if(!grepl(regex_pattern, raw_lines[i])){
      songs[i-1] = paste(raw_lines[i-1], raw_lines[i])
    } else {
      songs[i] = raw_lines[i]
    }
  }

  # Delete track number artefacts
  songs = songs %>% str_subset("") %>% str_remove(".{1,3} ")

  return(songs)

}

### Main

image_files = list.files(path = "pictures",
                         pattern = "cd\\d\\.png",
                         full.names = TRUE)

# Perform OCR on picture of song lists
language = tesseract("fra")
l_raw_text = map(image_files, ~ ocr(image = .x, engine = language))
names(l_raw_text) = str_remove(basename(image_files), "\\.png$")

# Parse song title form raw text
l_songs = map(l_raw_text, parse_songs)

# Manual corrections
l_songs$cd1 = str_replace(l_songs$cd1, "LaVie", "La Vie")
l_songs$cd2 = str_replace(l_songs$cd2, "CaT", "Ca T")
l_songs$cd4 = str_replace(l_songs$cd4, "Tes", "T'es")

# Save songs titles per cd
walk2(l_songs,  names(l_songs),
      function(songs, cd) {
        writeLines(text = songs,
                   con = file.path("text", paste0(cd, ".txt")))
      })




