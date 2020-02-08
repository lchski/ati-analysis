library(tidyverse)

library(helpers)

requests <- read_csv("data/source/ati.csv") %>%
  mutate(request_year = str_extract(request_number, "(2[0-9]{3})-")) %>%
  mutate(request_year = as.integer(str_remove(request_year, "-"))) %>%
  mutate(request_year = case_when(
    request_year == 2100 ~ as.integer(2010),
    request_year == 2107 ~ as.integer(2017),
    request_year == 2108 ~ as.integer(2018),
    TRUE ~ request_year
  ))
