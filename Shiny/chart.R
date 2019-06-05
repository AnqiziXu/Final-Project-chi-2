source('filter.R')
library('ggplot2')
library('dplyr')

# output a table for that particular zipcode and condition (sqft_living, bedrooms, bathrooms, etc)
chart <- function(inputData, condition) {
  if (condition != 'sqft_living') {
    data <- conditionFilter(inputData) %>%
      group_by(get(condition)) %>%
      summarise(average_price = mean(price))
  } else {
    data <- conditionFilter(inputData) %>%
      # group by range
      mutate(interval = cut(get(condition), c(0, 2000, 4000, 6000, 8000, 10000, Inf))) %>%
      group_by(interval) %>%
      summarise(average_price = mean(price), number = n())
  }
}
