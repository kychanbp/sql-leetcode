/*
 ManagerId is also employee id
 
 Join the table with itself and compare the salary

 but using CTE looks a bit slow
 */
WITH base AS (
    SELECT emp_1.Name,
        emp_1.Salary AS emp_salary,
        emp_2.Salary as manager_salary
    FROM Employee as emp_1
        LEFT JOIN Employee as emp_2 ON emp_1.ManagerId = emp_2.Id
)
SELECT base.Name as Employee
FROM base
WHERE emp_salary > manager_salary;

/*
faster solution
*/

SELECT emp_1.name as Employee
FROM Employee AS emp_1
    LEFT JOIN Employee AS emp_2 on emp_2.Id = emp_1.ManagerId
WHERE emp_1.salary > emp_2.salary