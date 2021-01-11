import os
import mutagen

def read_songs(cd_number):
  m4a_files = os.listdir(f'music/Léo Férré/cd-{cd_number}/')
  m4a_files.sort()
  song_names = open(f'text/cd{cd_number}.txt', 'r').read().split('\n')
  songs = dict(zip(m4a_files, song_names))
  return songs

def update_songs_metadata(cd_number):
  songs = read_songs(cd_number)
  for file, name in songs.items():
    path_file = os.path.join(f'music/Léo Férré/cd-{cd_number}/', file)
    file = mutagen.File(path_file)
    file['©nam'] = name
    file['©ART'] = 'Léo Férré'
    file['©alb'] = 'Anthologie'
    file.save()
    os.rename(path_file, f'music/Léo Férré/cd-{cd_number}/{name}_cd{cd_number}.m4a')
    
    
cd_numbers= [1, 2, 3, 4]
for cd in cd_numbers:
  update_songs_metadata(cd)

  
  
  



