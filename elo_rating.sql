-- Create team ratings table with initial ratings
CREATE OR REPLACE TABLE afl_data.team_ratings AS
SELECT DISTINCT team, 1500.0 AS rating FROM (
  SELECT HomeTeam AS team FROM afl_data.games
  UNION DISTINCT
  SELECT AwayTeam AS team FROM afl_data.games
);

-- Recursive CTE for Elo ratings
with recursive elo_ratings AS (
    -- Base case: starting with initial ratings
    SELECT
        g.GameID,
        g.Date,
        g.HomeTeam,
        g.AwayTeam,
        g.HomeTeamScore,
        g.AwayTeamScore,
        g.game_order,
        tr1.rating AS team1_rating,
        tr2.rating AS team2_rating,
        tr1.rating AS new_team1_rating,
        tr2.rating AS new_team2_rating
    FROM
        afl_data.ordered_games g
        JOIN afl_data.team_ratings tr1 ON g.HomeTeam = tr1.team
        JOIN afl_data.team_ratings tr2 ON g.AwayTeam = tr2.team
    WHERE
        g.game_order = 1
    
    UNION ALL
    
    -- Recursive case: calculate new ratings based on the previous match
    SELECT
        g.GameID,
        g.Date,
        g.HomeTeam,
        g.AwayTeam,
        g.HomeTeamScore,
        g.AwayTeamScore,
        g.game_order,
        prev.new_team1_rating AS team1_rating,
        prev.new_team2_rating AS team2_rating,
        prev.new_team1_rating + 32 * (IF(g.HomeTeamScore > g.AwayTeamScore, 1, 0) - 1 / (1 + POWER(10, (prev.new_team2_rating - prev.new_team1_rating) / 400))) AS new_team1_rating,
        prev.new_team2_rating + 32 * (IF(g.AwayTeamScore > g.HomeTeamScore, 1, 0) - 1 / (1 + POWER(10, (prev.new_team1_rating - prev.new_team2_rating) / 400))) AS new_team2_rating
    FROM
        afl_data.ordered_games g
        JOIN elo_ratings prev ON g.game_order = prev.game_order + 1
)
SELECT * FROM elo_ratings
ORDER BY game_order;
