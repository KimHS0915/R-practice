library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# 06-2
## Q1
displ_4orless <- mpg %>% filter(displ <= 4)
displ_5ormore <- mpg %>% filter(displ >= 5)
mean(displ_4orless$hwy)
mean(displ_5ormore$hwy)

## Q2
audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(audi$cty)
mean(toyota$cty)

## Q3
mean((mpg %>%  filter(manufacturer %in% c("chevrolet", "ford", "honda")))$hwy)

# 06-3
## Q1
mpg_classcty <- mpg %>% select(class, cty)
head(mpg_classcty)

## Q2
mpg_suv <- mpg_classcty %>% filter(class == "suv")
mean(mpg_suv$cty)
mpg_compact <- mpg_classcty %>% filter(class == "compact")
mean(mpg_compact$cty)

# 06-4
## Q1
mpg %>% 
  filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>% 
  head(5)

# 06-5
## Q1
mpg_new <- mpg %>% mutate(total = hwy + cty)

## Q2
mpg_new <- mpg_new %>% mutate(avg = total / 2)

## Q3
mpg_new %>% 
  arrange(desc(avg)) %>% 
  head(3)

## Q4
mpg %>% 
  mutate(total = hwy + cty,
         avg = (hwy + cty)/2) %>% 
  arrange(desc(avg)) %>% 
  head(3)

# 06-6
## Q1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

## Q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

## Q3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

## Q4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n = n()) %>%
  arrange(desc(n))

# 06-7
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

## Q1
mpg <- left_join(mpg, fuel, by = "fl")

## Q2
mpg %>% 
  select(model, fl, price_fl) %>% 
  head(5)

# challenge
## Q1
midwest <- as.data.frame(ggplot2::midwest)
midwest <- midwest %>% mutate(per_minor = (poptotal - popadults) / poptotal * 100)

## Q2
midwest %>% 
  arrange(desc(per_minor)) %>% 
  select(county, per_minor) %>% 
  head(5)

## Q3
midwest <- midwest %>% 
  mutate(grade = ifelse(per_minor >= 40, "large",
                        ifelse(per_minor >= 30, "middle", "small")))
table(midwest$grade)

## Q4
midwest <- midwest %>% 
  mutate(per_asian = popasian / poptotal * 100)
midwest %>% 
  arrange(per_asian) %>% 
  select(state, county, per_asian) %>% 
  head(10)
