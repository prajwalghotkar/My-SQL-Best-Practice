# JOIN
/*
Join in SQL Server are used to retrieve data from 2 or more related tables. In general tables are related to each other using foreign key constarint.

In SQL server,there are different types of JOINS
1) INNER JOIN
2) OUTER JOIN
3) CROSS JOIN

Outer Joins are again divided into
1) Left Join or Left Outer Join
2) Right Join or Right Outer Join
3) Full Join or Full Outer Join

Join in the SQL tool that allows us to construct a relationship between objects.

A Join shows a result set, containing field derived from two or more tables.

To create Joins need to find a related column from the two tables that contains the same type of data.

*/
# Joins

DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup 
(  
dept_no CHAR(4) NULL,  
dept_name VARCHAR(40) NULL
); 
INSERT INTO departments_dup (dept_no,    dept_name) SELECT  * FROM  departments;
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup WHERE dept_no = 'd002';
INSERT INTO departments_dup(dept_no) VALUES ('d010'),('d011');
---
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup 
(  
emp_no int(11) NOT NULL, 
dept_no char(4) NULL, 
from_date date NOT NULL,  
to_date date NULL 
 ); 
INSERT INTO dept_manager_dup select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES(999904, '2017-01-01'),(999905, '2017-01-01'),(999906, '2017-01-01'),(999907, '2017-01-01');
DELETE FROM dept_manager_dup WHERE dept_no = 'd001';
---------------------------------------------------------------------------------------------------------
# CREATE TABLE AND INSERT DATA
DROP TABLE IF EXISTS tbldepartment;

CREATE TABLE tbldepartment
(
ID INT Primary Key,
DeparmentName varchar(50),
Location varchar(50),
DepartmentHead varchar(50)
);
INSERT INTO tbldepartment VALUES (1,'IT','London','Rick');
INSERT INTO tbldepartment VALUES (2,'Payroll','Delhi','Ron');
INSERT INTO tbldepartment VALUES (3,'HR','New York','Christie');
INSERT INTO tbldepartment VALUES (4,'Other Department','Sydney','Cindrella');
select * from tbldepartment;
# CREATE TABLE AND INSERT DATA
drop table if exists tblEmployee;
create table tblemployee
(
ID int primary key,
Name varchar (50),
Gender varchar (50),
Salary int,
Departmentid int,
Foreign Key (Departmentid) references tblDepartment(id)
);

INSERT INTO tblemployee values (1,'Tom','Male',4000,1);
INSERT INTO tblemployee values (2,'Pam','Female',3000,3);
INSERT INTO tblemployee values (3,'John','Male',3500,1);
INSERT INTO tblemployee values (4,'Sam','Male',4500,2);
INSERT INTO tblemployee values (5,'Todd','Male',2800,2);
INSERT INTO tblemployee values (6,'Ben','Male',7000,1);
INSERT INTO tblemployee values (7,'Sara','Female',4800,3);
INSERT INTO tblemployee values (8,'Valarie','Female',5500,1);
INSERT INTO tblemployee values (9,'James','Male',6500,NULL);
INSERT INTO tblemployee values (10,'Russell','Male',8800,NULL);

select * from tblemployee;

#  INNER JOINS
SELECT m.dept_no, m.emp_no, d.dept_name 
FROM dept_manager_dup m 
INNER JOIN departments_dup d
ON m.dept_no = d.dept_no ORDER BY m.dept_no;

# Added two more columns from date and to date to the select statement

SELECT m.dept_no, m.emp_no, m.from_date , m.to_date, d.dept_name FROM dept_manager_dup m INNER JOIN departments_dup d
ON m.dept_no = d.dept_no ORDER BY m.dept_no;

# Instead of Inner Join Use Join word also gives the same result
SELECT m.dept_no, m.emp_no, m.from_date , m.to_date, d.dept_name FROM dept_manager_dup m JOIN departments_dup d
ON m.dept_no = d.dept_no ORDER BY m.dept_no;

SELECT  e.emp_no,  e.first_name, e.last_name, dm.dept_no, e.hire_date FROM  employees e 
JOIN  dept_manager dm 
ON e.emp_no = dm.emp_no;

# JOIN or INNER JOIN means the same. It's always better to use INNER JOIN, as this explicitly specifies your intention.

SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee INNER JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id;
# OR
SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id;
----
# Duplicate records
/*
Duplicate records, also known as duplicate rows, are identical rows in an SQL table 

For a pair of duplicate records, the values in each column coincide

Duplicate rows are not always allowed in a database or a data table. They are sometimes encountered, especially in new, raw, or uncontrolled data 

Use Group by condition to control Duplicate records
*/

# Left Outer Join or Left Join
/*
The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the 
right table (table2). If there is no match, the result is 0 records from the right side.
*/
# Create Inner Join

SELECT  e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date FROM   employees e  
JOIN  dept_manager dm ON e.emp_no = dm.emp_no  
WHERE   e.last_name = 'Markovitch'  ORDER BY dm.dept_no DESC, e.emp_no;

# Create Left Join

SELECT  e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date FROM   employees e  LEFT JOIN  dept_manager dm ON e.emp_no = dm.emp_no 
WHERE   e.last_name = 'Markovitch'  ORDER BY dm.dept_no DESC, e.emp_no;

SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee
LEFT OUTER JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id;

# OR

SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee
LEFT JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id;

# Note: You can use, LEFT JOIN or LEFT OUTER JOIN. OUTER keyword is optional
----
# Right Joins

SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee
RIGHT OUTER JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id;

SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee
RIGHT JOIN tblDepartment ON tblEmployee.DepartmentId = tblDepartment.Id;

----
#  Full Outer Joins

-- We do not have a full join or full outer join in MySQL. But instead, we will emulate them using a combination of LEFT and RIGHT JOINS and the UNION query.

SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee
LEFT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id
UNION 
SELECT Name,Gender,Salary,DepartmentName FROM tblEmployee
RIGHT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id
order by name;
----
# New and Old Join Syntax (Join Or Where)
/*
JOIN or WHERE
- The retrieved output is identical 
- Using WHERE is more time-consuming 
- The WHERE syntax is perceived as morally old and is rarely employed by professionals 
- The JOIN syntax allows you to modify the connection between tables easily
*/

/*
Old Syntax (Where) 

SELECT   e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM  employees e, dept_manager dm 
WHERE e.emp_no = dm.emp_no;
--------------------------------------------------------------------------------------------------
New Join Syntax:

SELECT  e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date 
FROM  employees e 
JOIN  dept_manager dm 
ON e.emp_no = dm.emp_no; 

*/
/*
- JOIN: - used for connecting the “employees” and “salaries” tables 

- WHERE: - used to define the condition or conditions that will determine which will be the connecting points between the two tables
*/
# Example 1
SELECT e.emp_no, e.first_name,e.last_name , s.salary from employees e Join salaries s on e.emp_no = s.emp_no WHERE s.salary > 145000;

# Example 2
SELECT e.first_name, e.last_name, e.hire_date, t.title FROM  employees e JOIN  titles t ON e.emp_no = t.emp_no
WHERE first_name = 'Margareta' AND last_name = 'Markovitch' ORDER BY e.emp_no;