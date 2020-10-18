# Q1
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

# Q2
midwest <- rename(midwest, total = poptotal, asian = popasian)
head(midwest)

# Q3
midwest$per_asian <- (midwest$asian / midwest$total) * 100
hist(midwest$per_asian)

# 04
midwest$mean_asian <- ifelse(midwest$per_asian > mean(midwest$per_asian), "large", "small")

# 05
table(midwest$mean_asian)
qplot(midwest$mean_asian)
