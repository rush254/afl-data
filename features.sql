-- Subquery to calculate the previous game date for each team
WITH previous_games AS (
    SELECT
        GameId,
        Date,
        HomeTeam,
        AwayTeam,
        LAG(Date) OVER (PARTITION BY HomeTeam ORDER BY Date) AS previous_home_game_date,
        LAG(Date) OVER (PARTITION BY AwayTeam ORDER BY Date) AS previous_away_game_date
    FROM
        afl_data.games
)

-- Main query to include rest days
SELECT 
    g.GameId,
    g.Date,
    g.Year,
    CASE WHEN Round IN ('QF', 'SF', 'PF', 'GF') THEN 1 ELSE 0 END AS playoff_final,
    IFNULL(Rainfall, 0) AS Rainfall,
    Venue,
    TRUE AS HomeGame,
    g.HomeTeam AS Team,
    g.AwayTeam AS Opponent,
    CASE WHEN HomeTeamScore > AwayTeamScore THEN 1 ELSE 0 END AS Win,
    HomeTeamScore AS Score,
    CAST(SPLIT(CAST(HomeTeamScoreFT AS STRING), '.')[safe_ordinal(1)] AS INT) AS Goals,
    CAST(SPLIT(CAST(HomeTeamScoreFT AS STRING), '.')[safe_ordinal(2)] AS INT) AS Behinds,
    AwayTeamScore AS OpponentScore,
    CAST(SPLIT(CAST(AwayTeamScoreFT AS STRING), '.')[safe_ordinal(1)] AS INT) AS OpponentGoals,
    CAST(SPLIT(CAST(AwayTeamScoreFT AS STRING), '.')[safe_ordinal(2)] AS INT) AS OpponentBehinds,
    (HomeTeamScore - AwayTeamScore) AS score_margin,
    DATE_DIFF(g.Date, previous_home_game_date, DAY) AS home_rest_days,
    DATE_DIFF(g.Date, previous_away_game_date, DAY) AS away_rest_days
FROM
    previous_games
JOIN
    afl_data.games g
ON
    previous_games.GameId = g.GameId

UNION ALL

SELECT 
    g.GameId,
    g.Date,
    g.Year,
    CASE WHEN Round IN ('QF', 'SF', 'PF', 'GF') THEN 1 ELSE 0 END AS playoff_final,
    IFNULL(Rainfall, 0) AS Rainfall,
    Venue,
    FALSE AS HomeGame,
    g.AwayTeam AS Team,
    g.HomeTeam AS Opponent,
    CASE WHEN AwayTeamScore > HomeTeamScore THEN 1 ELSE 0 END AS Win,
    AwayTeamScore AS Score,
    CAST(SPLIT(CAST(AwayTeamScoreFT AS STRING), '.')[safe_ordinal(1)] AS INT) AS Goals,
    CAST(SPLIT(CAST(AwayTeamScoreFT AS STRING), '.')[safe_ordinal(2)] AS INT) AS Behinds,
    HomeTeamScore AS OpponentScore,
    CAST(SPLIT(CAST(HomeTeamScoreFT AS STRING), '.')[safe_ordinal(1)] AS INT) AS OpponentGoals,
    CAST(SPLIT(CAST(HomeTeamScoreFT AS STRING), '.')[safe_ordinal(2)] AS INT) AS OpponentBehinds,
    (AwayTeamScore - HomeTeamScore) AS score_margin,
    DATE_DIFF(g.Date, previous_away_game_date, DAY) AS home_rest_days,
    DATE_DIFF(g.Date, previous_home_game_date, DAY) AS away_rest_days
FROM
    previous_games
JOIN
    afl_data.games g
ON
    previous_games.GameId = g.GameId;
