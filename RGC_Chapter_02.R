library(ggplot2)

# 散点图

plot(mtcars$wt, mtcars$mpg)

qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data = mtcars)

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

# 折线图

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure/2, col = "red")
points(pressure$temperature, pressure$pressure/2, col = "red")

qplot(pressure$temperature, pressure$pressure, geom = "line")
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()

qplot(pressure$temperature, pressure$pressure, geom = c("line", "point"))
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()

#  条形图 

barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl)
