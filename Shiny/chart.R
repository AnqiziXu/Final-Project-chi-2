source('filter.R')
library('ggplot2')
library('dplyr')

chart <- function(inputData) {
  
  data <- conditionFilter(inputData, condition)
  
}

plot1 <- ggplot(data = filtered, aes(bedrooms, price)) +
  geom_point()

state_map <- map_data('county', 'washington')

king_map <- state_map %>%
  filter(subregion == 'king')

plot2 <- ggplot(data = filtered, aes(long, lat)) +
  geom_point(aes(color = price), size = 5)