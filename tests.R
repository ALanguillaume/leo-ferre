
library(testthat)

test_that("All updated .m4a file are as expected", {

  updated_m4a_files <- sort(
    list.files(
      path = "music/updated/",
      recursive = TRUE,
      full.names = TRUE
    )
  )
  hash_updated_m4a_files <- tools::md5sum(updated_m4a_files)
  names(hash_updated_m4a_files) <- basename(updated_m4a_files)

  expected_hashes <- c(
    # md5sums ----
    `Ca S'lève À L'est_cd1.m4a` = "c1d1ca0c8e2e310c5136faf4b3bc371c",
    `Comme À Ostende_cd1.m4a` = "05814c88408af544ebc9413e3780dc57",
    `Est-Ce Ainsi Que Les Hommes Vivent ?_cd1.m4a` = "9e5fa7f63553d5008f0e15b930fab00b",
    `Jolie Môme_cd1.m4a` = "63a019ea1d21080c3abab00aadc49bc2",
    Judas_cd1.m4a = "2b36eb3a346dff73e669f697ec9126a9",
    `L'âme Du Rouquin_cd1.m4a` = "980dc1a623583b06150b236c6b4280c2",
    `L'inconnue De Londres_cd1.m4a` = "3b0ef38a0e182fb06bcb4793b2aea05c",
    `La Chanson Du Scaphandrier_cd1.m4a` = "6b76e4f381737ca50a6ffe86f09765dc",
    `La Seine_cd1.m4a` = "a405633b652fd51a9070a5ffefe67f08",
    `La Vie D'artiste_cd1.m4a` = "220433b953d79369ca08a688a2f9a1ed",
    `Le Fleuve Aux Amants_cd1.m4a` = "38df3b29fd09eb93f9f6aa41274092ca",
    `Le Parvenu_cd1.m4a` = "b7c9899261ad2178410baa626429e466",
    `Le Temps Du Tango_cd1.m4a` = "8bf83d63403fa92adec230c477ecb61b",
    `Les Copains De La Neuille_cd1.m4a` = "a1587398dcbcd71bff5b9affd94a6677",
    `Les Parisiens_cd1.m4a` = "2ec7f09d165828a4110ba50bf0a73b85",
    `Les Yeux d'Elsa_cd1.m4a` = "0885b41028641c117085592d488a82e9",
    `Mister Giorgina_cd1.m4a` = "d5d85a32d3e85fcb938f1f18bff34f33",
    `Mon Sebasto_cd1.m4a` = "cdff9dfa83ede3b0a102dd11cb191af4",
    `Monsieur Mon Passé_cd1.m4a` = "533567d7d212833caa19d89964e60884",
    `Quand C'est Fini, Ça Recommence_cd1.m4a` = "82c193249baebd9c21272cd7eb68895e",
    `Ca T'va_cd2.m4a` = "2f75f086a3f3a6fe4a10b4d6cf6816eb",
    `Dieu Est Nègre_cd2.m4a` = "8080afabbf47cca1442320ccde7eb25e",
    `Graine D'ananar_cd2.m4a` = "5390af045b98d9011743b9800b15b268",
    `Java Partout_cd2.m4a` = "60122d1664d05b5729a7eefca4c7d90d",
    `L'Amour_cd2.m4a` = "d3ed7b5cc2b777f481ef774199563bfb",
    `L'esprit De Famille_cd2.m4a` = "1ce7ca80554305ebd13669b6d2d2ce3a",
    `La Langue Française_cd2.m4a` = "8690ecd49fd5acb310063bbf4c26bf22",
    `La Vie Moderne_cd2.m4a` = "7529591975af231f18734cff45410bbe",
    `Le Guinche_cd2.m4a` = "0ed66939c1a546996ccb868414fb4501",
    `Le Piano Du Pauvre_cd2.m4a` = "959af85b21adb11778595be9db0336f8",
    `Les 400 Coups_cd2.m4a` = "4990c0ac3c5aaa947966c0fb0f4a3058",
    `Les Forains_cd2.m4a` = "9541da9f42e303daca8c05971a2e65ca",
    `Les Poètes_cd2.m4a` = "a3ce52502821577233140fca6aaa6d0e",
    `Les Tziganes_cd2.m4a` = "4529cb5575003b09ee9d907cae20a995",
    `Mon Camarade_cd2.m4a` = "4b4af8234a716c17d29bf6f94f70c616",
    `Monsieur Tout-Blanc_cd2.m4a` = "a2a475735d7b951a129fb3a7449421ae",
    `Notre-Dame De La Mouise_cd2.m4a` = "4cc5f3f0d58893d901173f281b0db805",
    Paname_cd2.m4a = "7b12dfcf224eb3eefcec0a6fc92cac65",
    `Regardez-Les_cd2.m4a` = "59e65df3fa4cef76775cafa7286b31b9",
    `Saint-Germain-Des-Prés_cd2.m4a` = "086e3647ff99f3671f1673027ca6eed6",
    Barbarie_cd3.m4a = "6141959c9eab1e8244c34586d08751c6",
    `En Amour_cd3.m4a` = "5073774831fb065b498c93af72958efe",
    `Je Chante Pour Passer Le Temps_cd3.m4a` = "a49942152fabf7cf69370e086dc25eeb",
    `L'étang Chimérique_cd3.m4a` = "7e4412f614126fe4b2874f8bfd583c28",
    `La Chambre_cd3.m4a` = "2c36e1a3a70bec52784c0c7cf519ddb7",
    `La Maffia_cd3.m4a` = "16e2a80ec924faa91473878db6d6ab92",
    `La Rue_cd3.m4a` = "7e705f84d7d21bbc6235e970c94db57b",
    `La Vie_cd3.m4a` = "35ddab51f961b4c26eed62186afb152e",
    `La Vieille Pélerine_cd3.m4a` = "56571c9936621e61080ebb8510117ff8",
    `Le Bateau Espagnol_cd3.m4a` = "7d80513fffb5efe348b6e2006f22484b",
    `Le Jazz Band_cd3.m4a` = "d98b7378231d2043c21e9d1591e5c8c8",
    `Le Pont Mirabeau_cd3.m4a` = "901c75083d2ff634da26f36e9d6762d9",
    `Les Bonnes Manières_cd3.m4a` = "745360a40fab56e577b63fb3431d199d",
    `Les Grandes Vacances_cd3.m4a` = "6c36e4ad6ad52ae691982b88b47dab57",
    `Les Rupins_cd3.m4a` = "125337658ebb675b79e2c19201b2b4e6",
    `Martha La Mule_cd3.m4a` = "de93e4490dd4821c78b9c5ca8cfbe3b4",
    `Mon Général_cd3.m4a` = "6c7105e97b9c3f2a19310f5419d5eb84",
    `Monsieur William_cd3.m4a` = "5cf231c023c4d76178350432e3f0cd78",
    `Paris Canaille_cd3.m4a` = "803188c01840e3e84ddc84fff642c326",
    Tahiti_cd3.m4a = "5d3ae63ff1dc28a4e04dc10d505562a0",
    `Brumes Et Pluies_cd4.m4a` = "bc2341a726a6f22e01fceb7c6888d93a",
    `Chanson Mecanisée_cd4.m4a` = "c2b8cf8d74a2ae27bbc2fa363c552e64",
    `E.P. Love_cd4.m4a` = "49d7e825f11294b6b99805e5c809cefa",
    `Harmonie Du Soir_cd4.m4a` = "9706d399ccfcaf41f92c5c7eeba6f687",
    `L'affiche Rouge_cd4.m4a` = "90ed9662fa9ac9e3495fdcdbf0523a3f",
    `L'Île Saint-Louis_cd4.m4a` = "f0e618c93bd9bf936a85b83c22673c6c",
    `L'invitation Au Voyage_cd4.m4a` = "5b7c60e379b2db83d5e46a0c648903b9",
    `La Mort Des Amants_cd4.m4a` = "3716f2c6ec4b9c23a2cdc9c5982df4dd",
    `La Pipe_cd4.m4a` = "a41cf7e4c56072ad5b351ddd4a931e17",
    `La Vie Antérieure_cd4.m4a` = "5955ef5eaee24ad6c20434dbd31aca48",
    `Le Flamenco De Paris_cd4.m4a` = "88495ba97559fa70f3357025c8a01119",
    `Le Léthé_cd4.m4a` = "c5fe25e6543861f190cff4a9a824eb26",
    `Le Revenant_cd4.m4a` = "8a8c4a2a9fd8e451e3e301a39840973e",
    `Les Cloches De Notre-Dame_cd4.m4a` = "a5fc214a0baf4d5c3f75882f6b7df8e3",
    `Les Métamorphoses Du Vampire_cd4.m4a` = "adcb4426604b8c569f0a171c39169352",
    `Les Temps Difficiles_cd4.m4a` = "a6c084b147ba9efee988ff66f9f35ddf",
    `Merde À Vauban_cd4.m4a` = "627d85d0191286661ffb179b96bf84b7",
    `Notre Amour_cd4.m4a` = "649c1ee22cb2cbf137b3bca5b293f56f",
    `Pauvre Rutebeuf_cd4.m4a` = "3563de107c81c44acc219527ec002381",
    `T'es Chouette_cd4.m4a` = "10d3e6466be47e06860c4bbed6963227"
  )
  # ----

  expect_equal(
    hash_updated_m4a_files,
    expected_hashes
  )

})
