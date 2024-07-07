########################
###### Class 3#########
########################


## How share code efficiently###



# %>% pipe operator , Shift+ crtl+ M [ shift +ctrl+M]


View(starwars)

starwars$height
glimpse(starwars)

### Mutate to create a new var

View(starwars)

starwars %>%  
    filter (height > 150 & mass < 200) %>%
    # filter is only for observation, that means it will operate rowwise
    mutate (height_in_meters = height/100) %>% # mutate is for changing a variable. We can overwrite a var or can create a new var
    select(height_in_meters, mass)  %>%
    arrange(mass) %>% # select actually gives in your data, which  var you are selecting
    View()


### Mutate to overwrite a old var

starwars %>%
    filter(height > 150 & mass < 200) %>%
    mutate(height = height / 100) %>% # overwrite the existing height variable
    select(height, mass) %>% # select the modified height and mass
    View()


### Mutate to overwrite a new var but I want to keep that var as the first col

starwars %>%
    filter(height > 150 & mass < 200) %>%
    mutate(height_in_m = height / 100) %>% # overwrite the existing height variable
    select(height_in_m, everything()) %>%
    View()


##### Explore Your Data

# Data structure and types of variables

view(msleep)

glimpse (msleep) #quick overview of data
head (msleep)


class(msleep$vore)
class(msleep$name)
class(msleep$sleep_total)

length(msleep) # how many col
length (msleep$name) # how many observation / row it has


# Names of variable
names <- c("Aariz", "Shan", "Mahd")

?names

names(msleep) # gives all the variable names

# Unique categories

unique(msleep)
unique(msleep$vore)

# what is NA? missing data 

# missing data
View(msleep)
no_missing <- complete.cases(msleep)
no_missing

# == # equal
# != # NOt equal

missing <- !complete.cases(msleep)  # gives row which  has at least one missing value. ! does the opposite
missing

View(msleep[ , ]) # complete data set

View(msleep[missing, ]) # so we are including only those missing values

View(msleep[ no_missing, ])

View(msleep[ no_missing, 1:7 ])


