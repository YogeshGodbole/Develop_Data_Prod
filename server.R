# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    dist <- switch(input$dist,
                   Normal = rnorm,
                   Uniform = runif,
                   Lognormal = rlnorm,
                   Exponential = rexp,
                   rnorm)
    
    hist(dist(input$obs), col = 'green',
         main = paste("Histogram of a" , input$dist, "Distribution with ", input$obs, " Observations"))  ##dist size, parameter from slider
  })
}
)