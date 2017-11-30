# AUTHOR: TOMMASO AMICI
import pandas as pd
import numpy
import matplotlib.pyplot as plt
import nba_py as np
import json
from nba_py.constants import TEAMS
from nba_py import team
from nba_py import game
from nba_py import player

# Third_quarter.py grabs all the information necessary from stats.nba.com
# using nba_py and saves it to .csv files.
# The actual analysis and all the visualizations are in the R files.

# get players stats for each quarter
warr = team.TeamCommonRoster(1610612744, season='2017-18')
players_ids = warr.roster()["PLAYER_ID"]
splits = []
players_summaries = [] 
for pid in players_ids:
    print("Erorre qui")
    players_summaries.append(player.PlayerSummary(pid).info())
    splits.append(player.PlayerInGameSplits(pid, season="2017-18", period="0"))
print("Errore qua")
first = True
for split in splits:
    if first:
        split.by_period().to_csv('players_splits.csv', mode='a', header=True)
        first = False
    else:
        split.by_period().to_csv('players_splits.csv', mode='a', header=False)
first = True
for summary in players_summaries:
    if first:
        summary.to_csv('players_summaries.csv', mode='a', header=True)
        first = False
    else:
        summary.to_csv('players_summaries.csv', mode='a', header=False)



# get year on year data by quarter
team_yoy = team.TeamYearOverYearSplits(TEAMS["GSW"]["id"], season='2017-18', period="0")
team_yoy.by_opponent().to_csv('year_over_year.csv', mode='a', header=True)
for i in range(1,5):
    team_yoy = team.TeamYearOverYearSplits(TEAMS["GSW"]["id"], season='2017-18', period=str(i))
    team_yoy.by_opponent().to_csv('year_over_year.csv', mode='a', header=False)


# get stats with information about divisions
# get stats with information about conferences
opponents = team.TeamOpponentSplits(TEAMS["GSW"]["id"], season='2017-18', period="0")
opponents.by_opponent().to_csv('opponents.csv', mode='a', header=True)
opponents.by_conference().to_csv('opponents_by_conf.csv', mode='a', header=True)
for i in range(1,5):
    opponents = team.TeamOpponentSplits(TEAMS["GSW"]["id"], season='2017-18', period=str(i))
    opponents.by_opponent().to_csv('opponents.csv', mode='a', header=False)
    opponents.by_conference().to_csv('opponents_by_conf.csv', mode='a', header=False)
    

# get stats with info about points allowed
opponents = team.TeamPerformanceSplits(TEAMS["GSW"]["id"], season='2017-18', period="0")
opponents.points_against().to_csv('points_against.csv', mode='a', header=True)
for i in range(1,5):
    opponents = team.TeamPerformanceSplits(TEAMS["GSW"]["id"], season='2017-18', period=str(i))
    opponents.points_against().to_csv('points_against.csv', mode='a', header=False)