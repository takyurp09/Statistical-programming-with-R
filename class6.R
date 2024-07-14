#### Class 6##

Library(tidyverse)
View(msleep)

msleep %>%  # we can also do summary for multiple var at a time
    select( awake, sleep_total, sleep_cycle) %>% 
    summary()

msleep %>%  # customize your summary table
    # we want to see the table for vore according to their average sleep_time
    drop_na(vore) %>%
    group_by(vore) %>%
    summarise( Lower = min(sleep_total),
               Average = mean(sleep_total),
               Upper = max(sleep_total),
               Difference = 
                   max(sleep_total)- min(sleep_total)) %>% 
    arrange(Average) %>% 
    View()

# Create tables
table(msleep$vore) # Just the count

msleep %>%  # give me the table for vore, for which order will only include "Rodentia"             # "Primates"
    select(vore, order) %>% 
    filter (order %in% c("Rodentia", "Primates")) %>% 
    table()

#### Visualize your Data

View(pressure)
plot(pressure) # default R ploting without any packages


# The grammar of graphics
# 1. data
# data will have variables , these variables would be mapped out against Aesthetic ( color, shape, size, ect..) ( be thoughtful about the x and y axes)
# 2. mapping
# 3. geometry
#line , bar chart, histogram, box plot, any kind of shape R can produce)

### Bar plots
#install.packages('ggplot2') # we don't have to install it because we have already installed tidyverse , and that includes ggplot2

library(ggplot2)
ggplot(data = msleep,
       mapping = aes( x = vore)) + #??
    geom_bar()

View(msleep)
names(msleep)
glimpse(msleep)

# Histograms
# we can do manipulate and handle our data before plotting it. That's why %>%  is so powerful
View(starwars)

starwars %>% 
    drop_na(height) %>% 
    ggplot( mapping = aes(x = height)) +
    geom_histogram()

starwars %>%  # don't need to write mapping # we don't need to write x
    drop_na(height) %>% 
    ggplot(aes( x = height)) +
    geom_histogram()

# Box plot

starwars %>% 
    drop_na(height) %>% 
    ggplot(aes( x= height)) +
    geom_boxplot( fill = "red") +
    theme_minimal() +
    labs(title = "Boxplot of height",
         x = "height of characters in cm") 


# Density plot

# starwars %>% 
#     drop_na(height) %>% 
#     filter (sex %in% c("male", "female")) %>% 
#     ggplot(mapping = aes(x = height,
#                           color = sex,
#                           fill = sex )) +
#     geom_density(alpha = 0.2)+
#     theme_bw()

View(msleep)

msleep %>% 
    drop_na(sleep_total) %>% 
    filter(vore %in% c("carni", "herbi", "omni")) %>% 
    ggplot(aes(sleep_total,
               color = vore,
               fill = vore))+
    geom_density( alpha = 0.3)+ # density for probability of observation rather than frequency
    theme_bw()

# Scatter plots

starwars %>% 
    filter(mass <200) %>% 
    ggplot( aes( x = height, y = mass, color = hair_color)) +
    geom_point( size = 3, alpha = 0.5) +
    theme_minimal()+
    labs(title = "Height and Mass by sex of the animals")

?msleep
msleep %>% 
    drop_na( bodywt, brainwt) %>% 
    filter ( bodywt < 200, brainwt < 0.5, vore %in% c ("herbi", "omni")) %>% 
    ggplot( aes( x = bodywt, y = brainwt, color = vore )) +
    geom_point( size = 5, alpha = 0.5)+
    theme_minimal() +
    labs( title = "Body weight and Brain weight by vore")


# Smoothed model 

msleep %>% 
    drop_na( bodywt, sleep_total) %>% 
    filter ( bodywt < 200, vore %in% c (  "carni", "omni")) %>% 
    ggplot( aes( x = bodywt, y = sleep_total, color = vore )) +
    geom_point( size = 5, alpha = 0.5)+
    geom_smooth()+
    facet_wrap( ~vore) +
    theme_bw() +
    labs( title = "Body weight and sleep total by vore")