
library(shiny)
library(leaflet)
source('filter.R')
source('chart.R')

# you don't need to read .csv data again. Just source it. This line is useless
housing <- read.csv("../Data/suited_house.csv", stringsAsFactors = FALSE)

source('../Data/readData.R')

shinyServer(function(input, output) {

  data <- reactive({
    x <- df
  })
     
  output$mapPlot <- renderLeaflet({
    df <- conditionFilter(input)
    
    leaflet(df) %>%
      addTiles(options = providerTileOptions(noWrap = TRUE)) %>%
      setView(lng=-122.3 , lat = 47.6, zoom= 12) %>% 
      addMarkers(lat = ~lat,
                 lng = ~long,
                 popup = paste("Price:",df$price,"<br>","Number of Rooms:",df$bedrooms,"<br>",
                               "Number of Bathrooms:",df$bathrooms,"<br>",
                               "Square Footage of Living Space:",df$sqft_living,"<br>",
                               "Month Sold:",df$month))
  })
  
  output$test <- renderText({
    filtered <- conditionFilter(input)
    chartTest <- chart(filtered, 'sqft_living')
    paste('For conditionFilter function, the parameters are: number of bedrooms: ', input$rooms, 
          '. Number of bathrooms: ', input$bath, '. Zipcode: ', input$Zip, '. Price range: ', input$price[1], '-', input$price[2], 
          '. Condition: ', input$condition, '. Living feet: ', input$sqft[1], '-', input$sqft, '. The output have ', nrow(filtered), ' rows in total.',
          '.. The chart function have ', nrow(chartTest), ' rows. ',sep = '')
  })
  
  
})

