SELECT
    g.*,
    COALESCE(h.wins_against_opponent / NULLIF(h.total_games_against_opponent, 0), 0) AS h2h_win_ratio,
    a.disposals,
    a.kicks,
    a.handballs,
    a.hitouts,
    a.tackles,
    a.rebounds,
    a.inside50s,
    a.clearances,
    a.contested_possessions,
    a.uncontested_possessions,
    a.contested_marks,
    a.marks_inside50,
    a.one_percenters,
    a.goal_assists
FROM
    afl_data.aggregated_stats a
LEFT JOIN
    afl_data.features g
ON
    a.GameId = g.GameId
AND
    a.Team = g.Team
LEFT JOIN
    afl_data.h2h h
ON
    a.GameId = h.GameId
AND
    a.Team = h.Team;
