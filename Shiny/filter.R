source('../data/readData.R')

conditionFilter <- function(inputData) {
  # function that takes list of input value as parameters, and return the filtered data

  
  priceRange <- inputData$price
  sqftLiv <- inputData$sqft
#  monthRange <- inputData$month

  filtered <- suited_house %>% 
    filter(bedrooms <= inputData$rooms 
           & bathrooms <= inputData$bath 
           & zipcode == inputData$Zip 
           & between(price, priceRange[1], priceRange[2])
           & condition <= inputData$condition 
           & between(sqft_living, sqftLiv[1], sqftLiv[2])
           & month == inputData$month)
 #          & between(month, monthRange[1], monthRange[2]))
  
  return(filtered)
}

