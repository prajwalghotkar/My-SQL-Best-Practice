# INSERT STATEMENT
-------------------------------------------------------------------------------------------------------
USE employees;
select * from employees limit 2;

INSERT INTO employees(emp_no,birth_date,first_name,last_name,gender,hire_date) values(999901,'2002-11-02','Prajwal','Ghotkar','M','2026-01-28');

-- The newly inserted record display as the first record, since in the employee number inserted is the highest number
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 5;

INSERT INTO employees VALUES(999903,'1977-09-14','Johnathan','Creek','M','1999-01-01');
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 5;
-------

# INSERT INTO
SELECT * FROM titles LIMIT 10;
INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES (999903, 'Senior Engineer', '1997-10-01', '9999-01-01');
------
SELECT * FROM dept_emp ORDER BY emp_no DESC LIMIT 10;
INSERT INTO dept_emp (emp_no,dept_no,from_date,to_date) VALUES (999903,'d005','1997-10-01','9999-01-01');
------
# INSERT - Data Into One table from another Table
SELECT * FROM departments;

# Create Duplicate Table
DROP TABLE IF EXISTS department_dup;

CREATE TABLE department_dup
(
dept_no char(4) NOT NULL,
dept_name varchar(40) NOT NULL
);
# Insert Data to Duplicate Table
INSERT INTO department_dup(dept_no,dept_name) SELECT * FROM departments;

SELECT * FROM department_dup;
------
# Update Statement
----------------------------------------------------------------------------------------------------
-- Commit and Roll Back
/*
The COMMIT statement
- saves the transaction in the database
- changes cannot be undone
- used to save the state of the data in the database at the moment of its execution.

# The ROLLBACK clause

- allows you to take a step back
- the last change(s) made will not count
- reverts to the last non-committed state
- it will refer to the state corresponding to the last time you executed COMMIT
- ROLLBACK will have an effect on the last execution you have performed 
- you cannot restore data to a state corresponding to an earlier COMMIT.
 */
 
 # Update Data
 -- Update Record where EMP_No = 999901
SELECT * FROM employees WHERE emp_no = 999901;

-- Update Data
Update employees SET first_name = 'Stella',last_name = 'Parkinson', birth_date = '1990-12-31', gender = 'F' WHERE emp_no = 999901;
-- Display Updated Data
SELECT * FROM employees WHERE emp_no = 999901;
------
# Update Data
SELECT * FROM department_dup;
COMMIT;

-- The following update statement updates all records in the table.
UPDATE department_dup SET Dept_no = 'd011',dept_name = 'Quality Control';
SELECT * FROM department_dup;

-- Rollback will take you till the previous commit statement
ROLLBACK;
SELECT * FROM department_dup;
----
# Update Data
SELECT * FROM departments;
UPDATE departments SET dept_name='Data Analysis' WHERE dept_no = 'd002';
SELECT * FROM departments;
------
# Delete Statement
---------------------------------------------------------------------------------------------------
# DELETE
SELECT * FROM employees WHERE emp_no = 999903;
DELETE FROM employees WHERE emp_no = 999903;
SELECT * FROM employees WHERE emp_no = 999903;
rollback;
SELECT * FROM employees WHERE emp_no = 999903;
---
# DELETE
-- Delete Complete Data from the Table
DELETE FROM department_dup;
rollback;
SELECT * FROM department_dup;

DELETE FROM departments WHERE dept_no='d010';
SELECT * FROM departments;

/*
# DROP,DELETE and TRUNCATE

- DROP - you won't be able to roll back to its initial state, or to the last COMMIT statement

- Use DROP TABLE only when you are sure you aren't going to use the table in question anymore

- TRUNCATE ~ DELETE without WHERE
  WHERE truncating,auto-increment values will be reset
  
- DELETE removes records row by row  
*/


 