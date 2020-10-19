library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# Q1
mpg %>% 
  filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>% 
  head(5)
