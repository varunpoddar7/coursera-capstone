Next Word Predictor Application
========================================================
author: Varun Poddar
date: March 22, 2018
autosize: true
transition: fade

<u>Overview:</u>
<br>
As part of the Coursera Data Science Capstone, this application seeks to build a predictive text application using natural language processing (NLP) techniques. This application is built using three English language datasets.  


Approach
========================================================
The following steps were followed to construct a predictive model:
<small>
- Load data from text files
- Clean data
- Generate corpus
- Clean / transform the corpus
- Generate n-grams (1, 2, 3, and 4-grams) & write to output files
- Aggregate n-gram files to get frequencies by n-gram
- Break n-grams into "base" and "prediction"
- Test prediction algorithms
- Build into Shiny Application
</small>

Exploratory Research
========================================================

<br>
<small>With quanteda, network graphs were used to show relationships between words (unigrams / bigrams) that occur together most frequently. </small>

<div align="center">
<img src="text-network1.png" width=500 height=500>
</div>

*** 

<br>
<small>Frequencies of higher degree n-grams that are unlikely to occur simultaneously were observed with word clouds.</small> 

<div align="center">
<img src="text-wc1.png" width=400 height=400>
</div>


Algorithm
========================================================
- The prediction algorithm used is Katz's backoff model, which helped estimate the conditional probability of a word given its history in the n-gram. 
- First the last three letters of the user-entered phrase are compared with the 4-gram data. If a match is found, the predicted word is returned.
- Then, if this fails to return a match, just the last two words are compared with the 3-gram data. If a match is found, then the predicted word is returned.
- Lastly, if this also fails to result in a match, just the last word is compared with the 2-gram data, to return the predicted word. 
- If no matching data is found, then "the" is returned as default.


Using The Application
========================================================
The application hosted on Shiny's servers provides users with a simple textbox to enter their phrase. Once the user clicks "Update" the algorithm recommends the predicted word. The "About" tab contains additional documentation in case need be. 

<div align="center">
<img src="word-app.png" width=700 height=300>
</div>

<small>
Link to Application: https://varunpoddar.shinyapps.io/nextWord/
</small>
