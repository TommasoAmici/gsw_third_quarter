# AUTHOR: TOMMASO AMICI
players_combined <- read.csv("~/R/third_quarter_gsw/players_combined.csv", sep=";")

# get third quarter values
third <- players_combined[players_combined$GROUP_VALUE==3,]

library(ggplot2)
# offense
ggplot(third, aes(x = DISPLAY_FIRST_LAST, y = PTS, fill = AST)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Points per game in the third quarter")+
  xlab("Players") +
  ggtitle("Points and assists in Q3")
# defense
ggplot(third, aes(x = DISPLAY_FIRST_LAST, y = STL, fill = DREB)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Steals per game in the third quarter")+
  xlab("Players") +
  ggtitle("Steals and defensive rebounds in Q3")
# fouls
ggplot(third, aes(x = DISPLAY_FIRST_LAST, y = PFD, fill = PF)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Fouls drawn per game in the third quarter")+
  xlab("Players") +
  ggtitle("Fouls drawn and fouls committed in Q3")

# minutes
ggplot(third, aes(x = DISPLAY_FIRST_LAST, y = MIN, fill= PLUS_MINUS)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Minutes per game in the third quarter")+
  xlab("Players")


# plus minus
ggplot(third, aes(x = DISPLAY_FIRST_LAST, y = PLUS_MINUS)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Plus/minus in the third quarter")+
  xlab("Players") +
  ggtitle("Plus/minus in Q3")


# offense
ggplot(players_combined, aes(x = DISPLAY_FIRST_LAST, y = PTS, fill = AST)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Points per game")+
  xlab("Players")
ggplot(players_combined, aes(x = GROUP_VALUE, y = PTS, fill = DISPLAY_FIRST_LAST, label = DISPLAY_FIRST_LAST)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = ifelse((PTS > 5), PTS, "")),
                               size = 3, position = position_stack(vjust = 0.5)) +
  xlab("Quarters") +
  ggtitle("Points per quarter by player")

# defense
ggplot(players_combined, aes(x = DISPLAY_FIRST_LAST, y = STL, fill = DREB)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Steals per game")+
  xlab("Players")
# fouls
ggplot(players_combined, aes(x = DISPLAY_FIRST_LAST, y = PFD, fill = PF)) +
  geom_bar(position = position_stack(), stat = "identity", width = .7) +
  coord_flip()+
  ylab("Fouls drawn per game")+
  xlab("Players")
