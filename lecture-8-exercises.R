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


#Can NEST conditionals inside of one another when things get thick
est_mass <- function(volume, veg_type, age){
  if (veg_type == "tree") {
    if (age < 5) {                       #here we nest age condition w/in veg_type "tree" condition
      mass <- 1.6 * volume^0.8
    } else {
      mass <- 2.65 * volume^0.9
    }
  } else if (veg_type == "grass" | veg_type == "shrub") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree", age = 2)
est_mass(1.6, "shrub", age = 5)

#Exercise 5

#1: Modify it to print the numbers 2 through 16.
for (i in 2:16){
  print(i)
}


#2: Modify it to print each of these numbers multiplied by 3.
for (i in 1:5){
  print(i*3)
}

#3:  Complete the code below so that it prints out the name of each bird one line at a time.
birds <- c('robin', 'woodpecker', 'blue jay', 'sparrow')
for (i in 1:length(birds)) {
  print(birds[i])
}

#4: Complete the code below so that it stores one area for each radius.
radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = 3)    #use mode to specify vector type
for (i in 1:length(radius)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

#5. Complete the code below to calculate an area for each pair of lengths and widths,
# store the areas in a vector, and after they are all calculated print them out:

lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- vector(length = 3)
for (i in 1:3) {
  areas[i] <- lengths[i] * widths[i]
}
areas

#can either specify known vector length or just tell it to be the same length as other vector
lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- vector(length = length(lengths))
for (i in 1:length(lengths)) {
  areas[i] <- lengths[i] * widths[i]
}
areas
