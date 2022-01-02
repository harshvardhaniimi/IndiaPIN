## code to prepare IndiaPIN dataset goes here

IndiaPIN <- utils::read.csv(here::here("data-raw", "pincode.csv"))

usethis::use_data(IndiaPIN, overwrite = TRUE)
