library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# Q1
mpg_classcty <- mpg %>% select(class, cty)
head(mpg_classcty)

# Q2
mpg_suv <- mpg_classcty %>% filter(class == "suv")
mean(mpg_suv$cty)
mpg_compact <- mpg_classcty %>% filter(class == "compact")
mean(mpg_compact$cty)
