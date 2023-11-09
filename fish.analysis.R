#this code brings in gaeta_etal csv as df named "fish_data"
fish_data = read.csv("Gaeta_etal_CLC_data.csv")
head(fish_data)

library(dplyr)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 200, "big", "small"))

fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))
