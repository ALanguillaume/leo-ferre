
.PHONY: all clean

all: ocr update_md

ocr: text/cd*.txt
text/cd%.txt: pictures/cd%.png scripts/get_song_titles.R
	@echo "--- Get song titles with OCR ---"
	Rscript scripts/get_song_titles.R

update_md: music/updated/cd-*/*
music/updated/cd-*/*: music/raw/cd-*/* text/cd*.txt\
scripts/dispatch_music_files.R scripts/update_tag_id3.py
	@echo "--- Update metadata m4a files ---"
	Rscript scripts/dispatch_music_files.R;\
	python3 scripts/update_tag_id3.py

clean:
	rm text/cd*.txt
	rm music/updated/cd-*/*
