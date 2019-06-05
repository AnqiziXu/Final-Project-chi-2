source('filter.R')
library('ggplot2')
library('dplyr')


# output a table for that particular zipcode and condition (sqft_living, bedrooms, bathrooms, etc)
chart <- function(inputData, condition) {
  if (nrow(inputData) == 0 || is.null(condition)) {
    return(inputData)
  } else if (condition == 'sqft_living') {
     data <- inputData %>%
      # group by range
       mutate(interval = cut(sqft_living, c(0, 2000, 4000, 6000, 8000, 10000, Inf))) %>%
       group_by(interval) %>%
       summarise(average_price = mean(price), number = n())
   } else {
    data <- inputData %>%
      group_by_(condition) %>%
      summarise(average_price = mean(price), number = n())
  }
  return(data)
}
