library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# Q1
displ_4orless <- mpg %>% filter(displ <= 4)
displ_5ormore <- mpg %>% filter(displ >= 5)
mean(displ_4orless$hwy)
mean(displ_5ormore$hwy)

# Q2
audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(audi$cty)
mean(toyota$cty)

# Q3
mean((mpg %>%  filter(manufacturer %in% c("chevrolet", "ford", "honda")))$hwy)
