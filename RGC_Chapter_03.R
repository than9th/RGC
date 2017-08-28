library(ggplot2)
library(gcookbook)

# 3.1 简单条形图
BOD
str(BOD)

ggplot(BOD, aes(x = Time, y = demand)) + geom_bar(stat = "identity")
ggplot(BOD, aes(factor(x = Time), y = demand)) + geom_bar(stat = "identity")

ggplot(pg_mean, aes(x = group, y = weight)) + geom_bar(stat = "identity")
ggplot(pg_mean, aes(x = group, y = weight)) + geom_bar(stat = "identity", fill = "lightblue", color = "black")


# 3.2 簇状条形图
cabbage_exp

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_bar(position = "dodge", stat = "identity")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_bar(position = "dodge", stat = "identity", colour = "black") + scale_fill_brewer(palette = "Pastel1")

# 3.3 频数条形图
diamonds

ggplot(diamonds, aes(x = cut)) + geom_bar()
ggplot(diamonds, aes(x = carat)) + geom_bar()
ggplot(diamonds, aes(x = carat)) + geom_histogram()

# 3.4 条形图着色
uspopchange
upc <- subset(uspopchange, rank(Change)>40)
upc

ggplot(upc, aes(x = Abb, y = Change, fill = Region)) + geom_bar(stat = "identity")
ggplot(upc, aes(x = Abb, y = Change, fill = Region)) + geom_bar(stat = "identity", color = "black") + scale_color_brewer("#669933", "#FFCC66") + xlab("State")
ggplot(upc, aes(
  x = reorder(Abb, Change),
  y = Change,
  fill = Region
)) + geom_bar(stat = "identity", color = "black") + scale_color_brewer("#669933", "#FFCC66") + xlab("State")

# 3.5 条形图正负着色
climate
head(climate)
csub <- subset(climate, Source == "Berkeley" & Year >= 1900)
csub
head(csub)
csub$pos <- csub$Anomaly10y >= 0
head(csub)

ggplot(csub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_bar(stat = "identity", position = "identity")
ggplot(csub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_bar(
  stat = "identity",
  position = "identity",
  color = "black",
  size = 0.25
) + scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"), guide = FALSE)

# 3.6 条形图调整宽度和间距

# 3.7 堆积条形图

# 3.8 百分比条形图

# 3.9 数据标签

# 3.10 Clevelan点图