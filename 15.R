# 15-1
## Q1
mpg <- as.data.frame(ggplot2::mpg)

mpg$tot <- (mpg$cty + mpg$hwy)/2
mpg_suv <- mpg[mpg$class == "suv",]
mpg_compact <- mpg[mpg$class == "compact",]
mean(mpg_suv$tot)
mean(mpg_compact$tot)

# 15-2
## Q1
class(mpg$drv)

## Q2
mpg$drv <- as.factor(mpg$drv)
class(mpg$drv)

## Q3
levels(mpg$drv)
