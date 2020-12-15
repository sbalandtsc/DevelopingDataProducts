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
    titlePanel("Predict your car's MPG"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderWT", "What is the weight of your car, in 1000 lbs?", 1.5, 5.5, value=3),
            submitButton("Submit")
        ),

        mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("README", "This application predicts your car's miles per gallons (MPG) based on its weight.
                                                              Simply use the slider to select the weight of your car, then click the Submit button.
                                                              The Plot tab displays a plot of MPG per weight, and the Predicted MPG tab displays the predicted MPG value of your car. 
                                                            The code used to build this app is available at https://github.com/sbalandtsc/DevelopingDataProducts. Enjoy!"),
                        tabPanel("Plot",plotOutput("plot1")), 
                        tabPanel("MPG Value", hr("Predicted MPG:"),textOutput("pred1"))
                        )
            
            )
        )
))
