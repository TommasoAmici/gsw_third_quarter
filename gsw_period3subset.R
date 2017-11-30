# AUTHOR: TOMMASO AMICI
# import data from disk
library(readxl)
gsw_periods <- read_excel("R/third_quarter_gsw/gsw_periods.xlsx")

# subset last six years
years_2012_17 <- gsw_periods[65:88,]
# extract change from trend
years_2012_17$fg_pct_detrend <- years_2012_17$FG_PCT - years_2012_17$AVG_FG_PCT
years_2012_17$fg3_pct_detrend <- years_2012_17$FG3_PCT - years_2012_17$AVG_FG3_PCT
years_2012_17$ft_pct_detrend <- years_2012_17$FT_PCT - years_2012_17$AVG_FT_PCT
years_2012_17$stl_detrend <- years_2012_17$STL - years_2012_17$STL__1
years_2012_17$ast_detrend <- years_2012_17$AST - years_2012_17$AST__1
years_2012_17$tov_detrend <- years_2012_17$TOV - years_2012_17$TOV__1
years_2012_17$pts_detrend <- years_2012_17$PTS - years_2012_17$PTS__1
years_2012_17$pf_detrend <- years_2012_17$PF - years_2012_17$PF__1
years_2012_17$pfd_detrend <- years_2012_17$PFD - years_2012_17$PFD__1

# plot graphs
library(ggplot2)
library(scales)
# PTS up
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=PTS, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label=ifelse((GROUP_VALUE == "2017-18"), as.character(PTS), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("Points") +
  ggtitle("Points per quarter")

ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=pts_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label=ifelse((GROUP_VALUE == "2017-18"), as.character(round(pts_detrend, digits = 2)), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("Points detrended")

# FG%
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=FG_PCT, group=PERIOD, colour=PERIOD, label = FG_PCT)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = ifelse((GROUP_VALUE == "2017-18"), 
                               paste(as.character(round(100*FG_PCT, digits = 2)), "%", sep = ""), "")), 
            hjust = 1, vjust = -0.5) +
  scale_y_continuous(labels = percent_format()) +
  xlab("Season") + ylab("FG%") +
  ggtitle("FG% per quarter")
# FG% up on trend
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=fg_pct_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  scale_y_continuous(labels = percent_format()) +
  geom_text(aes(label = ifelse((GROUP_VALUE == "2017-18"), 
                               paste(as.character(round(100*fg_pct_detrend, digits = 2)), "%", sep = ""), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("FG% detrended")
# average number of FGA
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=FGA, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Attempted FG")


# FG3% and attempted
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=FG3_PCT, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = ifelse((GROUP_VALUE == "2017-18"), 
                               paste(as.character(round(100*FG3_PCT, digits = 2)), "%", sep = ""), "")), 
            hjust = 1, vjust = 0) +
  scale_y_continuous(labels = percent_format()) +
  xlab("Season") + ylab("FG3%") +
  ggtitle("FG3% per quarter")

# FG3% detrended
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=fg3_pct_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  scale_y_continuous(labels = percent_format()) +
  geom_text(aes(label = ifelse((GROUP_VALUE == "2017-18"), 
                               paste(as.character(round(100*fg3_pct_detrend, digits = 2)), "%", sep = ""), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("FG3% detrended") +
  ggtitle("FG3% variation on trend")

ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=FG3A, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Attempted 3-pointers")

# FT% and attempted
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=FT_PCT, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FT%")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=FTA, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FTA")

# rebounds
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=OREB, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Offensive REB")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=DREB, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Defensive REB")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=REB, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("REB")

# assists and turnovers
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=AST, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Assists")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=ast_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Assists")
# turnovers average in Q3
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=TOV, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Turnovers")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=tov_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Turnovers")

# steals and blocks
# blocks not interesting, hardly any change
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=BLK, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Blocks")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=BLKA, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Blocks attempted")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=STL, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Steals")
# steals way up in Q3
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=stl_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = ifelse((GROUP_VALUE == "2017-18"), 
                                as.character(round(stl_detrend, digits = 3)), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("Steals")+
  ggtitle("Steals: variation on trend in Q3")

# FOULS a bit more than usual
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=PF, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("PF")
ggplot(data=years_2012_17, aes(x=GROUP_VALUE, y=pf_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = ifelse((GROUP_VALUE == "2017-18"), 
                                as.character(round(pf_detrend, digits = 2)), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("PF detrended")
