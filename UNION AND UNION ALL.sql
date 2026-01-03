## Union VS Union ALL
# UNION conbines the result set of two or more SELECT statements, showing only distinct values.
/*
SELECT column_1,column_2
FROM table_1
[WHERE condition]

UNION

SELECT column_1,column_2
FROM table_2
[WHERE condition]
*/

# UNION ALL conbines the result of two or more SELECT statements, showing all values,including duplicates if they exist.

/*
SELECT column_1,column_2
FROM table_1
[WHERE condition]

UNION ALL

SELECT column_1,column_2
FROM table_2
[WHERE condition]
*/

# Union
-- Create a Table for the Union
USE employees;
DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup
(
emp_no int,
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M','F'),
hire_date date
);
INSERT INTO employees_dup SELECT e.* FROM employees e limit 20;
SELECT * FROM employees_dup;
-----------------------------------------------------------------------------------------------------
# Union All - Example
-- Insert a Duplicate Record
INSERT INTO employees_dup SELECT e.* FROM employees e WHERE emp_no=10001;
SELECT * FROM employees_dup;

# Use Union ALL, to display duplicate records from the employee table where emp_no = 10001

SELECT e.emp_no,e.first_name,e.last_name,NULL as dept_no, NULL as from_date from employees_dup e WHERE e.emp_no = 10001
UNION ALL
SELECT NULL AS emp_no,NULL AS first_name,NULL AS last_name,m.dept_no,m.from_date FROM dept_manager m;
---
# Union - Example 1
-- Union - No duplicate record
SELECT e.emp_no,e.first_name,e.last_name,NULL AS dept_no,NULL AS from_date FROM employees_dup e WHERE e.emp_no = 10001
UNION 
SELECT NULL AS emp_no,NULL AS first_name,NULL AS last_name,m.dept_no,m.from_date FROM dept_manager m;
---
# Union - Example 2
SELECT * FROM 
(SELECT e.emp_no,e.first_name,e.last_name,NULL AS dept_no,NULL AS from_date FROM employees e WHERE last_name='Denis'
UNION 
SELECT NULL AS emp_no,NULL AS first_name, NULL AS last_name,dm.dept_no,dm.from_date FROM dept_manager dm) AS a
ORDER BY a.emp_no DESC;