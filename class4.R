## Class 4

##### Cleaning Data

# Select variables
starwars %>%  # select by var name
    select(name, height, mass)

starwars %>% # select by col number
    select(1:3)

starwars %>%  # It will select the col/ variable that contains color at the end of the var
    select (ends_with("color"))

# changing variable order
## You can see the variable in the order you want to see. everything () will include all other var afte the names you have provided. 

starwars %>%
    select (name,  height, mass, everything() )

# changing variable name

starwars %>% 
    rename( "characters" = "name") %>% 
    head()

# changing a variable type

class(starwars$hair_color) # hair color are character  
summary(starwars$hair_color) # if you want to see the summary statistics you can not see. 

starwars$hair_color <- as.factor(starwars$hair_color) # So, we want to convert character to factor. 
class(starwars$hair_color) # Factor can be ordered and categorized

summary(starwars$hair_color)

starwars %>%  # We are changing from factor to character
    mutate(hair_color = as.character(hair_color)) %>% 
    glimpse()

glimpse(starwars) # what is the difference of using glimpse () in previous line and using glimpse (starwars) in the next line?

# changing factor levels

df <- starwars # Just putting all the data of starwars into a new data frame
# when you want to modify something dont do it into your original df
# modify into a copied df
View(df)

levels (df$hair_color)

df$hair_color <- as.factor(df$hair_color)
levels(df$hair_color) # generally ordered as alphabetic order

df <- df %>%  # we are ordering according to our need
    mutate( eye_color = factor(eye_color,
                               levels = c("white", "grey", "blond", "blonde",    
                                          "black", "auburn, grey", "auburn, white",
                                          "brown", "brown, grey", "auburn", "none"
                               )))
levels(df$eye_color)