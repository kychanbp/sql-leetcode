/*
if the previous num = current num
and
the next num = current num
then
it appears at least three times consecutively
*/

WITH base AS (
    SELECT *,
        Lag(Num) over (order by Id) AS pre,
        Lead(Num) over (order by Id) AS post
    FROM Logs
)
SELECT distinct Num AS ConsecutiveNums
FROM base
WHERE pre = Num and post = Num;