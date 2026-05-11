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

-- Q15: Select the average salary of employees in each department.
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- Q16: Select the highest salary in each department.
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- Q17: Select employees hired in the last 2 years.
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Q18: Select the total salary of all employees.
SELECT SUM(salary) AS total_salary
FROM Employee;

-- Q19: Select the average salary of employees.
SELECT AVG(salary) AS average_salary
FROM Employee;

-- Q20: Select the minimum salary in the Employee table.
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- Q21: Select the number of employees in each department.
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- Q22: Select the total salary for each department.
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- Q23: Select the average age of employees in each department.
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- Q24: Select the number of employees hired in each year.
SELECT YEAR(hire_date) AS hire_year,
COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date);

-- Q25: Select the department with the highest average salary.
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- Q26: Select departments with more than 2 employees.
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Q27: Select departments with an average salary greater than 55000.
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Q28: Select years with more than 1 employee hired.
SELECT YEAR(hire_date) AS hire_year,
COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- Q29: Select departments with a total salary expense less than 100000.
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- Q30: Select departments with the maximum salary above 75000.
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- Q31: Select all employees ordered by salary ascending.
SELECT * FROM Employee
ORDER BY salary ASC;

-- Q32: Select all employees ordered by age descending.
SELECT * FROM Employee
ORDER BY age DESC;

-- Q33: Select all employees ordered by hire date ascending.
SELECT * FROM Employee
ORDER BY hire_date ASC;

-- Q34: Select employees ordered by department and salary.
SELECT * FROM Employee
ORDER BY department_id, salary;

-- Q35: Select departments ordered by total salary.
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

-- Q36: Select employee names along with department names.
SELECT e.name AS employee_name,
d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- Q37: Select project names with department names.
SELECT p.name AS project_name,
d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

-- Q38: Select employee names and corresponding project names.
SELECT e.name AS employee_name,
p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- Q39: Select all employees and their departments including NULL.
SELECT e.name, d.name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- Q40: Select all departments and their employees.
SELECT d.name, e.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- Q41: Select employees not assigned to any project.
SELECT e.name
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- Q42: Select employees and number of projects in department.
SELECT e.name,
COUNT(p.project_id) AS project_count
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.emp_id;

-- Q43: Select departments with no employees.
SELECT d.name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- Q44: Select employees sharing same department as John Doe.
SELECT name
FROM Employee
WHERE department_id = (
SELECT department_id
FROM Employee
WHERE name = 'John Doe'
);

-- Q45: Select department name with highest average salary.
SELECT d.name, AVG(e.salary) AS avg_salary
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
GROUP BY d.name
ORDER BY avg_salary DESC
LIMIT 1;

-- Q46: Select the employee with the highest salary.
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- Q47: Select employees whose salary is above the average salary.
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- Q48: Select the second highest salary from the Employee table.
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- Q49: Select the department with the most employees.
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

-- Q50: Select employees who earn more than the average salary of their department.
SELECT e1.*
FROM Employee e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- Q51: Select the nth highest salary (example: 3rd highest).
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- Q52: Select employees older than all employees in the HR department.
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = 2
);

-- Q53: Select departments where the average salary is greater than 55000.
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Q54: Select employees who work in a department with at least 2 projects.
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(project_id) >= 2
);

-- Q55: Select employees hired on the same date as Jane Smith.
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

-- Q56: Select the total salary of employees hired in 2020.
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- Q57: Select average salary of employees in each department ordered descending.
SELECT department_id,
AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC;

-- Q58: Select departments with more than 1 employee and average salary > 55000.
SELECT department_id,
COUNT(*) AS employee_count,
AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

-- Q59: Select employees hired in last 2 years ordered by hire date.
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

-- Q60: Select total employees and average salary for departments with >2 employees.
SELECT department_id,
COUNT(*) AS total_employees,
AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Q61: Select employees whose salary is above department average salary.
SELECT e1.name, e1.salary
FROM Employee e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- Q62: Select employees hired on same date as oldest employee.
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employee
);

-- Q63: Select department names with total number of projects ordered descending.
SELECT d.name,
COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY total_projects DESC;

-- Q64: Select employee with highest salary in each department.
SELECT d.name,
COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY total_projects DESC;

-- Q65: Select names and salaries of employees older than department average age.
SELECT name, salary
FROM Employee e1
WHERE age > (
    SELECT AVG(age)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);
