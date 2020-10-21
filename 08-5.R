library(ggplot2)
library(dplyr)

# Q1
df_mpg <- mpg %>% filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data = df_mpg, aes(x = class, y = cty)) + geom_boxplot()
