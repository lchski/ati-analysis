library(skimr)

## LAC requests!
requests %>%
  filter(owner_org == "lac-bac")

requests %>%
  mutate(request_response_time = year - request_year) %>%
  group_by(request_response_time) %>%
  skim(pages)

requests %>%
  filter(owner_org == "pco-bcp") %>%
  filter(year %in% c(2019, 2020)) %>%
  filter(request_year >= 2018) %>%
  filter(pages > 0) %>%
  select(year:summary_en, disposition, pages, request_year) %>%
  arrange(year, month) %>%
  filter(! str_detect(summary_en, regex("briefing", ignore_case = TRUE)))
