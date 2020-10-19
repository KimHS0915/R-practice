library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# Q1
mpg_new <- mpg %>% mutate(total = hwy + cty)

# Q2
mpg_new <- mpg_new %>% mutate(avg = total / 2)

# Q3
mpg_new %>% 
  arrange(desc(avg)) %>% 
  head(3)

# Q4
mpg %>% 
  mutate(total = hwy + cty,
         avg = (hwy + cty)/2) %>% 
  arrange(desc(avg)) %>% 
  head(3)
