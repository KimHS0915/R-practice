library(ggplot2)

# Q1
ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()
