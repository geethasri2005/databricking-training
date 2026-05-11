-- =========================================
-- SELECT
-- =========================================

-- Q1
SELECT * FROM Employee;

-- Q2
SELECT name, salary FROM Employee;

-- Q3
SELECT name, department FROM Employee;

-- Q4
SELECT * FROM Employee
WHERE department = 'IT';

-- Q5
SELECT name, experience FROM Employee;

-- =========================================
-- WHERE
-- =========================================

-- Q6
SELECT * FROM Employee
WHERE salary > 70000;

-- Q7
SELECT * FROM Employee
WHERE city = 'Hyderabad';

-- Q8
SELECT * FROM Employee
WHERE experience < 4;

-- Q9
SELECT * FROM Employee
WHERE department = 'Finance';

-- Q10
SELECT * FROM Employee
WHERE salary = 52000;

-- =========================================
-- GROUP BY
-- =========================================

-- Q11
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

-- Q12
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

-- Q13
SELECT city, COUNT(*) AS employee_count
FROM Employee
GROUP BY city;

-- Q14
SELECT department, MAX(salary) AS maximum_salary
FROM Employee
GROUP BY department;

-- Q15
SELECT department, MIN(experience) AS minimum_experience
FROM Employee
GROUP BY department;

-- =========================================
-- HAVING
-- =========================================

-- Q16
SELECT department, COUNT(*) AS employee_count
FROM Employee
GROUP BY department
HAVING COUNT(*) > 3;

-- Q17
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 60000;

-- Q18
SELECT city, COUNT(*) AS employee_count
FROM Employee
GROUP BY city
HAVING COUNT(*) > 2;

-- Q19
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
HAVING SUM(salary) > 200000;

-- Q20
SELECT department, MAX(salary) AS maximum_salary
FROM Employee
GROUP BY department
HAVING MAX(salary) > 90000;

-- =========================================
-- TOP / LIMIT
-- =========================================

-- Q21
SELECT * FROM Employee
ORDER BY salary DESC
LIMIT 5;

-- Q22
SELECT * FROM Employee
ORDER BY experience DESC
LIMIT 3;

-- Q23
SELECT * FROM Employee
WHERE department = 'Finance'
ORDER BY salary DESC
LIMIT 2;

-- Q24
SELECT * FROM Employee
WHERE city = 'Hyderabad'
LIMIT 4;

-- Q25
SELECT * FROM Employee
ORDER BY salary DESC
LIMIT 1;

-- =========================================
-- DISTINCT
-- =========================================

-- Q26
SELECT DISTINCT department FROM Employee;

-- Q27
SELECT DISTINCT city FROM Employee;

-- Q28
SELECT DISTINCT salary FROM Employee;

-- Q29
SELECT DISTINCT department, city
FROM Employee;

-- Q30
SELECT DISTINCT experience FROM Employee;

-- =========================================
-- COMPARISON OPERATORS
-- =========================================

-- Q31
SELECT * FROM Employee
WHERE salary >= 80000;

-- Q32
SELECT * FROM Employee
WHERE experience <= 3;

-- Q33
SELECT * FROM Employee
WHERE salary <> 45000;

-- Q34
SELECT * FROM Employee
WHERE salary < 50000;

-- Q35
SELECT * FROM Employee
WHERE experience > 5;

-- =========================================
-- LOGICAL OPERATORS
-- =========================================

-- Q36
SELECT * FROM Employee
WHERE department = 'IT'
AND salary > 70000;

-- Q37
SELECT * FROM Employee
WHERE city = 'Hyderabad'
OR city = 'Bangalore';

-- Q38
SELECT * FROM Employee
WHERE department = 'HR'
AND experience < 3;

-- Q39
SELECT * FROM Employee
WHERE salary > 60000
OR experience > 6;

-- Q40
SELECT * FROM Employee
WHERE NOT department = 'Sales';

-- =========================================
-- IN AND NOT IN
-- =========================================

-- Q41
SELECT * FROM Employee
WHERE city IN ('Hyderabad', 'Mumbai');

-- Q42
SELECT * FROM Employee
WHERE department IN ('IT', 'Finance');

-- Q43
SELECT * FROM Employee
WHERE city NOT IN ('Chennai', 'Pune');

-- Q44
SELECT * FROM Employee
WHERE salary IN (45000, 75000, 91000);

-- Q45
SELECT * FROM Employee
WHERE department NOT IN ('HR', 'Sales');

-- =========================================
-- BETWEEN
-- =========================================

-- Q46
SELECT * FROM Employee
WHERE salary BETWEEN 50000 AND 80000;

-- Q47
SELECT * FROM Employee
WHERE experience BETWEEN 3 AND 6;

-- Q48
SELECT * FROM Employee
WHERE emp_id BETWEEN 105 AND 112;

-- Q49
SELECT * FROM Employee
WHERE salary NOT BETWEEN 40000 AND 60000;

-- Q50
SELECT * FROM Employee
WHERE experience BETWEEN 2 AND 4;

-- =========================================
-- LIKE OPERATOR
-- =========================================

-- Q51
SELECT * FROM Employee
WHERE name LIKE 'R%';

-- Q52
SELECT * FROM Employee
WHERE name LIKE '%a';

-- Q53
SELECT * FROM Employee
WHERE name LIKE '%v%';

-- Q54
SELECT * FROM Employee
WHERE city LIKE 'B%';

-- Q55
SELECT * FROM Employee
WHERE department LIKE '%s';
