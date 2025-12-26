Use employees;
select * from employees;
select emp_no,birth_date,first_name from employees;
---
select dept_no from departments;
select * from departments;
---
# SELECT - WHERE
select * from employees where first_name = 'Denis'; 
select * from employees where last_name = 'Elvis';

# WHERE - AND

-- AND allow you to logically combine two statements in the condition code block

select count(*) from employees where first_name = 'Denis' and Gender = 'M';
select * from employees where first_name = 'Denis' and Gender = 'M';

select count(*) from employees where first_name = 'Kellie' and gender = 'F';
select * from employees where first_name = 'Kallie' and gender = 'F';

# WHERE - OR
/*
AND - The AND conditions are set on different columns. The AND operator displays a record if all the conditions separated by AND are TRUE.

OR - The OR conditions are set on the same/different column. The OR operator displays a record if any of the conditions separated by OR is TRUE.
*/

select * from employees where first_name = 'Denis' or first_name = 'Elvis';
# Display Count with OR
select count(*) from employees WHERE first_name = 'Denis' or first_name = 'Elvis';

# Example AND on the same column - No Result
select * from employees WHERE FIRST_NAME = 'Denis' AND FIRST_NAME = 'Elvis';

# Example OR on the same column - one more example.
select * from employees WHERE first_name = 'Kellie' OR first_name = 'Aruna';

# Operator Precedence
-- Logical operator precedence is an SQL rule stating that in the execution of the query,the operator AND is applied first, while the operator OR is applied second.
-- Operator Precedence regardless of the order in which you use these operators, SQL will always start by reading the conditions around the AND operator.
-- Precedence can be changed with Brackets ()

# Bracket Execute First then AND

select * from employees where (Gender = 'M' OR 'F') and FIRST_NAME = 'Denis';

# Bracket Execute First then AND - Count
select count(*) from employees where (Gender = 'M' OR 'F') and FIRST_NAME = 'Denis';

# Operator Precedence
-- AND First then OR –OR means one condition satisfies more records in the result
select * from employees where gender = 'M' OR 'F' and FIRST_NAME = 'Denis';

-- AND First then OR - Count
select count(*) from employees WHERE Gender = 'M' OR 'F' and FIRST_NAME = 'Denis';

# One more example - AND - OR Combination.
select * from employees where gender = 'F' AND (first_name='Kellie' OR first_name='Aruna');

# One more example - AND - OR Combination.
select count(*) from employees where gender = 'F' AND (first_name='Kellie' OR first_name='Aruna');

# WHERE-IN-NOT IN
-- Get the records based on multipple OR condition.
select * from employees WHERE
first_name = 'Cathie'
OR first_name = 'Mark'
OR first_name = 'Nathan';

-- Multiple OR can be replaced with IN - Operator

select count(*) from employees where first_name IN ('Cathie','Mark','Nathan');
select * from employees where first_name IN ('Cathie','Mark','Nathan');

# WHERE - NOT IN

-- NOT IN Operator - Get all the records other than the name specified in the Bracket.

select count(*) from employees WHERE  first_name NOT IN ('Cathie','Mark','Nathan');
select * from employees WHERE first_name NOT IN ('Cathie','Mark','Nathan');

# WHERE - LIKE - NOT LIKE

-- Like/Not Like - This is used for Pattern Matching. Use the % symbol for pattern matching.
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

# There are two wildcards often used in conjunction with the LIKE operator:
-- The percent sign(%) represents zero, one, or multiple characters.
-- The underscore sign (_) represents one, single character.
/*
- The percent sign and the underscore can also be used in combinations
- You can also combine any number of conditions using AND or OR operators.
*/

# WHERE - LIKE - NOT LIKE

-- Get all Names starting with Mar
select * from employees where first_name like('Mar%');

-- Get all Names starting with ar
select * from employees where first_name like('ar%');

-- Get all Names Ending with ar
select * from employees where first_name like('%ar');

-- Get all Names where ar is available
select * from employees where first_name like('%ar%');

-- Get all Four Letter Name starting with Mar
select * from employees where first_name like('Mar_');

# NOT LIKE - Get all Name other than Mar in the text
select * from employees where first_name NOT LIKE('%Mar%');

# LIKE More Examples
select * from employees where first_name like('Mark%');
select * from employees where first_name like('%2000%');
select * from employees where emp_no like('1000_');
select * from employees where emp_no like('100%');

# WHERE - Wildcard Characters
-- > % , _ , *
/*
% a substitute for a sequence of characters
   Eg - LIKE('Mar%') - Result - Mark,Martin,Margaret
   
_ help you match a single character
    Eg - LIKE('Mar_') - Result - Mark,Marv,Marl
   
* will deliver a list of all columns in a table. It can be used to count all rows of a table
    Eg - SELECT * FROM employees;   
*/

# WHERE - Wildcard Characters
SELECT * FROM employees WHERE first_name LIKE('%JACK%');
select * from employees WHERE first_name NOT LIKE('%Jack%');

# WHERE - Between.. AND
-- The BETWEEN operator select values within a given range. The values can be numbers,text, or dates.
-- The BETWEEN  operator is inclusive: begin and end values are included.

/*
Syntax:

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
*/

# Examples

