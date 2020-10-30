# 05-2
## Q1
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg

## Q2
library(dplyr)
mpg_new <- rename(mpg_new, city = cty, highway = hwy)

## Q3
head(mpg_new)

# challenge
## Q1
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

## Q2
midwest <- rename(midwest, total = poptotal, asian = popasian)
head(midwest)

## Q3
midwest$per_asian <- (midwest$asian / midwest$total) * 100
hist(midwest$per_asian)

## Q4
midwest$mean_asian <- ifelse(midwest$per_asian > mean(midwest$per_asian), "large", "small")

## Q5
table(midwest$mean_asian)
qplot(midwest$mean_asian)
