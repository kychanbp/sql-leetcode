WITH base AS (
    select Id,
        Salary,
        dense_rank() over (
            order by Salary desc
        ) AS ranking
    FROM Employee
)
/*
 The table may contain no second highest
 */
SELECT (
        CASE
            WHEN COUNT(id) >= 1 THEN Salary
            ELSE NULL
        END
    ) AS SecondHighestSalary
FROM base
where ranking = 2;