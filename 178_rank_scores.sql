SELECT score,
    dense_rank() over (
        order by Score desc
    ) AS "RANK"
FROM Scores;