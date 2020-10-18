# Q1
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg

# Q2
library(dplyr)
mpg_new <- rename(mpg_new, city = cty, highway = hwy)

# Q3
head(mpg_new)
