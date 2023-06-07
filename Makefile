
TEXT=text/cd*.txt
MUSIC=music/
MUSIC_RAW=$(MUSIC)raw/
MUSIC_UPDATED=$(MUSIC)updated/
MUSIC_RAW_SONGS=$(MUSIC_RAW)cd-*/*.m4a  
MUSIC_UPDATED_SONGS=$(MUSIC_UPDATED)cd-*/*.m4a  

.PHONY: all clean

all: ocr update_metadata test

ocr: $(TEXT)
text/cd%.txt: get_song_titles.R pictures/cd%.png
	@echo "--- Get song titles with OCR ---"
	Rscript $<

update_metadata: $(MUSIC_UPDATED_SONGS)
$(MUSIC_UPDATED_SONGS): update_tag_id3.py $(MUSIC_RAW_SONGS) $(TEXT)
	@echo "--- Update metadata m4a files ---"
	find $(MUSIC_RAW) -type d -name "cd*" -exec cp {} $(MUSIC_UPDATED) -r \;
	python3 $<

test: 
	@echo "--- Test if output is as expected ---"
	Rscript -e "testthat::test_file('tests.R')"

clean:
	rm $(TEXT)
	rm $(MUSIC_UPDATED_SONGS)

