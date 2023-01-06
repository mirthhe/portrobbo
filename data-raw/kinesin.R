## code to prepare `kinesin` dataset
kinesin <- readLines("data-raw/3cob.pdb")
usethis::use_data(kinesin, overwrite = TRUE)
