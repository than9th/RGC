install.packages("gglot2", "gcookbook")
library(ggplot2)
install.packages("gcookbook")
library(gcookbook)

data <- read.csv("datafile.csv")

# 手动为列名赋值
names(data) <- c("Column1", "Column2", "Column3")

data <- read.csv("datafile.csv", sep = "\t")
