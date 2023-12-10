#LECTURE 8

w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

#Exercise 1:
#1: w is greater than 10
w > 10

#2: "green" is in colors
"green" %in% colors

#3: x is greater than y
x > y

#4: Each value in masses is greater than 40.
masses > 40

#Exercise 2:

age_class = "sapling"
if (age_class == "sapling"){
  y <- 10
}
y

#Exercise 3:
#else if checks code conditions sequentially until one is met (TRUE)
age_class <- "seedling"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
}
y

age_class <- "adult"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
} else {
  y <- 0
}
y


#explaining the sequential check of 'else if' vs just plain old 'if'
#this code returns two answers
x <- 5
if (x > 2){
  x * 2
}
if (x > 4){
  x * 4
}

#this code returns only the first
x <- 5
if (x > 2){
  x * 2
} else if (x > 4){
  x * 4
}

#wrapping conditionals within a function
est_mass <- function(volume, veg_type){
  if (veg_type == "tree") {
    mass <- 2.65 * volume^0.9
  } else if (veg_type == "grass") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree")
est_mass(1.6, "grass")
est_mass(1.6, "shrub")

#Exercise 4: dino mass = a*length^b
get_mass_from_length_by_name <- function(length, name){
  if (name == "stegosaura") {
    mass <- 10.95*length^2.64
  } else if (name == "theropoda") {
    mass <- .73*length^3.63
  } else if (name == "sauropoda") {
    mass <- 214.44*length^1.46
  } else {
    mass <- NA
  }
  return(mass)
}

#A Stegosauria that is 10 meters long:
get_mass_from_length_by_name(10, "stegosaura")

#A Theropoda that is 8 meters long.
get_mass_from_length_by_name(8, "theropoda")

#A Sauropoda that is 12 meters long.
get_mass_from_length_by_name(12, "sauropoda")

#A Ankylosauria that is 13 meters long.
get_mass_from_length_by_name(13, "ankylosauria")
