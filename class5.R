### Class 5 #####

###### Continued.....###
### Cleaning Data #####

# filter row

View(starwars)

starwars %>%  # Filter row or observation
    select(mass,sex) %>% 
    filter(mass <55 &
               sex == "male") %>% 
    View() # also demonstrate !=

# re-code data
View(starwars)
starwars$sex
# lets see what the input looks like for var sex
starwars %>% 
    select(sex) %>% 
    mutate (sex = recode(sex,
                         "male" = "man",
                         "female" = "woman" )) %>% 
    View()

# dealing with missing data

starwars$height

mean(starwars$height) # this is also including NA values
mean(starwars$height, na.rm = TRUE) # so remove the NA values from the calculation
mean(starwars$height, na.rm = FALSE)

# dealing with duplicated
Names <- c("Messi", "Ronaldo", "Neymar", "Ronaldo")
Ages <- c(22, 33, 44, 33)

friends <- data.frame(Names,Ages)
friends

friends %>% 
    distinct() %>% 
    View() # to see the unique observation

distinct(friends)

################################
#### Manipulate your Data ######


# Create or change a variable ( using mutate)
View(starwars)
?starwars

starwars %>% 
    mutate(height_m = height/100, height_feet = height * 0.0328084) %>%
    # this is creating two more cols
    select(name, height, height_m, height_feet) %>% 
    head() # tail to see the last part of dataset

# Conditional change ( if_else)

starwars %>% 
    mutate ( height_m = height/100) %>% 
    select(name, height, height_m) %>% 
    mutate ( tallness=
                 if_else(height_m > 1, "tall", "short")) %>% 
    View()


starwars %>%  # alternative code but return the same output
    mutate ( height_m = height/100) %>% 
    select(name, height, height_m) %>% 
    mutate ( tallness=
                 if_else(height_m < 1, "short", "tall")) %>% 
    View()


# reshape data with Pivot wider 

# install.packages("gapminder")
library(gapminder)

View(gapminder) # it has the data-set called gapminder as well
names(gapminder)
glimpse(gapminder)

data <- select (gapminder, country, year, lifeExp)
data
View(data) # For every country, different lifeExp for different years



wide_data <- data %>% # So we want (for every country) col for every year which will
    # will show lifeExp for that year
    pivot_wider(names_from = year, values_from = lifeExp)
View(wide_data)


# reshape data with pivot longer
long_data <- wide_data %>% 
    pivot_longer(2:13, 
                 names_to = "year",
                 values_to = "lifeExp")
View(long_data)




#############################
#### Describe your Data #####
#############################
View(msleep)

# Range / spread

min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake) #Interquartile range

# Centarlity
mean(msleep$awake)
median(msleep$awake)

# variance
var(msleep$awake)

# Summarize your data

summary(msleep)
names(msleep)
summary(msleep$awake) # why we can see summary for awake not for genus?
class(msleep$awake)

msleep$vore
summary(msleep$vore)
class(msleep$vore)


msleep %>%  # we can also do summary for multiple var at a time
    select( awake, sleep_total) %>% 
    summary()
