#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for next word prediction application
shinyUI(navbarPage("What's the word", 
                   
                   tabPanel("Data",
                            
                            
                            fluidPage(
                                
                                # Application title
                                titlePanel("Guess the word!"),
                                
                                # Sidebar with a slider input for number of bins 
                                sidebarLayout(
                                    sidebarPanel(
                                        
                                        helpText(p("Few suggestions of words you could try: ", em("economic, deep economic, in an economic"))),
                                        textInput("phrase", label="Type a few words:", value= ),
                                        submitButton("Update", icon("refresh"))
                                    ),
                                    
                                    # Show data and graphs
                                    mainPanel(
                                        h4("Documentation / Instructions:"),
                                        p("On the", em(" left "),"panel, please type a few words to have the", em(" prediction algorithm "), "suggest the next word."),
                                        br(),
                                        h4("Phrase evaluated:"),
                                        textOutput("typedPhrase"),
                                        br(),
                                        h4("Predicted Next Word:"),
                                        textOutput("predictedWord")                                    )
                                )
                            )
                            
                   ), 
                   
                   tabPanel("About", 
                            mainPanel(includeMarkdown("about.rmd"))
                   )
                   
)
)