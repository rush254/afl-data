WITH ranked_games AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY Team ORDER BY Date) AS game_rank
    FROM
        afl_data.combined_features
),
ema_calculation AS (
    SELECT
        rg.*,
        AVG(Score) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_score_5,
        AVG(Goals) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_goals_5,
        AVG(Behinds) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_behinds_5,
        AVG(OpponentScore) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_opponent_score_5,
        AVG(OpponentGoals) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_opponent_goals_5,
        AVG(OpponentBehinds) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_opponent_behinds_5,
        AVG(score_margin) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_score_margin_5,
        AVG(disposals) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_disposals_5,
        AVG(kicks) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_kicks_5,
        AVG(handballs) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_handballs_5,
        AVG(hitouts) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_hitouts_5,
        AVG(tackles) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_tackles_5,
        AVG(rebounds) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_rebounds_5,
        AVG(inside50s) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_inside50s_5,
        AVG(clearances) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_clearances_5,
        AVG(contested_possessions) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_contested_possessions_5,
        AVG(uncontested_possessions) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_uncontested_possessions_5,
        AVG(contested_marks) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_contested_marks_5,
        AVG(marks_inside50) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_marks_inside50_5,
        AVG(one_percenters) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_one_percenters_5,
        AVG(goal_assists) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING) AS ema_goal_assists_5,
        AVG(Score) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_score_10,
        AVG(Goals) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_goals_10,
        AVG(Behinds) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_behinds_10,
        AVG(OpponentScore) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_opponent_score_10,
        AVG(OpponentGoals) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_opponent_goals_10,
        AVG(OpponentBehinds) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_opponent_behinds_10,
        AVG(score_margin) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_score_margin_10,
        AVG(disposals) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_disposals_10,
        AVG(kicks) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_kicks_10,
        AVG(handballs) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_handballs_10,
        AVG(hitouts) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_hitouts_10,
        AVG(tackles) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_tackles_10,
        AVG(rebounds) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_rebounds_10,
        AVG(inside50s) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_inside50s_10,
        AVG(clearances) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_clearances_10,
        AVG(contested_possessions) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_contested_possessions_10,
        AVG(uncontested_possessions) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_uncontested_possessions_10,
        AVG(contested_marks) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_contested_marks_10,
        AVG(marks_inside50) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_marks_inside50_10,
        AVG(one_percenters) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_one_percenters_10,
        AVG(goal_assists) OVER (PARTITION BY Team ORDER BY game_rank ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS ema_goal_assists_10
    FROM
        ranked_games rg
)
SELECT
    *
FROM
    ema_calculation
ORDER BY
    Team, Date;
