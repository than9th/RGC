library(ggplot2)
library(gcookbook)

# 2.1 散点图

plot(mtcars$wt, mtcars$mpg)

qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data = mtcars)

ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

# 2.2 折线图

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure / 2, col = "red")
points(pressure$temperature, pressure$pressure / 2, col = "red")

qplot(pressure$temperature, pressure$pressure, geom = "line")
ggplot(pressure, aes(x = temperature, y = pressure)) + geom_line()

qplot(pressure$temperature,
      pressure$pressure,
      geom = c("line", "point"))
ggplot(pressure, aes(x = temperature, y = pressure)) + geom_line() + geom_point()

# 2.3 条形图

barplot(BOD$demand, names.arg = BOD$Time)

table(mtcars$cyl)
barplot(table(mtcars$cyl))

qplot(BOD$Time, BOD$demand, geom = "bar", stat = "identity") # Error: stat_count() must not be used with a y aesthetic.
qplot(factor(BOD$Time),
      BOD$demand,
      geom = "bar",
      stat = "identity") # Error: stat_count() must not be used with a y aesthetic.

ggplot(BOD, aes(x = Time, y = demand)) + geom_bar(stat = "identity")
ggplot(BOD, aes(factor(x = Time), y = demand)) + geom_bar(stat = "identity")

qplot(mtcars$cyl)
qplot(factor(mtcars$cyl))

ggplot(mtcars, aes(x = cyl)) + geom_bar()
ggplot(mtcars, aes(factor(x = cyl))) + geom_bar()

# 2.4 直方图

hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10)

qplot(mtcars$mpg)
qplot(mtcars$mpg, binwidth = 4)

ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth = 4)

# 2.5 箱线图

plot(ToothGrowth$supp, ToothGrowth$len)
boxplot(len ~ supp, data = ToothGrowth)
boxplot(len ~ supp + dose, data = ToothGrowth)

qplot(supp, len, data = ToothGrowth, geom = "boxplot")
qplot(interaction(supp, dose), len, data = ToothGrowth, geom = "boxplot")

ggplot(ToothGrowth, aes(x = supp, y = len)) + geom_boxplot()
ggplot(ToothGrowth, aes(x = interaction(supp, dose), y = len)) + geom_boxplot()

# 2.6 函数图像

curve(x ^ 3 - 5 * x, from = -4, to = 4)

myfun <- function(xvar) {
  1 / (1 + exp(-xvar + 10))
}

curve(myfun(x), from = 0, to = 20)
curve(1 - myfun(x), add = TRUE, col = "red")

qplot(c(0, 20),
      fun = myfun,
      stat = "function",
      geom = "line") # Error: geom_line requires the following missing aesthetics: y

ggplot(data.frame(x = c(0, 20)), aes(x = x)) + stat_function(fun = myfun, geom = "line")
