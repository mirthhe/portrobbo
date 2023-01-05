## code to prepare `covid19` dataset
covid19 <- read.csv("https://opendata.ecdc.europa.eu/covid19/nationalcasedeath_eueea_daily_ei/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
usethis::use_data(covid19, overwrite = TRUE)
