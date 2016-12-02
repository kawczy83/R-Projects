#Shows 2 plots:
#1st plot shows the states with the highest number of complaints
#2nd plot shows the amount of ratings that customers have left.


comcast <- read.csv('Comcast_Complaints.csv', stringsAsFactors = F)

#Remove columns that aren't needed
comcast$a <- NULL
comcast$b <- NULL
comcast$c <- NULL
comcast$X <- NULL
comcast$text <- NULL

head(comcast)
summary(comcast)

#Convert state values to upper case
comcast$state <- toupper(comcast$state)


#Plot
library(ggplot2)
p1 <- ggplot(data=comcast, aes(x=reorder(state,state,function(x)-length(x))))  + geom_bar()
p1

p2 <- ggplot(comcast, aes(x=rating)) + geom_bar()
p2
