
library(shiny)
library(leaflet)

housing <- read.csv("../Data/suited_house.csv", stringsAsFactors = FALSE)


shinyServer(function(input, output) {
   
  output$mapPlot <- renderLeaflet({
    leaflet() %>%
      addTiles(options = providerTileOptions(noWrap = TRUE)) %>%
      setView(lng=-122.3 , lat = 47.6, zoom= 12)
  })
  
})
