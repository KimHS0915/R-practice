library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)

# Q1
midwest <- midwest %>% mutate(per_minor = (poptotal - popadults) / poptotal * 100)

# Q2
midwest %>% 
  arrange(desc(per_minor)) %>% 
  select(county, per_minor) %>% 
  head(5)

# Q3
midwest <- midwest %>% 
  mutate(grade = ifelse(per_minor >= 40, "large",
                        ifelse(per_minor >= 30, "middle", "small")))
table(midwest$grade)

# Q4
midwest <- midwest %>% 
  mutate(per_asian = popasian / poptotal * 100)
midwest %>% 
  arrange(per_asian) %>% 
  select(state, county, per_asian) %>% 
  head(10)