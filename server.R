#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data.frame(EuStockMarkets)->stocks
round(runif(1, 1,1360))->start
sequence = 1:10*50+start

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    

    plot(1:10, 1:10, xlim = c(1,10), ylim = range(stocks[sequence,]), type="n", ylab = "Stock Price", xlab = "Year", main = "Simulated Stock Market")
    year=input$Year+1
    points(1:year, stocks[sequence[1:year],1], col = "red", pch = 16, type = "b")
    points(1:year, stocks[sequence[1:year],2], col = "blue", pch = 16, type = "b")
    points(1:year, stocks[sequence[1:year],3], col = "dark green", pch = 16, type = "b")
    points(1:year, stocks[sequence[1:year],4], col = "magenta", pch = 16, type = "b")
    
  })
  output$invest <- renderText({input$Magenta + input$Blue + input$Red + input$Green})
  output$moneymade <- renderText({
    year=input$Year+1
    if(input$Year==10){stopApp()}
      a=(input$Magenta * stocks[sequence[year],4]/stocks[sequence[year-1],4]) 
      a=a+(input$Blue * stocks[sequence[year],2]/stocks[sequence[year-1],2]) 
      a=a+(input$Red * stocks[sequence[year],1]/stocks[sequence[year-1],1]) 
      a=a+(input$Green * stocks[sequence[year],3]/stocks[sequence[year-1],3])
      a-(input$Magenta + input$Blue + input$Red + input$Green)
    })
})
