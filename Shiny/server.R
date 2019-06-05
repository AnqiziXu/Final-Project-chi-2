
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

#shinyServer(function(input,output){
# filtered <- housing %>% 
#   filter(bedrooms = input$rooms) %>% 
#    filter(bathrooms = input$bath) %>% 
#    filter(zipcode = input$Zip) %>% 
#    filter(price > input$minprice) %>% 
#    filter(price < input$maxxprice) %>% 
#    filter(condition = input$condition) %>%
#    filter(sqft_living < (input$sqft + 100))
#})


