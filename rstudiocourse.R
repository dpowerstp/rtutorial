

# data types ----

## atomic vectors ----

# atomic vector of length one
avec_1 <- "a"

# atomic vector of length 4
avec_2 <- c("a", "b", "c", "d")

# numeric vector of length 3
avec_num <- c(12, 5153, 5)

# can't mix data types with atomic vectors, and this mixes character and numeric, but R converts it to type character
avec_error <- c("a", "b", 12)
avec_error

# to see length of vector - use length function
length(avec_error)

# to see what is in a given position in the vector - can access it by indexing that position
# this checks what's in the second position in the numeric vector
avec_num[2]

# can index for multiple values
avec_num[2:3]

avec_num[c(1, 3)]

# can also use this to overwrite a value in a vector, or add a value to a vector
# this sets the second value in avec_num object to 20
avec_num[2] <- 20

# this adds a new value to avec_num of 100
avec_num[4] <- 100

avec_num

# can also add new values to vectors or combine vectors by using c() function (concatenate)
# adds new value to avec num)
avec_num <- c(avec_num, 1224)

# adds new values to avec_2
c(avec_2, c("cats", "dogs", "fish"))

# combines two named vectors
avec_combo <- c(avec_2, avec_1)

# to see information on objects - str() function
str(avec_num)

# can have names for atomic vectors - and then filter/access them by their names
avec_name <- c("Dan" = 100, "Samantha" = 50)
avec_name["Dan"]

# look at the names
base::names(avec_name)

# what naming does behind the scenes - is add a 'names' attribute to the numeric vector c(100, 50)
base::str(avec_name)
base::attributes(avec_name)

# can also have atomic vectors of logical types
c(T, F, T, F)

# can convert vectors to different types - but r will return na if doesn't work, and return warnings
base::as.numeric(c(T, F, T, F))

base::as.numeric(c("12", "123cat", "0"))

base::as.character(c(12, 3144, 12))


### atomic vector tasks ----

# TASK: write a 5 element character vector of your favorite animals and 3 element numeric vector, and assign each to objects

# TASK: divide each element in the numeric vector by 3, and convert the numeric vector to a character vector

# TASK: combine the original character vector with the new character vector

# TASK: subset the final vector to the middle 3 elements

# TASK: convert the final character vector to a numeric vector


## factors ----

### instructions ----

# create factor using factor function 
factorqual <- factor(x = c("Poor", "Poor", "Medium", "Great"))

# see "levels" listed below a, showing acceptable values
factorqual

# trying to add a new value to the factor-type vector a returns a warning in the console, and produces an NA results
factorqual[5] <- "Superb"

factorqual

# but medium is an acceptable value
factorqual[6] <- "Medium"

factorqual

# underlying value of factors - an integer reflecting the order of the level assigned to the factor
as.numeric(factorqual)

# can use levels parameter of factor function to define rank-order of values - here, highest to lowest rank
factorfancy <- factor(x = c("Corporal", "General", "Corporal",  "Private", "Private"), levels = c("General", "Corporal", "Private"))
factorfancy

## lists - behave similarly to vectors - but allow elements of different types, and nesting - ----
testlist <- list(12, 124, alpha = "cats", c(50, 120, 140), list("dog" = "rudolph", "cat" = c("potato", "fred")))

testlist
str(testlist)

# can similarly index to access different levels of the list
# single bracket - preserves the list structure
singlelist <- testlist[1]

singlelist
str(singlelist)

# double brackets - removes overlying list structure
singlevec <- testlist[[4]]
singlevec

# shows basic structure of list
str(testlist)

# because lists can contain lists and vectors - you can index multiple times
# accesses 1st two elements of fourth item in list
testlist[[4]][1:2]

# accesses second item of nested list
testlist[[5]][["cat"]][2]

# can also use dollar sign indicator to access named list items
testlist$alpha

##### function parameters ########## 
# na.rm is a parameter of sum, which tells R whether to remove missing values
base::sum(c(1, 12, 123, NA), na.rm = T)

