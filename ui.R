#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simulated Stock Market, using EuStockPrices"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(type = "tabs", tabPanel("App",
      numericInput("Magenta", label = "How much money towards Magenta Stock?", value = 0, min = 0, max = 1000),
      numericInput("Blue", label = "How much money towards Blue Stock?", value = 0, min = 0, max = 1000),
      numericInput("Red", label = "How much money towards Red Stock?", value = 0, min = 0, max = 1000),
      numericInput("Green", label = "How much money towards Green Stock?", value = 0, min = 0, max = 1000),
      actionButton("Year", "Submit")
      ),
      tabPanel("Documentation",
               h6("1. Record the amount of money you're going to invest in each stock"),
               h6("2. Hit the submit button. The year will advance one."),
               h6("3. You'll see what stocks went up or down on the plot. Under the plot you'll see how much money you invested and then how much you made or lost.")
               )
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h3(span("You invested: $",textOutput("invest", inline=TRUE))),
       h3(span("Your profit: $",textOutput("moneymade", inline=TRUE)))
       
    )
  )
))
