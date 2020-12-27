
library(tesseract)
library(tidyverse)

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
    one_special_char = "^."
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

image_files = list.files(pattern = "cd\\d\\.png")

language = tesseract("fra")
l_raw_text = map(image_files, ~ ocr(image = .x, engine = language))
names(l_raw_text) = str_remove(image_files, "\\.png$")

l_songs = map(l_raw_text, parse_songs)


