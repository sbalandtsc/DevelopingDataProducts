#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model1 <- lm(mpg~wt, data=mtcars)
    
    model1pred <- reactive({
        wtInput <- input$sliderWT
        predict(model1, newdata = data.frame(wt=wtInput))
    })

    output$plot1 <- renderPlot({
        wtInput <- input$sliderWT
        
        plot(mtcars$wt, mtcars$mpg, xlab = "Weight (in 1000 lbs)",
             ylab = "Miles per gallon (MPG)", bty="n", pch=16,
             xlim = c(1, 6), ylim = c(10, 35))
            abline(model1, col="green", lwd=2)
        
        legend(25, 250, "Model prediction", pch=16,col="red", bty="n", cex=1.2)
        points(wtInput, model1pred(), col="green", pch=16, cex=2)
    })
    
    output$pred1 <- renderText({
        round(model1pred(), digits=2)
    })
})
