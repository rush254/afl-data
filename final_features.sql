SELECT
    gameID,
    Date,
    Year,
    playoff_final,
    Rainfall,
    Venue,
    HomeGame,
    Team,
    Opponent,
    Win,
    home_rest_days,
    away_rest_days,
    h2h_win_ratio,
    ema_score_5,
    ema_goals_5,
    ema_behinds_5,
    ema_opponent_score_5,
    ema_opponent_goals_5,
    ema_opponent_behinds_5,
    ema_score_margin_5,
    ema_disposals_5,
    ema_kicks_5,
    ema_handballs_5,
    ema_hitouts_5,
    ema_tackles_5,
    ema_rebounds_5,
    ema_inside50s_5,
    ema_clearances_5,
    ema_contested_possessions_5,
    ema_uncontested_possessions_5,
    ema_contested_marks_5,
    ema_marks_inside50_5,
    ema_one_percenters_5,
    ema_goal_assists_5,
    ema_score_10,
    ema_goals_10,
    ema_behinds_10,
    ema_opponent_score_10,
    ema_opponent_goals_10,
    ema_opponent_behinds_10,
    ema_score_margin_10,
    ema_disposals_10,
    ema_kicks_10,
    ema_handballs_10,
    ema_hitouts_10,
    ema_tackles_10,
    ema_rebounds_10,
    ema_inside50s_10,
    ema_clearances_10,
    ema_contested_possessions_10,
    ema_uncontested_possessions_10,
    ema_contested_marks_10,
    ema_marks_inside50_10,
    ema_one_percenters_10,
    ema_goal_assists_10
FROM
    afl_data.ma_combined_features
WHERE
    gameID IS NOT NULL
    AND Date IS NOT NULL
    AND Year IS NOT NULL
    AND playoff_final IS NOT NULL
    AND Rainfall IS NOT NULL
    AND Venue IS NOT NULL
    AND HomeGame IS NOT NULL
    AND Team IS NOT NULL
    AND Opponent IS NOT NULL
    AND Win IS NOT NULL
    AND home_rest_days IS NOT NULL
    AND away_rest_days IS NOT NULL
    AND h2h_win_ratio IS NOT NULL
    AND ema_score_5 IS NOT NULL
    AND ema_goals_5 IS NOT NULL
    AND ema_behinds_5 IS NOT NULL
    AND ema_opponent_score_5 IS NOT NULL
    AND ema_opponent_goals_5 IS NOT NULL
    AND ema_opponent_behinds_5 IS NOT NULL
    AND ema_score_margin_5 IS NOT NULL
    AND ema_disposals_5 IS NOT NULL
    AND ema_kicks_5 IS NOT NULL
    AND ema_handballs_5 IS NOT NULL
    AND ema_hitouts_5 IS NOT NULL
    AND ema_tackles_5 IS NOT NULL
    AND ema_rebounds_5 IS NOT NULL
    AND ema_inside50s_5 IS NOT NULL
    AND ema_clearances_5 IS NOT NULL
    AND ema_contested_possessions_5 IS NOT NULL
    AND ema_uncontested_possessions_5 IS NOT NULL
    AND ema_contested_marks_5 IS NOT NULL
    AND ema_marks_inside50_5 IS NOT NULL
    AND ema_one_percenters_5 IS NOT NULL
    AND ema_goal_assists_5 IS NOT NULL
    AND ema_score_10 IS NOT NULL
    AND ema_goals_10 IS NOT NULL
    AND ema_behinds_10 IS NOT NULL
    AND ema_opponent_score_10 IS NOT NULL
    AND ema_opponent_goals_10 IS NOT NULL
    AND ema_opponent_behinds_10 IS NOT NULL
    AND ema_score_margin_10 IS NOT NULL
    AND ema_disposals_10 IS NOT NULL
    AND ema_kicks_10 IS NOT NULL
    AND ema_handballs_10 IS NOT NULL
    AND ema_hitouts_10 IS NOT NULL
    AND ema_tackles_10 IS NOT NULL
    AND ema_rebounds_10 IS NOT NULL
    AND ema_inside50s_10 IS NOT NULL
    AND ema_clearances_10 IS NOT NULL
    AND ema_contested_possessions_10 IS NOT NULL
    AND ema_uncontested_possessions_10 IS NOT NULL
    AND ema_contested_marks_10 IS NOT NULL
    AND ema_marks_inside50_10 IS NOT NULL
    AND ema_one_percenters_10 IS NOT NULL
    AND ema_goal_assists_10 IS NOT NULL;