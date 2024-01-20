#Final Project
library(rpart)
library(rpart.plot)

#Load QB Stats
stats = read.csv(file = file.choose(), header = T, sep = ",", 
                stringsAsFactors = F)

#Visualization
Year = stats$year
Yards = stats$yds
Attempts = stats$att
Completions = stats$cmp
Points = stats$game_points
plot(Year,Yards)
plot(Completions,Attempts)
plot(Year,Points)
summary(stats$yds)
summary(stats$year)
summary(stats$att)
summary(stats$cmp)
summary(stats$ypa)
summary(stats$game_points)

mod = rpart(yds~year, data=stats, minsplit=1, minbucket=1, cp=0.001)
mod
rpart.plot(mod)

#Hypothesis Testing
m1 = mean(stats[stats$year>=2010,]$yds)
m1
v1 = var(stats[stats$year>=2010,]$yds)
v1
sd1 = sd(stats[stats$year>=2010,]$yds)
sd1
m2 = mean(stats[stats$year<2010,]$yds)
m2
v2 = var(stats[stats$year<2010,]$yds)
v2
sd2 = sd(stats[stats$year<2010,]$yds)
sd2
n1 = length(stats[stats$year>=2010,]$yds)
n1
n2 = length(stats[stats$year<2010,]$yds)
n2

zscore = (m2 - m1)/sqrt((sd2^2/n2)+(sd1^2/n1))
z