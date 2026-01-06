# Subqueries
/*
- A subquery is a SQL query nested inside a larger query.
- A subquery may occur in:
  • A SELECT clause
  • A FROM clause
  • A WHERE clause
- In MySQL subquery can be nested inside a SELECT, INSERT, UPDATE, DELETE, SET, or DO statement or inside another subquery.
- A subquery is usually added within the WHERE Clause of another SQL SELECT statement.
- You can use the comparison operators, such as >, <, or =. The comparison operator can also be a multiple-row operator, such as IN, ANY, SOME, or ALL.
- A subquery can be treated as an inner query, which is a SQL query placed as a part of another query called as outer query.
- The inner query executes first before its parent query so that the results of the inner query can be passed to the outer query.
*/

USE employees;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT DISTINCT(dept_no) FROM dept_emp;
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

SELECT * FROM departments WHERE dept_no < 'd004';

SELECT DISTINCT dept_no FROM dept_emp; 

SELECT DISTINCT dept_no
FROM dept_emp
WHERE dept_no IN (
    SELECT dept_no
    FROM departments
    WHERE dept_no < 'd004'
);

SELECT * FROM dept_emp WHERE dept_no IN (SELECT dept_no FROM departments WHERE dept_no < 'd004');
----
SELECT * FROM dept_manager;

SELECT dm.emp_no FROM dept_manager dm;

SELECT COUNT(*) FROM dept_manager;

SELECT e.first_name,e.last_name FROM employees e 
WHERE e.emp_no IN (SELECT dm.emp_no FROM dept_manager dm);

SELECT COUNT(*) FROM employees e WHERE e.emp_no IN (SELECT dm.emp_no FROM dept_manager dm);

SELECT COUNT(*) FROM employees e;

SELECT * FROM employees; 

SELECT * FROM dept_manager WHERE emp_no IN (SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '195-01-01');

SELECT a.* FROM (SELECT * FROM dept_manager) a WHERE a.emp_no IN (SELECT (emp_no) FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');

SELECT a.* FROM (SELECT * FROM dept_manager) a WHERE EXISTS (SELECT (emp_no) FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');

SELECT a.* FROM (SELECT * FROM dept_manager) a WHERE EXISTS (SELECT (emp_no) FROM employees WHERE hire_date BETWEEN '2023-01-01' AND '2024-01-01');

# Example - 1 Subqueries - Exists

SELECT e.first_name,e.last_name
FROM employees e
WHERE EXISTS (SELECT dm.emp_no FROM dept_manager dm);

# Example -2 Subqueries - Exists
SELECT * FROM employees e WHERE EXISTS 
(SELECT * FROM titles t WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer');

#  Subqueries-Example -1

select  A.*  from 
(select e.emp_no as employee_id , min(de.dept_no) as department_code,
(select emp_no From dept_manager where emp_no =110022) as manager_id
from employees e 
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no <= 10020
group by e.emp_no order by e.emp_no ) A
UNION 
Select B.* from 
(select e.emp_no as employee_id , min(de.dept_no) as department_code,
(select emp_no From dept_manager where emp_no =110039) as manager_id
from employees e 
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no>10020
group by e.emp_no order by e.emp_no LIMIT 20) B;


# Subqueries-Example -2

-- Create Table – Subquery  

DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager 
(
emp_no INT NOT NULL,
dept_no CHAR(4) NULL,
manager_no INT NOT NULL
);

INSERT INTO emp_manager
SELECT u.* FROM
(SELECT  a.* FROM (SELECT  e.emp_no AS employee_ID,MIN(de.dept_no) AS department_code, (SELECT  
emp_no FROM  dept_manager WHERE emp_no = 110022) AS manager_ID  
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no WHERE e.emp_no <= 10020    GROUP BY 
e.emp_no ORDER BY e.emp_no) AS a    
UNION   
SELECT  b.* FROM (SELECT  e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,            
(SELECT  emp_no FROM dept_manager WHERE emp_no = 110039) AS manager_ID 
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no   
WHERE e.emp_no > 10020 GROUP BY e.emp_no ORDER BY e.emp_no LIMIT 20) AS b    
UNION   
SELECT  c.* FROM (SELECT  e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,            
(SELECT emp_no FROM dept_manager WHERE emp_no = 110039) AS manager_ID   
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE  e.emp_no = 110022 GROUP BY e.emp_no) AS c     
UNION   
SELECT d.* FROM (SELECT  e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,            
(SELECT emp_no FROM dept_manager WHERE emp_no = 110022) AS manager_ID   
FROM employees e  JOIN dept_emp de ON e.emp_no = de.emp_no   
WHERE e.emp_no = 110039    GROUP BY e.emp_no) AS d) 
as u;

SELECT * FROM emp_manager;
