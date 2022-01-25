# IndiaPIN_load.R
# This script is not run when executing the package. It is only used to create the dataset.

# Since some PIN codes have more than one offices, I will only consider the first office. 
# The goal here is to have each row as an identifier, each row corresponding to one single PIN code.
# Finally, also to remove the observations with missing values.

library(tidyverse)

IndiaPIN = utils::read.csv(here::here("data-raw", "pincode.csv")) %>% 
  as_tibble() %>% 
  group_by(Pincode) %>% 
  filter(row_number() == 1) %>% 
  rename(Circle = CircleName, Region = RegionName, 
         Division = DivisionName, Office = OfficeName, 
         PIN = Pincode, State = StateName) %>% 
  select(-OfficeType, -Delivery) %>% 
  mutate(Latitude = as.numeric(Latitude),
         Longitude = as.numeric(Longitude)) %>% 
  # Office has some non-ASCII characters. So converting them to ASCII to avoid CRAN warnings.
  mutate(Office = stringi::stri_trans_general(Office, "latin-ascii"))

# Removing areas with missing values
IndiaPIN = stats::na.omit(IndiaPIN)

usethis::use_data(IndiaPIN, overwrite = TRUE)
