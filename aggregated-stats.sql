
SELECT
    GameId,
    Team,
    SUM(Disposals) AS disposals,
    SUM(Kicks) AS kicks,
    SUM(Handballs) AS handballs,
    SUM(HitOuts) AS hitouts,
    SUM(Tackles) AS tackles,
    SUM(Rebounds) AS rebounds,
    SUM(Inside50s) AS inside50s,
    SUM(Clearances) AS clearances,
    SUM(ContestedPossessions) AS contested_possessions,
    SUM(UncontestedPossessions) AS uncontested_possessions,
    SUM(ContestedMarks) AS contested_marks,
    SUM(MarksInside50) AS marks_inside50,
    SUM(OnePercenters) AS one_percenters,
    SUM(GoalAssists) AS goal_assists
FROM
    `afl_data.stats`
GROUP BY
    GameId, Team

