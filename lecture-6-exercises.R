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

#exercise 1 : Write a line of code to find all countries with ee in Gapminder
#using quantifiers. Add, commit, and push.
grep('ee', levels(gDat$country), value = TRUE)

