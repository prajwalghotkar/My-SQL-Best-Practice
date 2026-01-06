# Self Joins
-- Create Table

USE employees;
Drop table if exists tblEmployees;

CREATE TABLE tblEmployees
(
EmployeeID int,
Name varchar(50),
ManagerID int
); 

# Insert Data
INSERT INTO tblEmployees values(1,'Mike',3);
INSERT INTO tblEmployees values(2,'Prajwal',1);
INSERT INTO tblEmployees values(3,'Manaswi',NULL);
INSERT INTO tblEmployees values(4,'Ben',1);
INSERT INTO tblEmployees values(5,'Sam',1);
SELECT * FROM tblEmployees;

# Dsiplay Emp No and Manager No Option - 1

SELECT DISTINCT e1.* FROM tblEmployees e1 JOIN tblEmployees m1 ON m1.EmployeeID = e1.ManagerID;

SELECT e1.EmployeeID, e1.Name AS EMP_NAME,m1.Name AS MGR_NAME FROM tblEmployees e1
JOIN tblEmployees m1 ON m1.EmployeeID = e1.ManagerID ORDER BY e1.EmployeeID;
---
# Display Emp No and Manager No

SELECT * FROM tblEmployees;

# Display Emp No and Manager No Option - 2
SELECT e1.EmployeeID,e1.Name AS EMP_NAME,m1.Name AS MGR_NAME FROM tblEmployees e1
JOIN tblEmployees m1 ON m1.EmployeeID = e1.ManagerID ORDER by e1.EmployeeID;

---

# Views
# Create View –Example -1

CREATE OR REPLACE VIEW v_dept_emp_latest_date as
SELECT emp_no, MAX(from_date) AS from_date , MAX(to_date) as to_date 
from dept_emp group by emp_no; 

# Select Value fro View
SELECT * FROM v_dept_emp_latest_date;

# Create View - Example 2
CREATE OR REPLACE VIEW v_manager_avg_salary AS SELECT ROUND(AVG(salary), 2) FROM salaries s JOIN dept_manager m ON s.emp_no = m.emp_no;  
# Select Value form View 
select * from v_manager_avg_salary;
SELECT * from DEPT_EMP ORDER BY emp_no;

SELECT emp_no,COUNT(*) FROM dept_emp GROUP BY emp_no ORDER BY emp_no;

SELECT emp_no,COUNT(*) FROM dept_emp GROUP BY emp_no HAVING COUNT(*)>1 ORDER BY emp_no;

SELECT * FROM dept_emp WHERE emp_no IN (10010,10018);

SELECT * FROM v_dept_emp_latest_date;




