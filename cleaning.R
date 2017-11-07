library(tm)
library(tidytext)
library(dplyr)
library(knitr)
library(gutenbergr)
library(stringr)
library(wordcloud)

gutenberg_works(str_detect(title,'The Strange Case of Dr. Jekyll'))
JandH<-gutenberg_download(42)

JandH_words<-JandH%>%
  unnest_tokens(word,text)

nrc<-get_sentiments('nrc')
unique(nrc$sentiment)

nrc_fear<-nrc%>%
  filter(sentiment %in% c('fear','negative','sadness','anger','disgust'))

nrc_happy<-nrc%>%
  filter(sentiment %in% c('trust','surprise','positive','joy','anticipation'))
  

JandH_fear_words<-inner_join(nrc_fear,JandH_words)
JandH_happy_words<-inner_join(nrc_happy,JandH_words)
