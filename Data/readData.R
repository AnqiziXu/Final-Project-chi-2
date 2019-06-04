library(dplyr)

data <- read.csv("../Data/kc_house_data.csv", stringsAsFactors = FALSE)

# filter out the houses that are extremely big or small, and 
# also clean out some of the unnecessary columns 
suited_house <- data %>%
  filter (bedrooms >1 & bedrooms <6
          & bathrooms > 1 & bathrooms <6) %>%
  select(-floors, -sqft_lot, -waterfront, 
         -grade, -sqft_living15,
         -sqft_lot15, -view)
suited_house$date  <- (substr(suited_house$date, 1, 8))

write.csv(suited_house, file = "suited_house.csv")

