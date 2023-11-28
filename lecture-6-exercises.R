library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)

grep('\'', levels(gDat$country), value = TRUE)

print("a\nb")
cat("a\nb")


#QUANTIFIERS
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


#OPERATORS
(strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12"))
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)
gsub("(ab) 12", "\\1 34", strings)



#Exercise 3: Write code to find countries in Gapminder with letter i or t, and ends with
#land, and replace land with LAND using backreference.
#Hint: you may want to do this in 3 steps (i.e., this may not all need to be
#achieved in a single line of code). If your final list includes Poland, something went wrong! If your final list does not include Finland, something went wrong!

it <- grep("[it]", levels(gDat$country), value = TRUE, ignore.case = TRUE)
land <- grep("land$", it, value = TRUE)
gsub("land", "\\1LAND", land)



#fixed() takes string literally
(strings <- c("Axbc", "A.bc"))
pattern <- "A.b"
grep(pattern, strings, value = TRUE)
grep(pattern, strings, value = TRUE, fixed = TRUE)

#messing with uppercase/lowercase
pattern <- "a.b"
grep(pattern, strings, value = TRUE)
grep(pattern, strings, value = TRUE, ignore.case = TRUE)


#Exercise 4: Find continents in Gapminder with letter o in it.
#Hint: there should be two continents!
grep("o", levels(gDat$continent), value = TRUE, ignore.case = TRUE)




