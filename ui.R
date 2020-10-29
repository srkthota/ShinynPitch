#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(pageWithSidebar(
    
    
    headerPanel("Body Mass Index Caliculator (BMI)"),
    
    sidebarPanel( h4("BMI Computation"),
                  numericInput('weight','What is your weight? (in kg)', 48, min = 40, max = 200, step = 1),
                  numericInput('height','How tall are you? (in m)', 1.5, min = 1, max =10, step= .1),
                  submitButton('Compute BMI'),
                  br(),
                  h4("BMI Ranges"),
                  tags$div( tags$ul (tags$li('BMI < 18.5     : Underweight'),
                                     tags$li('BMI 18.5-22.9  : Normal'),
                                     tags$li('BMI 23-24.9    : Overweight'),
                                     tags$li('BMI 25-29.9    : Pre Obese'),
                                     tags$li('BMI 30-34.9    : Obese Class I'),
                                     tags$li('BMI 35-39.9    : Obese Class II'),
                                     tags$li('BMI >= 40      : Obese Class III')))
    ),
    
    
    mainPanel(tabsetPanel(tabPanel("Results",
                                   h3('Your BMI is :'), verbatimTextOutput("calculation"),
                                   h3('You are '),verbatimTextOutput("result")),
                          
                          tabPanel("About",
                                   br(),
                                   p('Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters.
                A high BMI can be an indicator of high body fatness.
                BMI can be used to screen for weight categories that may lead to health problems.
                BMI is not diagnostic of the body fatness or health of an individual.'),
                                   br(),
                                   p('A healthy weight is a weight that lowers your risk for health problems. For most people, body mass index (BMI) and waist size are good ways to tell if they are at a healthy weight.
                But reaching a healthy weight isn’t just about reaching a certain number on the scale or a certain BMI. Having healthy eating and exercise habits is very important.
                If you want to get to a healthy weight and stay there, healthy lifestyle changes will work better than dieting. Reaching a certain number on the scale is not as important as having a healthy lifestyle.')
                                   
                                   
                                   
                          )))))
