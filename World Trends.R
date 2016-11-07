#read in the Section 5 Homework-Data dataset
hw <- read.csv(file.choose()) #Section5-Homework-Data
hw

#split the data frame into two data frames by year:
data1960 <- hw[hw$Year=="1960",]
head(data1960)

data2013 <- hw[hw$Year == "2013",]
head(data2013)

#Create additional data frames
add1960 <- data.frame(Code=Country_Code, LE1960 = Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, LE2013 = Life_Expectancy_At_Birth_2013)

#Verify that the data has been created correctly
summary(add1960)
summary(add2013)

#Merge the pairs of dataframes into one:
merged1960 <- merge(data1960, add1960, by.x = "Country.Code", by.y = "Code" )
merged2013 <- merge(data2013, add2013, by.x = "Country.Code", by.y = "Code")

#verify newly formed dataframe
str(merged1960)
str(merged2013)

#Remove the Year column
merged1960$Year <- NULL
merged2013$Year <- NULL

#Visualize the merged datasets 
qplot(data = merged1960, x = Fertility.Rate, y = LE1960, 
        color=Region,
        size=I(2),
        alpha=I(0.6),
        main="Life Expentancy vs Fertility (1960)")

qplot(data = merged2013, x = Fertility.Rate, y = LE2013, 
      color=Region,
      size=I(2),
      alpha=I(0.6),
      main="Life Expentancy vs Fertility (2013)")