# if false, R returns missing
base::sum(c(1, 12, 123, NA), na.rm = F)

# and if you hit tab at the start of sum, you'll see a ... as the first parameter - usually this allows you to enter extra optional parameters,and in this case any number of objects to sum - e.g.,
base::sum(1, 12, c(123123, 12, 12))

### vectorized functions ----

# most functions in R are vectorized, which means they operate similarly on objects of length 1 
numvec_one <- 1
numvec_multi <- c(1, 2, 3, 4, 5)

numvec_one + 12

# adds 12 to each element of vector - don't need to loop through
numvec_multi + 12

# be careful missing values
base::ifelse(NaN, "a", "b")

## dataframes ----

# special type of list made up of equal length, named vectors
yardsale_prices <- base::data.frame(
  "objects" = c("pencils", "painting", "bike", "pencils", "dog"),
  "condition" = base::factor(c("ok", "good", "poor", "good", "good"), levels = c("poor", "ok", "good")),
  "cost" = c(12, 50, 122, 15, 1000),
  is_haggleable = c(T, F, T, F, T)
)

yardsale_prices

# check number of rows
base::nrow(yardsale_prices)

# important to note - length() returns number of columns, not rows - similar to list
base::length(yardsale_prices)

# shows column names
base::names(yardsale_prices)

# can index with - dataframe[rownumbers, column numbers]
# first rows
yardsale_prices[1, ]

# second column
yardsale_prices[ , 2]

# rows 2:3, columns 2, 4
yardsale_prices[2:3, c(2, 4)]

# can pull column vectors out of dataframe - by name, or index
yardsale_prices$condition

yardsale_prices[["cost"]]

# can pull out and treat as normal vector
yardsale_prices$cost / 2

# can filter dataframe by combining logical statements with indices
condition_good <- yardsale_prices[["condition"]] == "good"
condition_good

# can then plug into index
yardsale_prices[condition_good, ]

# or can combine into one - identical to above
yardsale_prices[yardsale_prices$condition == "good", ]


# conditionality ----

# can use if and else statements to define certain conditions - esp useful in functions, but can also be useful to set error conditions for your script

# here we have a numeric seqeunce - but it's a character string - so  
numericsequence <- c("1", "12", "55")



## reading in datasets ----

# you can read in dataframes with functions that vary by the file type

# but first it's good to know how directory paths work in r
# the dir function tells you the files in a directory
# base::path.expand - tells you the path of the directory you're looking at
# a tilda at the start of a directory reference - is a shortcut for what R recognizes as your home directory - for me, that's C:/Users/DanielP/Documents
base::path.expand("~")

# but it's not great to use this to refer to paths - because even if we're using a shared drive like dropbox or google drive, my home path might be different from someone else's so someone else reusing the same code might get different results - which defeats goals of reproducability
# a period at the start of a directory reference - refers to your working directory in your current r session
base::dir(".")

# if you're not working in a project - by default, it'll be the directory the script is located in - you can change it with base::setwd() but you shouldn't, because that will also vary by computer 
# better - is to organize your work in projects - so the wd is the project directory (you can also adjust this in tools --> Project Options)

# utils::read.csv - reads in comma-separated files
# these are the same path for me - but likely vary for you
utils::read.csv("./data/zip_fields.csv")

# can also download directly from urls
construction <- utils::read.csv("./data/Contracts.csv")

construction <- utils::read.csv("https://data.montgomerycountymd.gov/api/views/vmu2-pnrc/rows.csv?accessType=DOWNLOAD")

# read - mc demolitions data - https://data.montgomerycountymd.gov/Licenses-Permits/Demolition-Permits/b6ht-fw3x
demolitions <- read.csv("https://data.montgomerycountymd.gov/api/views/b6ht-fw3x/rows.csv?accessType=DOWNLOAD")
demolitions <- read.csv("./data/Demolition_Permits (1).csv")



# data manipulation with dplyr ----

library(tidyverse)

# the tidyverse set of packages is especially useful for data manipulation in R - and dplyr especially especially
# it offers an intuitive set of functions and format for data processing and analysis

