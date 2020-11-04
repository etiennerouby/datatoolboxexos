#####################################################
## Description : SCRIPT for make some ggplot
## with the panteria dataset
## Author : Etienne Rouby
#####################################################

# Packages loading
library(tidyverse)

# Dataset loading
pantheria <- readr::read_delim("data/pantheria-traits/PanTHERIA_1-0_WR05_Aug2008.txt", delim = "\t")

# Tidy the data

pantheria %>%
  mutate( # Conversion de type
    order = as_factor(MSW05_Order),
    family = as_factor(MSW05_Family)
  ) %>%
  janitor::clean_names() %>%
  rename(adult_body_mass_g = x5_1_adult_body_mass_g,
         dispersal_age_d = x7_1_dispersal_age_d,
         gestation_len_g = x9_1_gestation_len_d,
         home_range_indb_km2 = x22_2_home_range_indiv_km2,
         litters_per_year = x16_1_litters_per_year,
         max_longevity_m = x17_1_max_longevity_m
  ) %>%
  dplyr::select(msw05_order, msw05_family,
         adult_body_mass_g, dispersal_age_d,
         gestation_len_g, home_range_indb_km2,
         litters_per_year, max_longevity_m) %>%
  na_if(-999) -> pantheria

print(pantheria)

# Data Exploration

pantheria %>%
  count(msw05_order)

pantheria %>%
  count(msw05_family)

pantheria %>%
  group_by(msw05_family) %>%
  summarize(mean = mean(home_range_indb_km2, na.rm = TRUE),
            sd = sd(home_range_indb_km2, na.rm = TRUE),
            size = n())

# Plots 1

pantheria %>%
  group_by(msw05_family) %>%
  summarize(size = n()) %>%
  filter(size > 100) %>%
  ggplot(aes(x = "msw05_family", y = size)) +
  geom_bar()

