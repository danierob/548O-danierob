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
select(shrubs, length)

#select data from site and experiment columns
select(shrubs, site, experiment)

#filter the data for all of the plants with heights greater than 5 and print out the result
filter(shrubs, height > 5)

#Create a new tibble or data.frame called shrub_data_w_vols that includes all
#of the original data and a new column containing the volumes, and display it.
shrub_data_w_vols <- mutate(shrubs, volume = length*width*height)

#BASIC AGGREGATION
#First, group the data frame.
group_by(surveys, species_id)

#assign to new df (looks the same but IT KNOWS its grouped )
surveys_by_species <- group_by(surveys, species_id)

#Use summarize() to calculate values for each group.
#Count the number of rows for each group (individuals in each species).
summarize(surveys_by_species, abundance = n())

#Can group by multiple columns
surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
summarize(surveys_by_species_plot, abundance = n())

#Find avg weight by species using summarize, remember this df is already grouped_by species
species_weight <- summarize(surveys_by_species, avg_weight = mean(weight))

#Oh shit, we got NAs cuz most species had NAs for weight somewhere along the way.
#add na.rm = TRUE argument to fix this
species_weight <- summarize(surveys_by_species,
                            avg_weight = mean(weight, na.rm = TRUE))

#Oh they got me again, now the NA's are NAN (not a number), now we will try na.omit()
#na.omit drops rows with NA or NaN in ANY COLUMN (often not desirable)
na.omit(species_weight)

#EXERCISE 2!

#In this exercise you will use the surveys data you downloaded above.
#For each of the 5 tasks below, start anew from the 'surveys' data.

#1. Use select() to create a new data frame with just the year, month, day,
#and species_id columns in that order.
surveys1 <- select(surveys, year, month, day, species_id)

#2. Use mutate(), select(), and na.omit() to create a new data frame with the
#year, species_id, and weight in kilograms of each individual, with no null weights.
#The weight in the table is given in grams so you will need to divide it by 1000.
surveys2 <- mutate(surveys2, kg = weight/1000)
surveys2 <- select(surveys2, year, species_id, kg)
surveys2 <- na.omit(surveys2)

#3. Use the filter() function to get all of the rows in the data frame for the species ID SH.
surveys3 <- filter(surveys, species_id == "SH")

#4. Use the group_by() and summarize() functions to get a count of the number of individuals in each species ID.
surveys4 <- group_by(surveys, species_id)
summarize(surveys4, abundance = n())

#5. Use the group_by() and summarize() functions to get a count of the number of
#individuals in each species ID in each year.
surveys5 <- group_by(surveys, species_id, year)
summarize(surveys5, abundance = n())

#6.Use the filter(), group_by(), and summarize() functions to get the mean mass of species DO in each year.
surveys6 <- filter(surveys, species_id == "DO")
surveys6 <- group_by(surveys6, year)
summarize(surveys6, mean_mass = mean(weight, na.rm=TRUE)) #na.rm = TRUE good idea here


#PIPING %>%
ds_weight_by_year <- surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))

#EXERCISE 3!

#1. Use mutate(), select(), and na.omit() to create a new data frame with the year,
#species_id, and weight in kilograms of each individual, with no null weights.
surveys3.1 <- surveys %>%
  mutate(kg = weight/1000) %>%
  select(year, species_id, kg) %>%
  na.omit()

#2. Use the filter() and select() to get the year, month, day, and species_id
#columns for all of the rows in the data frame where species_id is SH.
surveys3.2 <- surveys %>%
  filter(species_id == "SH") %>%
  select(year, month, day, species_id)

#3. Use the group_by() and summarize() functions to get a count of the number
#of individuals in each species ID.
surveys3.3 <- surveys %>%
  group_by(species_id) %>%
  summarize(abundance = n())

#4. Use the group_by() and summarize() functions to get a count of the number
#of individuals in each species ID in each year.
surveys3.4 <- surveys %>%
  group_by(year, species_id) %>%
  summarize(abundance = n())

#5. Use the filter(), group_by(), and summarize() functions to get the mean mass of species DO in each year.
surveys3.5 <- surveys %>%
  filter(species_id == "DO") %>%
  group_by(year) %>%
  summarize(mass = mean(weight, na.rm = TRUE))








