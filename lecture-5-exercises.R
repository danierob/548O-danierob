library(tidyverse)
library(nycflights13)

#13.5.1

#Filter flights to only show flights with planes that have flown at least 100 flights.
flights %>% group_by(tailnum) %>%
  summarize(abundance = n()) %>%
  filter(abundance >=100)

#What does anti_join(flights, airports, by = c("dest" = "faa")) tell you?
#What does anti_join(airports, flights, by = c("faa" = "dest")) tell you?

anti_join(flights, airports, by = c("dest" = "faa"))
# only returns observations from flights where there is no match in "faa" column of airports

anti_join(airports, flights, by = c("faa" = "dest"))
# only returns observations from airports where there is no match in "dest" column of flights

