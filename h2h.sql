SELECT
        g1.GameId,
        g1.Team,
        g1.Opponent,
        g1.Date,
        SUM(CASE WHEN g2.Team = g1.Team AND g2.Opponent = g1.Opponent AND g2.Date < g1.Date AND g2.Win = 1 THEN 1 ELSE 0 END) AS wins_against_opponent,
        SUM(CASE WHEN g2.Team = g1.Team AND g2.Opponent = g1.Opponent AND g2.Date < g1.Date THEN 1 ELSE 0 END) AS total_games_against_opponent
    FROM
        afl_data.features g1
    LEFT JOIN
        afl_data.features g2 ON g1.Team = g2.Team AND g1.Opponent = g2.Opponent
    GROUP BY
        g1.GameId, g1.Team, g1.Opponent, g1.Date