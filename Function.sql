# Functions
/*
• Although there are no OUT parameters, there is a ‘return value’ 
• It is obtained after running the query contained in the body of the function
• we cannot call a function
• we can select it, indicating an input value within parentheses
*/

# Functions- Example -1

USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL (10,2)
DETERMINISTIC NO SQL READS SQL DATA 
BEGIN 
DECLARE v_avg_salary DECIMAL (10,2);
SELECT AVG(s.salary) INTO v_avg_salary FROM employees e 
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;RETURN v_avg_salary;
END $$
DELIMITER ;
# Execute Function –Option -1 
SELECT f_emp_avg_salary (11300) as AVG_SAL;
----
# Functions- Example -2
USE employees;
DROP FUNCTION IF EXISTS emp_info;
DELIMITER $$

# Create Function 

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) 
RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN                
DECLARE v_max_from_date date;      
DECLARE v_salary decimal(10,2);
SELECT  MAX(from_date) INTO v_max_from_date  FROM  employees e  
JOIN salaries s ON e.emp_no = s.emp_no 
WHERE e.first_name = p_first_name  AND e.last_name = p_last_name;
SELECT  s.salary INTO v_salary FROM employees e  
JOIN  salaries s ON e.emp_no = s.emp_no 
WHERE   e.first_name = p_first_name   AND e.last_name = p_last_name
 AND s.from_date = v_max_from_date;        
         RETURN v_salary;                 
END$$
DELIMITER ;

# Execute Function 
SELECT EMP_INFO('Aruna', 'Journel') as salary;
