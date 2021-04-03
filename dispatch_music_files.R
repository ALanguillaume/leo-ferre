
### Copy raw music file to new directory Léo Férré/ where metadata will be updated

list_cd_dirs = function(type) {
  dir(sprintf("music/%s/", type), pattern = "^cd-[1-4]$", full.names = TRUE)
}

# Define source and target directories
raw_music_files = lapply(list_cd_dirs("raw"),
                         function(dir) {
                           list.files(path = dir,
                                      pattern = "\\.m4a$",
                                      full.names = TRUE)
                         })
target_dirs = list_cd_dirs("updated")

# Copy files
purrr::walk2(raw_music_files, target_dirs,
             function(files, dir) {
               file.copy(from = files, to = dir)
             })
