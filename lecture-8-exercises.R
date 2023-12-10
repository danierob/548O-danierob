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
