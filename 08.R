library(ggplot2)
library(dplyr)

# 08-2
## Q1
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

## Q2
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_point() + 
  xlim(0, 500000) + 
  ylim(0, 10000)

# 08-3
## Q1
df_mpg <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
ggplot(data = df_mpg, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()

## Q2
ggplot(data = mpg, aes(x = class)) + geom_bar()

# 08-4
## Q1
ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()

# 08-5
## Q1
df_mpg <- mpg %>% filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data = df_mpg, aes(x = class, y = cty)) + geom_boxplot()
