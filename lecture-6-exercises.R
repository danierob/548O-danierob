library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)

grep('\'', levels(gDat$country), value = TRUE)

print("a\nb")
cat("a\nb")

(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))
grep("ac*b", strings, value = TRUE)
grep("ac+b", strings, value = TRUE)
grep("ac?b", strings, value = TRUE)
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)

#Exercise 1 : Write a line of code to find all countries with ee in Gapminder
#using quantifiers. Add, commit, and push.
grep('ee', levels(gDat$country), value = TRUE)

#Exercise 2 :Write code to find all .R files in the main folder of your repository.
#Hint: use dir() to get a vector of all filenames, and make sure your .Rproj file is not included!
grep('.R$', dir("C:/Users/d/Desktop/UBC 2023/548O/548O-danierob"), value = TRUE)

#
