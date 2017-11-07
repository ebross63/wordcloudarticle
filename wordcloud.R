JandH_fear_freq<-JandH_fear_words%>%
  group_by(word)%>%
  summarize(count=n())

wordcloud(JandH_fear_freq$word,JandH_fear_freq$count,min.freq = 5)

JandH_happy_freq<-JandH_happy_words%>%
  group_by(word)%>%
  summarize(count=n())

wordcloud(JandH_happy_freq$word,JandH_happy_freq$count,min.freq = 5)


