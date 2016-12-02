#Read in the dataset:
drugs <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/drug-use-by-age/drug-use-by-age.csv", 
                  na.strings = c("-"))  #NA values were shown as "-"'s, instead of NA's or zeros.
drugs
summary(drugs)
str(drugs)

#Cleaning up the dataset:

drugs[!complete.cases(drugs),] #Shows rows that contain NA values

drugs[!is.na(drugs$heroin.frequency),] #Gets rid of the 13 year old age group

drugs <- drugs[!is.na(drugs$heroin.frequency),] #Removes rows that contain NA values


drugs[!complete.cases(drugs),] #Shows rows that contain NA values

drugs <- drugs[!is.na(drugs$crack.frequency),] #Gets rid of the 12,14, and over 65 age groups


#Resets the dataframe index
rownames(drugs) <- NULL
drugs

#Plotting graphs:
library(ggplot2)

#Heroin
ggplot(data=drugs, aes(x=age, y=heroin.use)) + geom_line(aes(group=1)) + geom_point()
ggplot(data=drugs, aes(x=age, y=heroin.frequency)) + geom_line(aes(group=1)) +geom_point() 

#Weed
ggplot(data=drugs, aes(x=age, y=marijuana.use)) + geom_line(aes(group=1)) + geom_point()
ggplot(data=drugs, aes(x=age, y=marijuana.frequency)) + geom_line(aes(group=1)) +geom_point()

#Alcohol
ggplot(data=drugs, aes(x=age, y=alcohol.use)) + geom_line(aes(group=1)) + geom_point()
ggplot(data=drugs, aes(x=age, y=alcohol.frequency)) + geom_line(aes(group=1)) + geom_point()

#Oxycontin
ggplot(data=drugs, aes(x=age, y=oxycontin.use)) + geom_line(aes(group=1)) + geom_point()
ggplot(data=drugs, aes(x=age, y=oxycontin.frequency)) + geom_line(aes(group=1)) + geom_point()
#Cocaine
ggplot(data=drugs, aes(x=age, y=cocaine.use)) + geom_line(aes(group=1)) + geom_point()
ggplot(data=drugs, aes(x=age, y=cocaine.frequency)) +geom_line(aes(group=1)) + geom_point()



