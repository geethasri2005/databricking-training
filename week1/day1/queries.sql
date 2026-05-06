-- Q1: Display all employees
SELECT * FROM Employee;

-- Q2: Display employee names and salaries
SELECT name, salary FROM Employee;

-- Q3: Find employees older than 30
SELECT * FROM Employee WHERE age > 30;

-- Q4: Find employees who work in IT department
SELECT * FROM Employee WHERE department_id = 1;

-- Q5: Count total number of employees
SELECT COUNT(*) AS total_employees FROM Employee;

-- Q6: Find average salary of employees
SELECT AVG(salary) AS avg_salary FROM Employee;

-- Q7: Find highest salary
SELECT MAX(salary) AS highest_salary FROM Employee;

-- Q8: Sort employees by salary (descending)
SELECT * FROM Employee ORDER BY salary DESC;

-- Q9: Join Employee and Department (show employee name + department name)
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- Q10: Find employees with no department
SELECT * FROM Employee WHERE department_id IS NULL;

-- Q11: Find employees whose name starts with 'J'
SELECT * FROM Employee WHERE name LIKE 'J%';

-- Q12: Find employees whose name contains 'a'
SELECT * FROM Employee WHERE name LIKE '%b%';

-- Q13: Find employees hired after 2020
SELECT * FROM Employee WHERE hire_date > '2020-01-01';

-- Q14: Find employees hired before 2019
SELECT * FROM Employee WHERE hire_date < '2019-01-01';

-- Q15: Find total salary of all employees
SELECT SUM(salary) AS total_salary FROM Employee;
