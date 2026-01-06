# Stored Routine
/*
A stored routine is either a procedure or a function. Stored routines are created with the CREATE PROCEDURE and CREATE FUNCTION statements.

- A procedure is invoked using a CALL statement and can only pass back values using output variables.
- A function can be called from inside a statement just like any other function(that is,by invoking the function's name),and can return a scalar value.
- Stored routines can be dropped with the DROP PROCEDURE and DROP FUNCTION statements and altered with the ALTER PROCEDURE and ALTER FUNCTION statements.
*/
# Procedure
-- Stored procedures are sub-routines, segments of SQL statements which are stored in the SQL catalogue 
-- All the applications that can access Relational databases (Java, Python, PHP etc.), can access stored procedures.
-- Stored procedures contain IN and OUT parameters or both. 
-- They may return result sets in case you use SELECT statements. Stored procedures can return multiple result sets.
-- You can create a procedure using the MySQL CREATE PROCEDURE statement.

# Types Of Procedures
-- Procedure with no parameters: A procedure without parameters does not take any input or cast an output indirectly. It is simply called with its procedure name followed by () (without any parameters). 
-- Procedure with IN parameter: An IN parameter is used to take a parameter as input such as an attribute.When we define an IN parameter in a procedure, the calling program has to pass an argument to the stored procedure.
-- Procedure with OUT parameter: An OUT parameter is used to pass a parameter as output or display like the select operator, but implicitly (through a set value). The value of an OUT parameter can be changed inside the procedure and its new value is passed back to the calling program. A procedure cannot access the initial value of the OUT parameter when it starts.
-- The procedure with IN-OUT parameter: An INOUT parameter is a combination of IN and OUT parameters. It means that the calling program may pass the argument, and the stored procedure can modify the INOUT parameter and pass the new value back to the calling program

-----

# Delimiter
/*
DELIMITER //

With the above statement, the MySQL server would change the delimiter to ‘//’ instead of ‘;’ Once 
the proc is created and saved in the MySQL server, you can switch back the DELIMITER to a 
semicolon using the command below.

DELIMITER ;

This would again reset the DELIMITER to a semicolon.

semi-colons  ;

• they function as a statement terminator 
• technically, they can also be called delimiters 

DELIMITER $$ - by typing DELIMITER $$, you’ll be able to use the dollar symbols as your delimiter
*/
# Procedure – Example-1
# Create a New table to use for the Procedure 

USE employees;
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee
(
Name VARCHAR(255), 
Salary INT NOT NULL,
Location VARCHAR(255)
);

# Set new Delimiter 

DELIMITER //

# Create Procedure – Procedure is to insert one record to employee table 

Create procedure myProcedure (IN name VARCHAR(30),   IN sal INT,   IN loc VARCHAR(45))      
BEGIN   
   INSERT INTO Employee(Name, Salary, Location) VALUES (name, sal, loc);  
END //     

# Reset Delimiter 

DELIMITER ;

# Call Procedure 

# Procedure – Example-2
# Procedure to get the First 1000 records from the table
# Non-parametric procedure doesn’t require parenthesis () at the end 

DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN 
select * from employees limit 1000;
END$$
DELIMITER ;

# Procedure – Example-2
# Execute Procedure 
/*
Option 1- call database_name.procedure_name () – Data base name. procedure name
*/
call employees.select_employees();
/*
Option 2- If the current database is active, specify only the procedure name 
*/
call select_employees();

----
# Procedure – Example-3
# Create Procedure 

DELIMITER $$

CREATE PROCEDURE avg_salary()
BEGIN
SELECT  AVG(salary) FROM salaries;
END$$

DELIMITER ;

# Execute Procedure 
CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary;
CALL employees.avg_salary();

----

# Stored Procedure with Input Parameter
/*
• A stored routine can perform a calculation that transforms an input value into an output value.
• Stored procedures can take an input value and then use it in the query, or queries, written in the body of the procedure
  o This value is represented by the IN parameter
  o After that calculation is ready, a result will be returned
*/
#Create Procedure with In Parameter 

USE EMPLOYEES;
DROP PROCEDURE IF EXISTS EMP_SALARY;
DELIMITER $$
USE EMPLOYEES $$
CREATE PROCEDURE EMP_SALARY (IN P_EMP_NO INTEGER)
BEGIN 
SELECT E.FIRST_NAME , E.LAST_NAME, S.SALARY, S.FROM_DATE, S.TO_DATE     
FROM EMPLOYEES E JOIN SALARIES S ON E.EMP_NO = S.EMP_NO  
WHERE E.EMP_NO = P_EMP_NO; 
END $$  
DELIMITER ;

CALL EMP_SALARY (11300);

----
# The procedure with Average Salary 
USE EMPLOYEES;
DROP PROCEDURE IF EXISTS EMP_AVG_SALARY;
DELIMITER $$
USE EMPLOYEES $$
CREATE PROCEDURE EMP_AVG_SALARY (IN P_EMP_NO INTEGER)
BEGIN 
SELECT E.FIRST_NAME , E.LAST_NAME, AVG(S.SALARY)    
FROM EMPLOYEES E JOIN SALARIES S ON E.EMP_NO = S.EMP_NO  
WHERE E.EMP_NO = P_EMP_NO
GROUP BY E.EMP_NO ;  
END $$  
DELIMITER ;

CALL EMP_AVG_SALARY (11300);

----
# Procedure with Input and Output Parameter 
/*
Every time you create a procedure containing both an IN and an OUT parameter, remember 
that you must use the SELECT-INTO structure in the query of this object’s body.
*/
# Create Procedure with Out Parameter
USE EMPLOYEES;
DROP PROCEDURE IF EXISTS EMP_AVG_SALARY_OUT;
DELIMITER $$
USE EMPLOYEES $$
CREATE PROCEDURE EMP_AVG_SALARY_OUT (IN P_EMP_NO INTEGER, OUT P_AVG_SALARY 
DECIMAL (10.2))
BEGIN 
SELECT AVG(S.SALARY) INTO P_AVG_SALARY 
FROM EMPLOYEES E JOIN SALARIES S ON E.EMP_NO = S.EMP_NO  
WHERE E.EMP_NO = P_EMP_NO
GROUP BY E.EMP_NO ;  
END $$  
DELIMITER ; 

CALL EMP_AVG_SALARY_OUT (11300, @P_AVG_SALARY);
select @P_AVG_SALARY as avg_sal;
----
# Procedure to get Emp No  from First Name and Last Name 

USE EMPLOYEES;
DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no 
integer)
BEGIN        
       SELECT e.emp_no INTO p_emp_no FROM employees e    
       WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

# Execute Procedure
CALL emp_info ('Parto', 'Bamford',@p_emp_no);
SELECT @p_emp_no as emp_no;

----

# Variables
/*

The input value you insert is typically referred to as the ‘argument’, while the obtained output value is stored in a ‘variable’
Declare a variable in MySQL with the help of the SELECT and SET command. Before declaring a variable we need to prefix the symbol ‘@’

Syntax 
SELECT @ yourVariableName;
We can set some value to the variable with the help of the SET command.

Syntax 
SET @yourVariableName=value;
*/

# Variables- Example 1 
-- Create Variable p_avg_salary 
SET @p_avg_salary =0;

-- Call Procedure - EMP_AVG_SALARY_OUT 
CALL employees.EMP_AVG_SALARY_OUT (11300, @p_avg_salary);

-- Display the Output Result 
select @p_avg_salary;

# Variables- Example 2
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

