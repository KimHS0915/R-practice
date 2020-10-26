# 12-1
install.packages("plotly")
library(plotly)
library(ggplot2)

plot_mpg <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
plot_mpg
ggplotly(plot_mpg)

plot_diamonds <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")
plot_diamonds
ggplotly(plot_diamonds)

# 12-2
install.packages("dygraphs")
library(dygraphs)

economics <- ggplot2::economics
head(economics)

library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)
dygraph(eco) %>% dyRangeSelector()

eco_a <- xts(economics$psavert, order.by = economics$date)
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemply")
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
