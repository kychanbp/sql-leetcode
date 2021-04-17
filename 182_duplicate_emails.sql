WITH base AS (
SELECT Email, count(id) over (partition by Email) as cnt
FROM Person
)
SELECT distinct Email
FROM base
where cnt > 1

/*
Again this is not fast enough

I found that we can really make good use of the id columns
*/

SELECT distinct p1.Email
FROM Person p1
Inner JOIN Person p2
ON p1.Id <> p2.Id AND p1.Email = p2.Email
-- if id is not the same but email is the same, then duplicated