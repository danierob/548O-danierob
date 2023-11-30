#LECTURE 7 ----
#Making Functions
function_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)
}

#shrub vol example
calc_shrub_vol <- function(length, width, height) {
  volume <- length * width * height
  return(volume)
}

shrub_vol <- calc_shrub_vol(0.8, 1.6, 2.0)

#Exercise 1----

lb_to_g <- function(pounds) {
  grams <- pounds*453.592
  return(grams)
}

(hedgehog_weight <- lb_to_g(3.75))

#Exercise 2----

#this function determines mass (kg) from length (m) of dino skeleton
#a=.73 and b=3.63 are parameter constants for therapoda
lng_to_m_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

#16m long spinosaurus mass
(spino_dino <- lng_to_m_theropoda(16))


#making the code more robust by adding a and b params to get_mass_from_length()
#rather than defining them as specific numbers that ony apply to one dino type
get_mass_from_length <- function(a, length, b){
  mass <- a * length ^ b
  return(mass)
}

#use new function to find sauropoda mass, given a = 214.44, b = 1.46, and length is 26 m long
(sauro_dino_mass <- get_mass_from_length(214.44, 26, 1.46))


#Defaults example----
calc_shrub_vol <- function(length = 1, width = 1, height = 1) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol()
calc_shrub_vol(width = 2)
calc_shrub_vol(0.8, 1.6, 2.0)
calc_shrub_vol(height = 2.0, length = 0.8, width = 1.6)

#Exercise 3----
#Set default values for a and b of a = 39.9 and b = 2.6
get_mass_from_length <- function(a = 39.9, length, b = 2.6){
  mass <- a * length ^ b
  return(mass)
}

#Use this function to estimate the mass of a Sauropoda (a = 214.44, b = 1.46)
#that is 22 m long (by setting a and b when calling the function).
get_mass_from_length(214.44, 22, 1.46)

#Use this function to estimate the mass of a dinosaur from an unknown taxonomic
#group that is 16m long (by not setting a and b so that the default values are used).
get_mass_from_length(length = 16)

#Combining functions----

#multiple functions in a row style
est_shrub_mass <- function(volume){
mass <- 2.65 * volume^0.9
}

shrub_volume <- calc_shrub_vol(0.8, 1.6, 2.0)
shrub_mass <- est_shrub_mass(shrub_volume)

#pipe style %>%
library(dplyr)
shrub_mass <- calc_shrub_vol(0.8, 1.6, 2.0) %>%
  est_shrub_mass()

#Exercise 4----
#kg to lb (1:2.205)
kg_to_lb <- function(kg){
  lbs <- kg/2.205
  return(lbs)
}

#12 m long Stegosaurus in pounds. a has been estimated as 10.95 and b has been estimated as 2.64
get_mass_from_length(10.95,12,2.64) %>%
  kg_to_lb()
#tiny stego




