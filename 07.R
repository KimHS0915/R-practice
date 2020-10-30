library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# 07-1
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

## Q1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

## Q2
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

# 07-2
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

## Q1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c('4', "f", "r"), mpg$drv, NA)
table(mpg$drv)

## Q2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

## Q3
mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))
