## Class 2

#### Basic of R ######

# The four quadrants

# How to get help when you need it 

?msleep
?mean # Function
?median
?range

?ChickWeight # Data set
?mtcars

# Working directory
getwd()
setwd("/Users/taky/Desktop/Statistical Programming with R")

# Writing code in a script
# how to save script

# Objects and functions
10 + 60
pi
sqrt(pi)

a <- 50
b <- 60
a
b

a + b
print(a+b)

x <- "5"
y <- "6"

x
y
x + y

sum(a+b)

ages <- c(5,6, 7) # concatanation for joining
ages
sum(ages)

names <- c('Mahd', 'Aariz', 'Shan')


friends <- data.frame(names, ages) # create a dataframe
View (friends)
view(friends)

str(friends)

class(names)
class (ages)
glimpse(friends)

#dataset_name$var_name

friends$names # to look into a particular  variable in df
friends$ages # here , we are trying to see the var ages in the dataset friends

# row , col
View(friends)

friends [3,3]# [row, col], Remember RC cola

friends[1, ]
friends [ ,1]


# Built in data sets to practice with

data() # all the dataset in R

View(pressure)
View(HairEyeColor)
?HairEyeColor
View(Orange) # View(name_of_the_dataset)


# Installing and Using Packages

#install.packages("packages_name")

# install.packages("tidyverse") # run once. when you are done, next time comment out the code , so that it wont be installed again

library (tidyverse) # tidyverse is a collection of packages
