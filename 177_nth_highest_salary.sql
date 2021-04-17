WITH ranking AS (
    SELECT Id,
        Salary,
        dense_rank() over (
            order by Salary DESC
        ) AS ranking
    FROM Employee
)
SELECT (
        CASE
            WHEN count(Id) > 0 THEN Salary
            ELSE NULL
        END
    ) AS getNthHighestSalary
FROM ranking
where ranking = n