library(ggplot2)
library(dplyr)

# Q1
df_mpg <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
ggplot(data = df_mpg, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()

# Q2
ggplot(data = mpg, aes(x = class)) + geom_bar()
