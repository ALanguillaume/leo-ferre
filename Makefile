
.PHONY: all clean

all: ocr update_metadata

ocr: text/cd*.txt
text/cd%.txt: pictures/cd%.png get_song_titles.R
	@echo "--- Get song titles with OCR ---"
	Rscript get_song_titles.R

update_metadata: music/updated/cd-*/* 
music/updated/cd-*/*: music/raw/cd-*/* text/cd*.txt update_tag_id3.py
	@echo "--- Update metadata m4a files ---"
	find music/raw/ -type d -name "cd*" -exec cp {} music/updated/ -r \;
	python3 update_tag_id3.py

clean:
	rm text/cd*.txt
	rm music/updated/cd-*/*

