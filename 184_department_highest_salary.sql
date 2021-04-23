WITH highest_salary_tb AS (
    SELECT Employee.Name AS Employee,
        Salary,
        max(Salary) over (partition by DepartmentId) AS max_salary,
        Department.Name AS Department
    From Employee
        LEFT JOIN Department on Employee.DepartmentId = Department.id
)
SELECT Department,
    Employee,
    Salary
FROM highest_salary_tb
WHERE Salary = max_salary
    AND Department is not null --I forgot to add this. There are records doesn't belong to any department.