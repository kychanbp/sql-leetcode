WITH order_cnt AS (
    SELECT CustomerId, count(Id) as cnt
    FROM Orders
    GROUP BY CustomerId
),
base AS (
    SELECT *
    FROM Customers
    LEFT JOIN order_cnt on Customers.Id = order_cnt.CustomerId
)
SELECT Name as 'Customers'
FROM base
WHERE cnt is NULL