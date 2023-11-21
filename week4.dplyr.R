library(tidyverse)

#load data that we downloaded from github into R
surveys <- read_csv("data/surveys.csv")

#select a subset of columns select(df, comun 1, column 2, ....)
select(surveys, year, month, day)

#use filter to get only the rows that meet criteria filter(df, column == "criteria")
filter(surveys, species_id == "DS")

#add new columns with calculated values with mutate()
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

#overwrite surveys with new mutated column
surveys <- mutate(surveys,
                  hindfoot_length_cm = hindfoot_length / 10)

#EXCERCISE 1: SHRUBS!

#bring in the data
shrubs <- read_csv("data/shrub-volume-data.csv")

#check out column names (base R)
names(shrubs)

#check out structure
str(shrubs)

#select data from the length column

