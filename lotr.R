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

write_csv(lotr_tidy, "C:/Users/d/Desktop/UBC 2023/548O/548O-danierob/data/lotr_tidy.csv")

#pivot_longer(). Kind of lame but it still works.
lotr_tidy <-
  pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy, Gender)
lotr_tidy

# DO IT AGAIN!
#bringing in the male and female dfs
male <- read_csv(file.path("data", "Male.csv"))
female <- read_csv(file.path("data", "Female.csv"))

lotr_untidy <- bind_rows(male, female)
str(lotr_untidy)

lotr_untidy

lotr_tidy <-
  pivot_longer(lotr_untidy, cols=c(Elf, Hobbit, Man), names_to = 'Race', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy, Gender)
lotr_tidy

#Counting words spoken by each race over all movies
# 1) using the untidy dfs
  sum(lotr_untidy$Elf)
  sum(lotr_untidy$Man)
  sum(lotr_untidy$Hobbit)

# 2) using tidy dfs
words_by_race <- lotr_tidy %>%
    group_by(Race) %>%
    summarize(Words = sum(Words))

# Number two is definitely cleaner


# Making it Messy: untidying data
lotr_tidy <- read_csv(file.path("data", "lotr_tidy.csv"))

lotr_tidy

## practicing with spread: let's get one variable per Race
lotr_tidy %>%
  spread(key = Race, value = Words)

## practicing with spread: let's get one variable per Gender
lotr_tidy %>%
  spread(key = Gender, value = Words)

## practicing with spread ... and unite: let's get one variable per combo of Race and Gender
lotr_tidy %>%
  unite(Race_Gender, Race, Gender) %>%
  spread(key = Race_Gender, value = Words)




