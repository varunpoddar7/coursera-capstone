#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)
library(stringr)
library(data.table)
library(knitr)

# Define server logic
shinyServer(function(input, output) {
    
    cleanInput <- function(text){
        
        cleanText <- tolower(text)
        cleanText <- removePunctuation(cleanText)
        cleanText <- removeNumbers(cleanText)
        cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
        cleanText <- stripWhitespace(cleanText)
        
        return(cleanText)
    }
    
    predictWord <- function(userWords) {
        
        # use words from input phrase
        # if number of words >=3 set search phrase to last 3 words
        # otherwise, set search phrase to the 2 or 1 word provided
        # match this search phrase to the n-gram content data
        # if match exists, return the predicted word from the dataset
        # if match doesn't exist, return "the"
            
        input_count <- str_count(userWords, boundary("word"))
        
        if(input_count >= 3) {
            #get last 3 words (using a stringr package function)
            #searchPhrase <- str_c(userWords[length(userWords)], userWords[length(userWords)-1],
            #                        userWords[length(userWords)-2], sep=" ")
            searchPhrase <- word(userWords, -3L, -1L)
            nextWord <- nGramDF[.(searchPhrase)][order(-Frequency)][1][, predictionWord]
            
            if(is.na(nextWord)){
                input_count <- 2
            }
        }
        if(input_count == 2) {
            #get last 2 words
            searchPhrase <- word(userWords, -2L, -1L)
            nextWord <- nGramDF[.(searchPhrase)][order(-Frequency)][1][, predictionWord]
            
            if(is.na(nextWord)){
                input_count <- 1
            }
        }
        if(input_count == 1) {
            #get last word
            searchPhrase <- word(userWords, -1L)
            nextWord <- nGramDF[.(searchPhrase)][order(-Frequency)][1][, predictionWord]
            
            if(is.na(nextWord)){
                #default prediction is "the"
                nextWord <- "the"  
            }
        }
        

        #return predictionWord per top-1 row from frequency sorted dataset 
        #upon matching searchPhrase amongst 4-grams
        if(input_count == 0) {
            nextWord <- "Please type a phrase to see predicted word"
        }
        else {
            nextWord <- nextWord
        }

        return(nextWord)
        
    }
    
    # load training dataset saved from prior exercises
    nGramDF <- readRDS("ngramdf.RDS")
    setkey(nGramDF, comparisonWord)
    
    #capture input phrase
    inputSentence <- reactive({
        cleanInput(input$phrase)
    })
    
    #confirm inputted phrase
    output$typedPhrase <- renderText({
        
        paste(inputSentence())
    }) 

    
    output$predictedWord <- renderText({ 
        
        userResponse <- predictWord(inputSentence())

        paste(userResponse)

    }) 
    
})
