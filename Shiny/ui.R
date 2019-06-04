
library(shiny)
library(leaflet)



shinyUI(fluidPage(
  
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bedrooms:",
                   min = 2,
                   max = 6,
                   value = 2),
       sliderInput("bins",
                   "Number of bathrooms:",
                   min = 2,
                   max = 6,
                   value = 2),
       numericInput("Zip Code",
                    label = NULL,
                    value = NA,
                    min = 98001,
                    max = 98199),
       sliderInput("bins",
                   "Price Range",
                   min = 0,
                   max = 1000000,
                   value = c(50000, 200000)),
       sliderInput("bins",
                   "Condition of House",
                   min = 0,
                   max = 5,
                   value = 0),
       sliderInput("bins",
                   "Living Square Footage",
                   min = 0,
                   max = 10000,
                   value = c(0,250))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
#      plotOutput("distPlot")
      tabsetPanel(
      tabPanel("Summary", verbatimTextOutput("summary")),
      tabPanel("Maps", plotOutput("distPlot")),
      tabPanel("Discussion", tableOutput("table"))
      )
    )
  )
))


