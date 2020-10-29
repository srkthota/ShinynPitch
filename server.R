#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

cal.BMI <- function(weight,height) 
{weight/((height)^2)}

BMI.range <- function(weight,height){
    BMI <- cal.BMI(weight, height)
    ifelse(BMI <18.5,"Under Weight",
           ifelse(BMI<22.9,"Normal",
                  ifelse(BMI<24.9,"Over Wight",
                         ifelse(BMI<29.9,"Pre obese",
                                ifelse(BMI<34.9,"Obese class I",
                                       ifelse(BMI<39.9,"Obese class II",
                                              ifelse(BMI>=40.0,"Obese class III")))))))
}

shinyServer(
    function(input, output) {
        
        output$inputweight <- renderPrint({input$weight})
        output$inputheight <- renderPrint({input$height})
        output$calculation <- renderPrint({cal.BMI(input$weight,input$height)})
        output$result <- renderPrint({BMI.range(input$weight,input$height)})
    } 
)