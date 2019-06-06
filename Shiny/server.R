
library(shiny)
library(leaflet)
# Pass the function that reactively filter out the data based on the user's input
source('filter.R')

source('../Data/readData.R')

shinyServer(function(input, output) {

  data <- reactive({
    x <- df
  })
  
  # Output the map based on the widget selection 
  output$mapPlot <- renderLeaflet({
    df <- conditionFilter(input)
    
    leaflet(df) %>%
      addTiles(options = providerTileOptions(noWrap = TRUE)) %>%
      setView(lng=-122.3 , lat = 47.6, zoom= 12) %>% 
      addMarkers(lat = ~lat,
                 lng = ~long,
                 popup = paste("Price:",df$price,"<br>","Number of Bedrooms:",df$bedrooms,"<br>",
                               "Number of Bathrooms:",df$bathrooms,"<br>",
                               "Square Footage of Living Space:",df$sqft_living,"<br>",
                               "Month Sold:",df$month))
  })
 
  # Output the corresponding chart with more detailed information about the filtered data
  output$DataTable <- renderDataTable({
    df <- conditionFilter(input)
  })
  
})

