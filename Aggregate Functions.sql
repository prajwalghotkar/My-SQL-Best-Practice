# Aggregate Functions
---------------------------------------------------------------------------------------------------
/*
- Aggregate functions - they gather data from many rows of a table, then aggregate it into a single values
- The information contained in multiple rows is the single value they provide.
- MySQL provides a set of aggregate functions that perform oprations on all the entities of the column of a table considering them as a single unit.
*/
# Aggregate Functions - Count()
-- COUNT()-> applicable to both numerical and non-numeric data
USE employees;
SELECT * FROM salaries;
SELECT COUNT(salary) FROM salaries;
SELECT COUNT(from_date) FROM salaries;

-- Count Distinct: Find the number of times unique values are encountered in a given column.
SELECT COUNT(DISTINCT(from_date)) FROM salaries;
SELECT * FROM dept_emp;
SELECT COUNT(dept_no) FROM dept_emp;
SELECT COUNT(DISTINCT(dept_no)) FROM dept_emp;
SELECT COUNT(DISTINCT dept_no) as count_dept_no FROM dept_emp;

-- COUNT(*): * returns the number of all rows of the table,values NULL included
SELECT COUNT(*) FROM salaries;
-----
# Aggregate Functions - Sum()

-- SUM() - works only with numeric data

SELECT * FROM salaries;
SELECT SUM(salary) FROM salaries;
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';
SELECT emp_no,SUM(salary) FROM salaries GROUP BY emp_no;
------
# Aggregate Functions - MAX() and MIN()
SELECT * FROM salaries;
SELECT MAX(salary) FROM salaries;
SELECT MIN(salary) FROM salaries;
SELECT MAX(salary) FROM salaries WHERE from_date > '1997-01-01';
SELECT MAX(emp_no) FROM salaries;
SELECT MIN(emp_no) FROM salaries;
------

# Aggregate Functions - Avg()
-- Extract the average value of all non_null values in a field
SELECT AVG(salary) FROM salaries;
SELECT AVG(salary) FROM salaries WHERE from_date > '1997-01-01';

-- Question is: Corresponding to every employees what is the Average salary 
SELECT emp_no,AVG(salary) FROM salaries GROUP BY emp_no;
------
# Aggregate Functions - ROUND()
-- ROUND(#,decimal_places) - numeric,or math,function you can use
-- ROUND()- usually applied to the single values that aggregate functions return

SELECT ROUND(AVG(salary)) FROM salaries;
SELECT ROUND(AVG(salary),2) FROM salaries;
SELECT ROUND(AVG(salary),-2) FROM salaries;
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';
------
# IF NULL() and COALESCE()
/*
- IFNULL(expression_1,expression_2)

- Returns the first of the two indicated values if the data value found in the table is not null,and returns the second value if there is a null values

- COALESCE(expression_1,expression_2........expression_N)
Allows you to insert N arguments in the parantheses

- COALESCE() will always return a single value of the ones we have within parentheses and this value will be the first non-null value of this list, reading the values from left to right.

- if COALESCE() has two arguments,it will work precisely like IFNULL()

- IFNULL() and COALESCE() do not make any changes to the data set. They merely create an output where certain data values appear in place of NULL values.

- IFNULL() works with precisely two arguments
- COALESCE() can have one,two,or more arguments | 
*/ 

# IF NULL and COALESCE()

DROP TABLE IF EXISTS department_dup;

CREATE TABLE department_dup
(
dept_no char(4),
dept_name varchar(40),
dept_manager varchar(40)
);
INSERT INTO department_dup(dept_no,dept_name) SELECT * FROM departments;
SELECT * FROM department_dup;

INSERT INTO department_dup(dept_no) VALUES('D100');
INSERT INTO department_dup(dept_no) VALUES('D101');
SELECT * FROM department_dup;

# Use of IFNULL
SELECT * FROM department_dup;

SELECT dept_no, IFNULL(dept_name,'No Department Name') as dept_name FROM department_dup;
# Replace IFNULL() with COALESCE()
SELECT dept_no,COALESCE(dept_name,'No Department Name') as dept_name FROM department_dup;

# IF NULL() AND COALESCE()

-- COALESCE() - with three arguments
SELECT dept_no,dept_name,COALESCE(Dept_Manager,Dept_Name,'N/A') as dept_manager FROM department_dup;

-- COALESCE() Can be used to generate Dummy columns

SELECT dept_no,COALESCE('GOOD DAY') as Day FROM department_dup;

SELECT dept_no,dept_name,COALESCE(dept_no,dept_name) AS dept_info FROM department_dup ORDER BY dept_no ASC;

# Replacing NULL Values
-- Three wayes to replace NULL values - ISNULL() FUNCTION, CASE statement & COALESCE() Function

# IF NULL() and COALESCE()
-- Create Table
DROP table if exists tblEmployees;
CREATE TABLE tblEmployees
(
EmployeeID int,
Name varchar(50),
ManagerID int
);

# Insert Data
INSERT INTO tblEmployees VALUES (1,'Prajwal',3);
INSERT INTO tblEmployees VALUES (2,'Rob',1);
INSERT INTO tblEmployees VALUES (3,'Todd',NULL);
INSERT INTO tblEmployees VALUES (4,'Ben',1);
INSERT INTO tblEmployees VALUES (5,'Sam',1);
SELECT * FROM tblEmployees;

# Replace Manager null with No Manager
SELECT E.Name as Employee,IFNULL(M.Name,'No Manager') AS Manager
FROM tblEmployees E
LEFT JOIN tblEmployees M
ON E.ManagerID = M.EmployeeID;

# Replacing NULL value using COALESCE() function: COALESCE() function,return the first NON NULL value.

SELECT E.Name AS Employee, COALESCE(M.Name,'No Manager') AS Manager 
FROM tblEmployees E
LEFT JOIN tblEmployees M
ON E.ManagerID = M.EmployeeID;

------
# COALESCE()
-- Create a new table to test Coalesce() Function

DROP TABLE IF EXISTS c_tblEmployee;

CREATE TABLE c_tblEmployee
(
id int,
FirstName varchar(50),
MiddleName varchar(50),
LastName varchar(50)
);

INSERT INTO c_tblEmployee VALUES(1,'Prajwal',NULL,NULL);
INSERT INTO c_tblEmployee VALUES(2,NULL,'Todd','Tanzan');
INSERT INTO c_tblEmployee VALUES(3,NULL,NULL,'Sara');
INSERT INTO c_tblEmployee VALUES(4,'Ben','Parker',NULL);
INSERT INTO c_tblEmployee VALUES(5,'James','Nick','Nancy');
INSERT INTO c_tblEmployee VALUES(6,NULL,NULL,NULL); 

# COALESCE()

SELECT * FROM c_tblEmployee;
SELECT id,COALESCE(FirstName,MiddleName,LastName) AS Name FROM c_tblEmployee;

SELECT id,COALESCE(FirstName,MiddleName,LastName,'No_Name') AS Name FROM c_tblEmployee;

---------------------------------------------------------------------------------------------------

 