select * from salaries;
select * from salaries where salary between 66000 and 70000;
select * from employees where emp_no not between '10004' and '10012';
select dept_name from departments where dept_no BETWEEN 'd003' and 'd006';

# WHERE - IS NOT NULL / IS NULL
-- IS NULL/IS NOT NULL
/*
- It is not possible to test for NULL values with comparison operators, such as =,<, or <>.
- We will have to use the IS NULL and IS NOT NULL operators instead.

IS NULL Syntax

SELECT column_names
FROM table_name
WHERE column_name IS NULL

IS NOT NULL Syntax

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
*/

# Examples

SELECT * FROM employees WHERE first_name IS NOT NULL;
SELECT * FROM employees WHERE first_name IS NULL;
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;
SELECT dept_name FROM departments WHERE dept_no IS NULL;

# Other Comparison Operators

select * from employees where first_name = 'Mark'; # Equal to
select * from employees where first_name <> 'Mark'; # Not equal to
select * from employees where first_name != 'Mark'; # Not equal to
select * from employees where hire_date > '2000-01-01';
select * from employees where hire_date >= '2000-01-01';
select * from employees where hire_date < '1985-02-01';
select * from employees where hire_date <= '1985-02-01';
select * from employees where hire_date >= '2000-01-01' AND gender = 'F';
select * from salaries where salary>150000;

# Select - Distinct
-- The SELECT DISTINCT statement is used to return only distinct(different) values.
/*
SELECT DISTINCT column1,column2,....
FROM table_name;
*/
# Example

SELECT DISTINCT Gender FROM employees;
SELECT DISTINCT hire_date FROM employees;
SELECT count(DISTINCT(hire_date)) FROM employees;

# Aggregate Functions
-- Examples

select count(emp_no) from employees;
select count(first_name) from employees;
select distinct(count(first_name)) from employees;
select count(*) from dept_manager;

---

# ORDER - BY
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.
-- The ORDER BY keyword sort the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

/*
- Syntax

SELECT column1,column2,...
FROM table_name
ORDER BY column1,column2,...ASC|DESC;
*/

# Examples

select * from employees order by first_name;
select * from employees order by first_name DESC;
select * from employees order by emp_no DESC;
select * from employees order by first_name ASC,last_name DESC;
select * from employees order by hire_date desc;
---
# GROUP BY

-- GROUP BY - When working in SQL,results can be grouped according to a specific field or fields
-- GROUP BY - GROUP BY must be placed immediately after the WHERE conditions, if any, and just before the ORDER BY clause.
-- GROUP BY is one of the most powerful and useful tools in SQL.

/*
The GROUP BY statement group rows that have the same values into summary rows,like "find the number of customers in each country".

The GROUP BY statement is often used with aggregate function (COUNT(),MAX(),MIN(),SUM(),AVG()) to group the result-set by one or more columns.

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
*/
-- Display Unique(Distinct) First Names (Group by slower than distinct function)
select first_name from employees group by first_name;
select first_name,count(first_name) from employees group by first_name;

# Group By and Order By
select first_name,count(first_name) from employees group by first_name 
order by first_name desc;
---

# Aliases (AS)
-- names_count is the aliase name

select first_name,count(first_name) as names_count from employees group by first_name order by first_name DESC;
select salary,count(emp_no) as emps_with_same_salary from salaries where salary>80000 group by salary order by salary;
---

# Having
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
/*
SELECT column_names(s)
FROM table_name
WHERE condition
GROUP BY column_names(s)
HAVING condition
ORDER BY column_name(s);
*/

-- In the following example Where and Having Return Same Result

select * from employees where hire_date>='200-01-01';
select * from employees having hire_date>='2000-01-01';

# In the following example Having with Group by and Aggregate Functions
select first_name,count(first_name) as names_count from employees group by first_name HAVING count(first_name)>250 order by first_name DESC; 

# Having
-- Condition as part of where clause
use employees;
SELECT emp_no, AVG(salary) FROM salaries WHERE salary>120000 GROUP BY emp_no ORDER BY emp_no;

-- Condition as part of Having Clause
SELECT emp_no, AVG(salary) FROM salaries GROUP BY  emp_no HAVING AVG(salary) > 120000 ORDER BY emp_no;

--- 
# Having and Where
/*
"Extract a list of all names that are encountered less than 200 times. Let the data refer to people hired after the 1st of January 1999."
*/
select * from employees;
SELECT first_name,COUNT(first_name) AS name_count FROM employees WHERE hire_date>'1999-01-01' GROUP BY first_name HAVING COUNT(first_name)<200 ORDER BY first_name desc;
SELECT emp_no FROM dept_emp WHERE from_date > '2000-01-01' GROUP BY emp_no HAVING COUNT(from_date)>1 ORDER BY emp_no;
select * from dept_emp;
---

# LIMIT 
-- Display more than 1000 records in the Display Editor
-- Edit-> Preferences -> SQL Execution -> Un Check Limit Rows Check Box -> OK

-- Display the employee numbers of the 10 highest-paid employees in the database
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;

-- The sorting is based on EMP No, it displays records based on EMP NO, not based on the Salary
SELECT * FROM salaries ORDER BY emp_no DESC LIMIT 10;
SELECT * FROM dept_emp LIMIT 100;

/*
# SQL Order
SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s)
LIMIT number;
*/
---




 



