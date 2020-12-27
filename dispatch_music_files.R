

list_cd_dirs = function(type) {
  dir(sprintf("music/%s/", type), pattern = "^cd-[1-4]$", full.names = TRUE)
}

raw_music_files = lapply(list_cd_dirs("raw"),
                         function(dir) {
                           list.files(path = dir,
                                      pattern = "\\.m4a$",
                                      full.names = TRUE)
                         })
target_dirs = list_cd_dirs("Léo Férré")

purrr::walk2(raw_music_files, target_dirs,
             function(files, dir) {
               file.copy(from = files, to = dir)
             })


# orginal_names = list.files(target_dirs[[2]], pattern = "\\.m4a$")
# new_names = sub("(^\\d{2}).+(\\.m4a)", "\\1_cd1\\2", music_files)
# file.rename(from = file.path("music/Léo Férré/cd-1/", orginal_names),
#             to = file.path("music/Léo Férré/cd-1/", new_names))
