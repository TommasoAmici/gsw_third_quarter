# AUTHOR: TOMMASO AMICI
opponents <- read.csv("~/R/third_quarter_gsw/opponents.csv")
# add label for periods
periods <- opponents[7:30,]
periods$quarters = rep(c("Q1", "Q2", "Q3", "Q4"), each = 6)

opponents_by_conf <- read.csv("~/R/third_quarter_gsw/opponents_by_conf.csv")
periods_conf <- opponents_by_conf[3:10,]
periods_conf$quarters = rep(c("Q1", "Q2", "Q3", "Q4"), each = 2)
# change column name
colnames(periods_conf)[3] <- "Conference"

library(ggplot2)

ggplot(data=periods_conf, aes(x=quarters, y=PTS, fill=Conference)) +
  geom_bar(stat="identity", position=position_dodge()) +
  xlab("Quarters") +
  ylab("Points")

ggplot(data=periods_conf, aes(x=quarters, y=FGM, fill=Conference)) +
  geom_bar(stat="identity", position=position_dodge()) +
  xlab("Quarters") +
  ylab("Field goals made")

ggplot(data=periods_conf, aes(x=quarters, y=AST, fill=Conference)) +
  geom_bar(stat="identity", position=position_dodge()) +
  xlab("Quarters") +
  ylab("Assists")

ggplot(data=periods_conf, aes(x=quarters, y=PLUS_MINUS, fill=Conference)) +
  geom_bar(stat="identity", position=position_dodge()) +
  xlab("Quarters") +
  ylab("Plus/Minus") +
  ggtitle("Plus/minus per quarter")

ggplot(data=periods_conf, aes(x=quarters, y=FG_PCT, fill=Conference)) +
  geom_bar(stat="identity", position=position_dodge()) +
  xlab("Quarters") +
  scale_y_continuous(labels = percent_format()) +
  ylab("FG%")

ggplot(data=periods_conf, aes(x=quarters, y=FG3_PCT, fill=Conference)) +
  geom_bar(stat="identity", position=position_dodge()) +
  xlab("Quarters") +
  scale_y_continuous(labels = percent_format()) +
  ylab("FG3%") +
  ggtitle("FG3% per quarter")