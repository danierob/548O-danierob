library(tidyverse)

#pull in data
fship <- read_csv(file.path("data", "The_Fellowship_Of_The_Ring.csv"))
ttow <- read_csv(file.path("data", "The_Two_Towers.csv"))
rking <- read_csv(file.path("data", "The_Return_Of_The_King.csv"))

lotr_untidy <- bind_rows(fship, ttow, rking)
str(lotr_untidy)

lotr_untidy

write_csv(lotr_untidy, "C:/Users/d/Desktop/UBC 2023/548O/548O-danierob/data/lotr_untidy.csv")

# gather() style. Back back in the day.
lotr_tidy <-
  gather(lotr_untidy, key = 'Gender', value = 'Words', Female, Male)
lotr_tidy

#pivot_longer(). Kind of lame but it still works.
lotr_tidy <-
  pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy, Gender)
lotr_tidy



