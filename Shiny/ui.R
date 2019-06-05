library(shiny)
library(leaflet)
library(shinythemes)

housing <- read.csv("../Data/suited_house.csv", stringsAsFactors = FALSE)



shinyUI(navbarPage("House Sales in 2014 and 2015", theme = shinytheme("flatly"),
                   
                   navbarMenu("Introduction",
                              tabPanel("Purpose",
                                       includeMarkdown("intro.Rmd")),
                              tabPanel("Source",
                                       includeMarkdown("source.Rmd"))
                   ),
                   
                   tabPanel("Data Display",
                            
                            # Sidebar with a slider input for number of bins 
                            sidebarLayout(
                              sidebarPanel(
                                sliderInput("rooms",
                                            "Number of bedrooms:",
                                            min = 2,
                                            max = 6,
                                            value = 4),
                                sliderInput("bath",
                                            "Number of bathrooms:",
                                            min = 2,
                                            max = 6,
                                            value = 4),
                                numericInput("Zip",
                                             label = "Zip Code",
                                             value = NA,
                                             min = 98001,
                                             max = 98199),
                                sliderInput("price",
                                            "Price Range",
                                            min = 0,
                                            max = 1000000,
                                            value = c(50000, 600000)),
                                sliderInput("condition",
                                            "Condition of House",
                                            min = 0,
                                            max = 5,
                                            value = 4),
                                sliderInput("sqft",
                                            "Living Square Footage",
                                            min = 0,
                                            max = 10000,
                                            value = c(0, 4000)),
                                sliderInput("month",
                                            "Month of sale",
                                            min = 01,
                                            max = 012,
                                            value = 10)
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                tabsetPanel(type = "tabs",
                                tabPanel("Maps", leafletOutput("mapPlot")),
                                #      tabPanel("Text", textOutput('test'))
                                tabPanel("Chart",dataTableOutput("DataTable"))
                              ))
                            )
                   )
                   
))



