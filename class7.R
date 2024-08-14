#### Analyse your Data

# Hypothesis testing
library(gapminder)
View(gapminder)






# We can see the distribution lifeExp in Africa and Europe
# Mean is for Africa 48.9 and for Europe 71.9
# When we look into it, it obvious that there is difference in lifeExp 
# You can compare the life expectancy (lifeExp) between Africa and Europe by running a hypothesis test.

# Null Hypothesis (H₀): There is no difference in life expectancy between Africa and Europe 

# Alternative Hypothesis (H₁): There is a difference in life expectancy between Africa and Europe

# The p-value helps us figure out if the difference in life expectancy between Africa and Europe is likely due to chance or if it's a real difference.

# If the p-value is low: It means it's very unlikely that the difference we see is just by chance, so we would conclude that there is a real difference between the life expectancies in Africa and Europe.

# If the p-value is high: It means the difference could easily be due to chance, so we wouldn't be confident that there's a real difference.


# for getting a p-value we have to run a T-test



# T-test

# Why t-test ? T-test enable us to compare two means

# T_ test plot 

################ This part is for generating the plot for understanding the question we are asking for T-test
###########################################################################

# Calculate means for each continent
mean_lifeExp <- gapminder %>%
    filter(continent %in% c("Africa", "Europe")) %>%
    group_by(continent) %>%
    summarize(mean_lifeExp = mean(lifeExp))

# Create the plot and save it as t_test_plot
t_test_plot <- ggplot(gapminder %>% filter(continent %in% c("Africa", "Europe")), aes(x = lifeExp, fill = continent)) +
    geom_density(alpha = 0.5) +
    theme_minimal() +
    labs(title = "Density Plot of Life Expectancy in Africa and Europe",
         x = "Life Expectancy",
         y = "Density",
         fill = "Continent") +
    geom_vline(data = mean_lifeExp, aes(xintercept = mean_lifeExp, color = continent), linetype = "dashed", size = 1) +
    geom_text(data = mean_lifeExp, aes(x = mean_lifeExp, y = 0.02, label = paste("Mean:", round(mean_lifeExp, 2))), 
              color = "black", vjust = -1, hjust = 1.5, size = 3.5) +
    scale_color_manual(values = c("Africa" = "blue", "Europe" = "red"))

# Print the plot to display it
print(t_test_plot)

######################################################################################################################################################

View(gapminder)
gapminder %>% 
    filter ( continent %in% c ( "Africa", "Europe")) %>% 
    t.test(lifeExp ~ continent, data = .,
           alternative = "two.sided",
           paired = FALSE)

# We reject the null hypothesis. The p-value is less than 0.05. There is a significant difference in mean life expectancy between Africa and Europe.

# Null Hypothesis:There is no difference in mean life expectancy between Africa and Europe
# Decision: There is difference in LifeExp between these two continent 



# ANOVA

# if we have more than 2 mean , we have to use ANOVA (analysis of variance)

# Across the three continents ( Europe, America and Asia) are there any difference among the average lifeExp ?

################ This part is for generating the plot for understanding the question we are asking for ANOVA
###########################################################################


library(gridExtra)

# Filter the gapminder dataset for Europe, Americas, and Asia
gapminder_filtered <- gapminder %>% filter(continent %in% c("Europe", "Americas", "Asia"))
mean_lifeExp <- gapminder_filtered %>% group_by(continent) %>% summarize(mean_lifeExp = mean(lifeExp))

# Create the box plot
box_plot <- ggplot(gapminder_filtered, aes(x = continent, y = lifeExp, fill = continent)) +
    geom_boxplot(alpha = 0.5) +
    stat_summary(fun = mean, geom = "point", shape = 21, size = 3, fill = "white") +
    theme_minimal() +
    labs(x = "Continent", y = "Life Expectancy", title = "Boxplots and Means") +
    theme(legend.position = "none",
          axis.text.x = element_text(size = 12),
          axis.text.y = element_text(size = 12))

# Create the density plot with mean lines
density_plot <- ggplot(gapminder_filtered, aes(x = lifeExp, fill = continent)) +
    geom_density(alpha = 0.5) +
    geom_vline(data = mean_lifeExp, aes(xintercept = mean_lifeExp, color = continent), linetype = "dashed", size = 1) +
    theme_minimal() +
    labs(x = "Life Expectancy", y = "Density", title = "Density Plots and Means") +
    theme(legend.position = "none",
          axis.text.x = element_text(size = 12),
          axis.text.y = element_text(size = 12))

# Combine the plots into a grid and save as ANOVA_Plot
ANOVA_Plot <- grid.arrange(
    arrangeGrob(box_plot + facet_wrap(~continent, scales = "free"),
                density_plot + facet_wrap(~continent, scales = "free"),
                ncol = 2)
)

# Print the plot to display it
print(ANOVA_Plot)

###########################################################################
###########################################################################



# ANOVA

# Why ANOVA? ANOVA (Analysis of Variance) allows us to compare the means of more than two groups to see if at least one group mean is different from the others.

# Perform ANOVA to compare the mean life expectancy across multiple continents

anova_result <- gapminder %>% 
    filter(continent %in% c(  "Americas","Asia", "Europe")) %>%
    aov(lifeExp ~ continent, data = .)

# Display the summary of the ANOVA result
summary(anova_result)

# If the p-value is less than 0.05, we reject the null hypothesis.
# Null Hypothesis: There is no difference in mean life expectancy among the continents.
# Decision: If p-value < 0.05, at least one continent has a significantly different mean life expectancy.


# Pr(>F): < 2e-16 (the p-value associated with the F statistic, indicating the probability of observing such an extreme F value if the null hypothesis were true).


# Interpretation:
# Null Hypothesis: There is no difference in mean life expectancy among the continents.
# Alternative Hypothesis: At least one continent has a significantly different mean life expectancy compared to the others
