# AUTHOR: TOMMASO AMICI
# import data from disk
library(readxl)
gsw_periods <- read_excel("Python/gsw_periods.xlsx")

gsw_periods$fg_pct_detrend <- gsw_periods$FG_PCT - gsw_periods$AVG_FG_PCT
gsw_periods$fg3_pct_detrend <- gsw_periods$FG3_PCT - gsw_periods$AVG_FG3_PCT
gsw_periods$ft_pct_detrend <- gsw_periods$FT_PCT - gsw_periods$AVG_FT_PCT
gsw_periods$stl_detrend <- gsw_periods$STL - gsw_periods$STL__1
gsw_periods$ast_detrend <- gsw_periods$AST - gsw_periods$AST__1
gsw_periods$tov_detrend <- gsw_periods$TOV - gsw_periods$TOV__1
gsw_periods$pts_detrend <- gsw_periods$PTS - gsw_periods$PTS__1
gsw_periods$pf_detrend <- gsw_periods$PF - gsw_periods$PF__1
gsw_periods$pfd_detrend <- gsw_periods$PFD - gsw_periods$PFD__1


# plot graphs
library(ggplot2)
# PTS up
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=PTS, group=PERIOD, colour=PERIOD, label=PTS)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label=ifelse((GROUP_VALUE == "2017-18"), as.character(PTS), "")), 
            hjust = 1, vjust = -0.5) +
  xlab("Season") + ylab("Points")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=pts_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Points detrended")

# FG%
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=FG_PCT, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FG%")
# FG% up on trend
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=fg_pct_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FG% detrended")
# average number of FGA
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=FGA, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Attempted FG")


# FG3% and attempted
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=FG3_PCT, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FG3%")

ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=FG3A, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Attempted 3-pointers")

# FT% and attempted
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=FT_PCT, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FT%")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=FTA, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("FTA")

# rebounds
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=OREB, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Offensive REB")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=DREB, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Defensive REB")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=REB, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("REB")

# assists and turnovers
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=AST, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Assists")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=ast_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Assists")
# turnovers average in Q3
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=TOV, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Turnovers")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=tov_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Turnovers")

# steals and blocks
# blocks not interesting, hardly any change
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=BLK, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Blocks")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=BLKA, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Blocks attempted")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=STL, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Steals")
# steals way up in Q3
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=stl_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Steals")

# FOULS a bit more than usual
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=PF, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("PF")
ggplot(data=gsw_periods, aes(x=GROUP_VALUE, y=pf_detrend, group=PERIOD, colour=PERIOD)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("PF detrended")
