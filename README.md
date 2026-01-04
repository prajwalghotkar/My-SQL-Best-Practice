# My-SQL-Best-Practice

<img width="1731" height="843" alt="Screenshot 2025-11-28 082837" src="https://github.com/user-attachments/assets/f7d15cad-ef20-42b1-939b-368e1dad2088" />

---

# DataBase:
- MySQL is the world’s most popular open-source database. It is a relational database management system (RDBMS) developed by Oracle based on structured query language (SQL).

- A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each.

#### Syntax
```
CREATE DATABASE databasename;
```
#### Example 
```
create database Sales;
```
#### Drop (Delete) database 
```
drop database Sales;
```
---
## Syntax
```
CREATE DATABASE [IF NOT EXISTS] database_name;
```
- [IF NOT EXISTS] verifies if a database with the same name exists already
- Element the square brackets are optional

- **database_name:** Give a name that is short but at the same time as related to the content of the data as possible

- The SQL code is not case-sensitive 

- ; (the semicolon character) it functions as a statement terminator
  - when your code contains more than a single statement, ; is indispensable
  - will help you avoid errors sometimes
  - will improve the readability of your code

- Example (to view the database created use the refresh button)
```
create database if not exists Sales;    
drop database Sales;
```
---
# Create Schema
- In MySQL, schema is synonymous with database. As the query is written to create the database, similarly the query can be written to create the schema.

- The logical structure can be used by the schema to store data while the memory component can be used by the database to store data. Also, a schema is a collection of tables while a database is a collection of schema.

- The database is created with the syntax ----> 	```create database databasename;```

##### Example    
```create database DatabaseSample;```

##### The syntax to create a schema 
```create schema SchemaName;```

##### Example 
```create schema SchemaSample;```

- To display the database and the schema as well, the show command is used.

- Example
```show databases;```

# Data Base Details 
- Click the information symbol next to the database, it opens the database details in different tabs such as info, Tables, Columns, Indexes  etc
<img width="1359" height="406" alt="Screenshot 2025-11-28 084244" src="https://github.com/user-attachments/assets/2e9b26da-8dee-4506-bc13-07b7ea1450bf" />

- To use or activate the database use the command ----> ```use sales```

---
# MySQL Data Types
##### In MySQL, there are three main data types: string, numeric, and date and time.

##### We can determine the data type in MySQL with the following characteristics:

- The type of values (fixed or variable) it represents.
- The storage space it takes is based on whether the values are a fixed-length or variable length.
- Its values can be indexed or not.
- How MySQL performs a comparison of values of a particular data type.

<img width="1799" height="830" alt="Screenshot 2025-11-28 084609" src="https://github.com/user-attachments/assets/6ecf2070-a395-4377-85ff-0e047fc4998e" />
<img width="1806" height="843" alt="Screenshot 2025-11-28 084645" src="https://github.com/user-attachments/assets/c33babd2-3828-4165-b3dc-33e2d5b3bd59" />
<img width="1768" height="755" alt="Screenshot 2025-11-28 084712" src="https://github.com/user-attachments/assets/f52b9236-54a0-45ed-92f3-4fe6f9ccdc45" />
<img width="1816" height="861" alt="Screenshot 2025-11-28 084741" src="https://github.com/user-attachments/assets/2a5f1cfb-1ba0-4451-a0f7-512b7c7b8c2c" />
<img width="1741" height="834" alt="Screenshot 2025-11-28 084807" src="https://github.com/user-attachments/assets/f1db8fb2-6d56-4a60-832e-96895610bbaa" />
<img width="1699" height="340" alt="Screenshot 2025-11-28 084900" src="https://github.com/user-attachments/assets/23d0ddac-74f1-46ba-beda-486c0d4e5bcd" />

---
 # Create Table
 - To begin with, the table creation command requires the following details −
   - Name of the table
   - Name of the fields
   - Definitions for each field
 
 ##### Syntax
 ```
 CREATE TABLE if not exists table_name 
(
column_1 data_type constraints, 
column_2 data_type constraints, … 
column_n data_type constraints 
);
```
- ***Compulsory requirement:*** Add at least one column

 # Create Table- Example
```
 create table tutorials_tbl(
   tutorial_id INT NOT NULL AUTO_INCREMENT,
   tutorial_title VARCHAR(100) NOT NULL,
   tutorial_author VARCHAR(40) NOT NULL,
   submission_date DATE,
   PRIMARY KEY ( tutorial_id )
 );
```

Kindly refer to the day1.sql file for the required details

### Here, a few items need an explanation 
- Field Attribute NOT NULL is being used because we do not want this field to be NULL. So, if a user tries to 
create a record with a NULL value, then MySQL will raise an error.
- Field Attribute AUTO_INCREMENT tells MySQL to go ahead and add the next available number to the id field. 
Assigns 1 to the first record of the table and automatically increments by 1 for every subsequent row
- Keyword PRIMARY KEY is used to define a column as a primary key. You can use multiple columns separated by 
a comma to define a primary key

---
# View Data from a Table
- A Query is a command you write in SQL with the idea of either retrieving information from the 
database on which you are working, or, alternatively, to insert, update, or delete data from it
- Retrieve data from a Table
```
SELECT * FROM sales;
SELECT * FROM sales.sales;
```
---
# Drop Table
- The DROP statement used for deleting an SQL object
##### Syntax
```DROP TABLE table_name;```
##### Example 
```DROP TABLE sales```

---

#  Constraints

- Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted. 

##### Constraints can be column level or table level.
###### Types of MySQL Constraints
###### Constraints in MySQL is classified into two types:
- Column Level Constraints: These constraints are applied only to the single column that limits the 
type of particular column data.
- Table Level Constraints: These constraints are applied to the entire table and limits the type of 
data for the whole table.

<img width="1275" height="702" alt="Screenshot 2025-11-30 104313" src="https://github.com/user-attachments/assets/f281f42c-3616-4287-ade0-c638a9cf87d7" />
<img width="1145" height="613" alt="Screenshot 2025-11-30 104336" src="https://github.com/user-attachments/assets/fbbbbbe7-9d44-4ae5-8fe8-6c6edb57fb86" />

---

# NOT NULL Constraint

- The NOT NULL constraint enforces a column to NOT accept NULL values. 
- This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field

- Please refer to the NOT_NULL file for better understanding.
---
#  CHECK Constraint

- CHECK Constraint is used limit the range of the values, that can be entered for a column.
##### The general formula for adding check constarint in SQL Server.
```
ALTER TABLE {TABLE_NAME}
ADD CONSTRAINT {CONSTRAINT_NAME} CHECK (BOOLEAN_EXPERSSION)
```
##### To drop the CHECK constraint:
```
ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age
```

##### In simple way before it inserting data check constraint check whether if it is following condition satisfy or not.

- Please refer to the CHECK_CONSTRAINT.sql file for better understanding. 

---

# UNIQUE constraint

- Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
- A PRIMARY KEY constraint automatically has a UNIQUE constraint.
- However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

 - Please refer to the UNIQUE_CONSTRAINT.sql file for better understanding.

 ---

 # PRIMARY KEY constraint

- Primary Key is used to identify each recor in a table uniquely.alter
- If the column constraint primary key constraints, then it cannot be null or empty.
- A table may have duplicate columns, but it can contain only one primary key.
- It always contains a unique value in a column.

- Please refer to the PRIMARY_KEY_CONSTRAINT.sql file for better understanding.

---

# FOREIGN KEY constraint

- Foreign Key constraint is used to link two tables together.It is also known as the referencing key.
- A foregin key column matches the primary key field of another table. It means a foreign key field in one table refers to the primary key field of another table.
- Syntax:
```
CREATE TABLE table_name_1
(
column_name_1 datatype NOT NULL,
column_name_2 datatype NOT NULL,
.
.
.
column_name_n datatype NOT NULL
PRIMARY KEY (column_name_1)
FOREIGN KEY (column_name_2) REFERENCES table_name_2(column_name_2)
);
```
**Parameters:**
- CREATE TABLE table_name_1: This statement is used to create a new database table.

- column_name_1,column_name_2,....: Specify the name columns you want to create on the table.

- datatype: Specify the datatype of each column in the table.

- PRIMARY KEY (column_name_1): Specify the column name on which the primary key constraint has to be applied. it should be a NOT NULL column.

- FOREGIN KEY (column_name_2): Specify the column name on which foregin key constraint has to be applied.

- REFERENCES table_name_2(column_name_2): Specify the table name and the column on which the foregin key in the first table is linked.

- one more topic what exact ON DELETE CASCADE---> IF the customer_id delete from the parent table which means customer table and if that customer_id use there is sales table as well the corresponding customer_id need to be deleted.

#### Drop Foreign Key

- Click the 'i' button Next to the Table name, Click the DDL tab, and get the Foreign Key name. Use the Alter command to Drop the Foreign Key
```
ALTER TABLE TABLE_NAME DROP FOREIGN KEY sales_ibfk_1(FR_KEY_NAME);
```

<img width="1704" height="1008" alt="Screenshot 2025-12-10 181332" src="https://github.com/user-attachments/assets/ec4d4297-21b4-4a0d-824e-ed70c41c6f89" />

- Please refer to the FOREIGN_KEY_CONSTRAINT.sql file for better understanding.
---
# MySQL Best Practice with Prajwal😊
- **Clean Code:** Code that is focused and understandable, which means it must be readable, logical, and changeable
- **Good code is not the one computers understand; it is the one humans can understand.**
- Code, in general, can be organized in several ways. Good practice implies you will choose the version that will be easiest to read and understand 

#### Assumption: 
- At your workplace, you will always type code cleanly – as simple as possible, perfectly organized, maintaining a steady logical flow
- When assigning names to variables or SQL objects, always choose shorter, meaningful names, convey specific information 
- Pronounceable, where one word per concept has been picked 
- Names will constitute more than 80% of your code
- Use ad-hoc software that re-organizes code and colours different words consistently 
- Use the relevant analogical tool provided in Workbench
- Intervene manually and adjust your code as you like 

#### Comments 
- Lines of text that Workbench will not run as code; they convey a message to someone who reads our code 
```
/* … */ (for large comments)

# or -- (for one-line comments)
```
----
# Create Database:
#### **Database: employees**
<img width="1344" height="797" alt="Screenshot 2025-12-23 190421" src="https://github.com/user-attachments/assets/d0c38547-14b0-4af2-b0fe-c9e60ee74cfc" />

#### **Load Employee Data Base**
- File -> Open SQL Script
- Then Choose the  employee file at the location
```
C:\Users\pmgho\OneDrive\Documents\SQL_Prac
```
- Then Click Open
<img width="410" height="546" alt="Screenshot 2025-12-23 191134" src="https://github.com/user-attachments/assets/2a8e1db6-b072-4b9b-b4b4-ff99fb64bc8e" />
<img width="1920" height="1080" alt="Screenshot 2025-12-23 191155" src="https://github.com/user-attachments/assets/901c8ded-4d8c-4512-a02b-bd06c933c07a" />


#### **Execute the Script**
- Execute the Script by clicking execute Button
<img width="1537" height="779" alt="Screenshot 2025-12-23 191454" src="https://github.com/user-attachments/assets/98c6b92f-b269-4620-9041-4578c42ea439" />


#### **View Schema and tables**
- Click the schema Refresh Button  to refresh the schema
- Employee schema is displayed with the following tables
<img width="581" height="640" alt="Screenshot 2025-12-23 193635" src="https://github.com/user-attachments/assets/0dd59381-255f-488e-97e8-7192210ade9d" />


#### Display Record Count
- Use the following statement to view the record count against each table. This is to ensure table 
loaded without any issues

**SELECT COUNT(*) FROM departments;**

**SELECT COUNT(*) FROM dept_emp;**

**SELECT COUNT(*) FROM dept_manager;**

**SELECT COUNT(*) FROM employees;**

**SELECT COUNT(*) FROM salaries;**

**SELECT COUNT(*) FROM titles;**

- Please refer to the **employees_database_prajwal_pract.sql** file for better understanding.

---

# Select Statement

- **SELECT FROM**
```
SELECT first_name , last_name FROM employees;
SELECT * FROM   employees;
SELECT dept_no FROM  departments;
SELECT * FROM   departments;
```

- **SELECT WHERE**
```
SELECT * FROM   employees WHERE FIRST_NAME = 'Denis’;
SELECT * FROM employees WHERE FIRST_NAME = 'Elvis';
```
- **SELECT- WHERE-Operators**

<img width="1029" height="421" alt="Screenshot 2025-12-28 130323" src="https://github.com/user-attachments/assets/7592ef31-deb9-4a52-92cc-2fff46dd76d1" />

---
# WHERE-AND,OR
- AND allows you to logically combine two statements in the condition code block
- **AND –** The AND conditions are set on different columns. The AND operator displays a record if all the 
conditions separated by AND are TRUE.
- **OR -** The OR conditions are set on the same/different column. The OR operator displays a record if 
any of the conditions separated by OR is TRUE.

---
# Operator Precedence

- logical operator precedence is an SQL rule stating that in the execution of the query, the operator AND is applied first, while the operator OR is applied second.
- Operator Precedence regardless of the order in which you use these operators, SQL will always start by reading the conditions around the AND operator
**Precedence can be changed with Brackets ()**

- Bracket Execute First then AND
```
select * from employees WHERE   (Gender ='M' OR 'F') and FIRST_NAME = 'Denis’;
```
- Bracket Execute First then AND- Count 
```
select count(*) from employees WHERE  (Gender ='M' OR 'F') and FIRST_NAME = 'Denis’;
```
- AND First then OR –OR means one condition satisfies more records in the result
```
select * from employees WHERE  Gender ='M' OR 'F' and FIRST_NAME = 'Denis’;
```
- AND First then OR –Count 
```
select count(*) from employees WHERE Gender ='M' OR 'F' and FIRST_NAME = 'Denis';
```
- One more example –AND –OR Combination
```
SELECT  * FROM employees WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna’);
```
- One more example –AND –OR Combination
```
SELECT  count(*) FROM employees WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna’);
```
---

# WHERE-IN-NOT IN
- Get the records based on multiple OR Condition

```
SELECT  * FROM employees WHERE 
first_name = 'Cathie’
OR first_name = 'Mark’
OR first_name = 'Nathan’;
```

- Display Count – 691 Rows
```
select count(*) from employees WHERE  first_name = 'Cathie' OR first_name = 'Mark’ 
OR first_name = 'Nathan’;
```

- Multiple OR can be Replaced with IN-Operator 
```
select count(*) from employees WHERE  first_name IN ('Cathie','Mark' ,'Nathan’);
select *  from employees WHERE  first_name IN ('Cathie','Mark' ,'Nathan');
```

- **NOT IN Operator** – Get all the records other than the name specified in the Bracket
```
select count(*) from employees WHERE  first_name NOT IN ('Cathie','Mark' ,'Nathan’);
select *  from employees WHERE  first_name NOT IN ('Cathie','Mark' ,'Nathan’);
SELECT  * FROM employees WHERE first_name IN ('Denis' , 'Elvis’);
```

- **Example 2 – IN**
```
SELECT  * FROM employees WHERE first_name IN ('Denis' , 'Elvis’);
```

- **Example 2 – NOT IN**
```
SELECT * FROM employees WHERE  first_name NOT IN ('John' , 'Mark', 'Jacob');
```
---

# WHERE-LIKE-NOT LIKE
- Like /Not Like – This is used for Pattern Matching. Use the % symbol for pattern matching.
- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
- There are two wildcards often used in conjunction with the LIKE operator:
   - The percent sign (%) represents zero, one, or multiple characters
   - The underscore sign (_) represents one, single character
- The percent sign and the underscore can also be used in combinations
- You can also combine any number of conditions using AND or OR operators

---

- **Here are some examples showing different LIKE operators with '%' and '_' wildcards:**
<img width="909" height="446" alt="Screenshot 2025-12-28 131532" src="https://github.com/user-attachments/assets/359f744f-5f48-41c5-9c50-8d58ba7b99d4" />

- Get all Names starting with Mar
```
SELECT * FROM employees WHERE  first_name LIKE ('Mar%’);
```
- Get all Names starting with ar
```
SELECT * FROM employees WHERE  first_name LIKE ('ar%’);
```
- Get all Names Ending with ar
```
SELECT * FROM employees WHERE  first_name LIKE ('%ar’);
```
- Get all Names where ar is available 
```
SELECT * FROM employees WHERE  first_name LIKE ('%ar%');
```
- Get all Four Letter Name starting with Mar

```
SELECT * FROM employees WHERE  first_name LIKE ('Mar_’);
```
- Not Like -Get all Name other than Mar in the text
```
SELECT * FROM employees WHERE  first_name NOT LIKE ('%Mar%’);
```
- Like More Examples
```
SELECT  * FROM  employees WHERE  first_name LIKE('Mark%');  
SELECT * FROM employees WHERE hire_date LIKE ('%2000%’);
SELECT * FROM employees WHERE  emp_no LIKE ('1000_');
```
---

# WHERE-Wildcard Characters
**%**  a substitute for a sequence of characters
- Eg - LIKE (‘Mar%’) – Result - Mark, Martin, Margaret

**_**   helps you match a single character 
- LIKE (‘Mar_’)  - Result - Mark, Marv, Marl 

**'*'**  will deliver a list of all columns in a table. It can be used to count all rows of a table 
- Eg - SELECT * FROM employees;

---

# WHERE-Between .. AND
- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

- The BETWEEN operator is inclusive: begin and end values are included

```
Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```
---

# WHERE-IS NOT NULL /IS NULL
- IS NULL /IS NOT NULL
  - It is not possible to test for NULL values with comparison operators, such as =, <, or <>.
  - We will have to use the IS NULL and IS NOT NULL operators instead.
- IS NULL Syntax

```
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```

- IS NOT NULL Syntax
```
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
```
---

# Other  Comparison Operators

<img width="718" height="303" alt="Screenshot 2025-12-28 132539" src="https://github.com/user-attachments/assets/b34c5ec5-8d9d-4085-8ff5-cab9cda25e6d" />

```
SELECT  * FROM employees WHERE first_name = 'Mark’;
SELECT  * FROM employees WHERE first_name <> 'Mark’;
SELECT  * FROM employees WHERE first_name != 'Mark’;
SELECT  * FROM employees WHERE hire_date > '2000-01-01’;
SELECT  * FROM employees WHERE hire_date >= '2000-01-01’;
SELECT  * FROM employees WHERE hire_date < '1985-02-01’;
SELECT  * FROM employees WHERE hire_date <= '1985-02-01’;
SELECT  * FROM employees WHERE hire_date >= '2000-01-01'  AND gender = 'F’;
SELECT * FROM salaries WHERE salary > 150000;
```

---
# Select – Distinct

- The SELECT DISTINCT statement is used to return only distinct (different) values.

```
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

- Example
```
select distinct Gender from employees; 
SELECT DISTINCT hire_date FROM employees;
```
---

# Aggregate Functions
<img width="731" height="512" alt="Screenshot 2025-12-28 132807" src="https://github.com/user-attachments/assets/b63f1065-aa44-4473-af4a-6b6330a102e4" />
<img width="703" height="495" alt="Screenshot 2025-12-28 132821" src="https://github.com/user-attachments/assets/2f7b10fa-556a-4d58-b7df-d9485ee6b5a3" />

- Examples 

```
select count(emp_no) from employees;
select count(first_name) from employees; 
select COUNT(DISTINCT (first_name)) from employees; 
SELECT  COUNT(*) FROM salaries WHERE salary >= 100000;
SELECT  COUNT(*) FROM dept_manager;
```
---

# ORDER- BY

- The ORDER BY keyword is used to sort the result-set in ascending or descending order.

- The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

- Syntax 
```
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC
```
---

# GROUP- BY
- **GROUP BY** When working in SQL, results can be grouped according to a specific field or fields 
- **GROUP BY** - GROUP BY must be placed immediately after the WHERE conditions, if any, and just before the ORDER BY clause 
- **GROUP BY** is one of the most powerful and useful tools in SQL

- The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

```
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
```
---

# Aliases (AS)
- names_count is the aliase name 
```
select first_name, count(first_name) as names_count from employees group by 
first_name order by first_name  DESC; 

SELECT salary, COUNT(emp_no) AS emps_with_same_salary FROM salaries WHERE  salary > 80000 GROUP BY salary ORDER BY salary;
```
---

# Having
- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

```
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
```

#### Difference - WHERE and HAVING

<img width="830" height="288" alt="Screenshot 2025-12-28 134430" src="https://github.com/user-attachments/assets/108bb057-5433-4e92-b0dd-e7b8f0705c27" />

---

# Limit
- Display more than 1000 records  in the Display Editor

- Edit ->Preferences -> SQL Execution-> Un Check Limit Rows Check Box -> OK

<img width="935" height="385" alt="Screenshot 2025-12-28 133810" src="https://github.com/user-attachments/assets/3961aab9-3dfa-4bc8-8f50-af3c28233801" />

- Display the employee numbers of the 10 highest-paid employees in the database.

```
select * from salaries order by salary desc LIMIT 10; 
```
- The sorting is based on EMP NO, it displays records based on EMP NO, not based on the Salary
```
select * from salaries order by emp_no desc LIMIT 10; 
SELECT  *  FROM  dept_emp LIMIT 100;
```
---

# SQL Order
- Display Limit can be set as mentioned below as well. 

- This Limit is applicable only to the specific Query only

<img width="902" height="314" alt="Screenshot 2025-12-28 133953" src="https://github.com/user-attachments/assets/6bb072d1-f91c-4290-8c52-58dd5736e371" />

---

# SQL Order

```
SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s)
LIMIT number;
```
- Please refer to the Select Statement.sql file for better understanding. 
----
# Insert Statement
<img width="1327" height="598" alt="Screenshot 2025-12-29 183141" src="https://github.com/user-attachments/assets/df4273db-8d3c-4051-bd79-3131ef32a4d9" />

# INSERT –INTO 
```
INSERT INTO employees 
(emp_no,birth_date,first_name,last_name,gender,hire_date)values (999901,'1986-04-21', 'John', 'Smith', 'M', '2011-01-01’);
```
- The newly inserted record displays as the first record, since in the employee number inserted is the highest number
```
select * from employees order by emp_no DESC limit 5;
INSERT INTO employees VALUES  ( 999903,  '1977-09-14', 'Johnathan', 'Creek', 'M', '1999-01-01' );
```
```
SELECT  * FROM  titles LIMIT 10;
insert into titles ( emp_no, title, from_date)values (  999903, 'Senior Engineer', '1997-10-01' ); 
SELECT  * FROM titles ORDER BY emp_no DESC;
```
```
SELECT    *  FROM  dept_emp ORDER BY emp_no DESC  LIMIT 10; 
insert into dept_emp ( emp_no, dept_no, from_date,  to_date ) values ( 999903, 'd005', '1997-10-01', '9999-01-01' );
```
----
# INSERT –Data Into One table from another Table
```
select * from  departments ;

# Create Duplicate Table 

DROP TABLE IF EXISTS department_dup;
 CREATE TABLE department_dup
( 
 dept_no  char(4) NOT NULL, 
 dept_name varchar(40) NOT NULL  
);
```
```
# Insert Data to Duplicate Table

INSERT INTO department_dup (dept_no ,dept_name ) SELECT * FROM  departments ;
SELECT * From department_dup;
```
- Please refer to the Select Insert Statement_Update Statement_Delete Statement.sql file for better understanding.
----
# Update Statement

#### Commit and Roll Back

- The COMMIT statement 
  - saves the transaction in the database 
  - changes cannot be undone
  - used to save the state of the data in the database at the moment of its execution

- The ROLLBACK clause 
  - allows you to take a step back 
  - the last change(s) made will not count 
  - reverts to the last non-committed state 
  - it will refer to the state corresponding to the last time you executed COMMIT
  - ROLLBACK will have an effect on the last execution you have performed
  - you cannot restore data to a state corresponding to an earlier COMMIT

# Safe Update Check Box Unchecked
- **Edit –> Preferences -> SQL Editor -> Un Check Safe Update Check BOX -> OK**
<img width="937" height="664" alt="Screenshot 2025-12-29 184452" src="https://github.com/user-attachments/assets/cfd96820-eaee-44cc-b6e4-2845fe0d18e2" />
<img width="1391" height="952" alt="Screenshot 2025-12-29 184533" src="https://github.com/user-attachments/assets/ff68b837-8160-4bfb-995d-0d1008b096df" />

- Update Record where EMP_No = 999901
```select * from employees where emp_no = 999901;```

- Update Data 
```Update employees SET First_name = 'Stella', last_name = 'Parkinson' , birth_date ='1990-12-31', Gender ='F' where emp_no = 999901; ```

- Display Updated Data
```select * from employees where emp_no = 999901;```
```
select * from department_dup ; 
COMMIT;
```
- The following update statement updates all records in the table
```
update department_dup SET Dept_no = 'd011',  dept_name = 'Quality Control’;  
select * from department_dup ;
```
- Rollback will take  you  till the previous commit statement 
``` 
ROLLBACK;  
select * from department_dup ;
```
```
select * from departments;   
UPDATE departments SET  dept_name = 'Data Analysis' WHERE  dept_no = 'd002';   
select * from departments;
```
- Please refer to the Select Insert Statement_Update Statement_Delete Statement.sql file for better understanding.
----

# Delete Statement
```
select * from employees where emp_no = 999903 ;    

DELETE from employees where emp_no = 999903 ;    

select * from employees where emp_no = 999903 ; 

rollback ; 

select * from employees where emp_no = 999903 ; 
```

- Delete Complete Data from the Table
```
DELETE FROM department_dup ;

rollback ;   

SELECT * FROM department_dup ; 

DELETE FROM departments WHERE dept_no = 'd010';
```
# DROP, DELETE and TRUNCATE

- DROP - you won’t be able to roll back to its initial state, or to the last COMMIT statement 

- Use DROP TABLE only when you are sure you aren’t going to use the table in question anymore

- TRUNCATE ~ DELETE without WHERE When truncating, auto-increment values will be reset

- DELETE removes records row by row

- Please refer to the Select Insert Statement_Update Statement_Delete Statement.sql file for better understanding.
----
# Aggregate Function

- Aggregate functions - they gather data from many rows of a table, then aggregate it into a single value
- The information contained in multiple rows is the single value they provide.
- MySQL provide a set of aggregate functions that perform operations on all the entities of the column of a table considering them as a single unit.

<img width="1126" height="639" alt="Screenshot 2025-12-31 172959" src="https://github.com/user-attachments/assets/16cd3366-f42d-4404-92b6-1b88a8862119" />
<img width="1273" height="665" alt="Screenshot 2025-12-31 173057" src="https://github.com/user-attachments/assets/a17225a6-f92d-417a-9f6d-2cd3856ae363" />

**COUNT() - applicable to both numeric and non-numeric data**
```
SELECT COUNT(Salary) from Salaries;
SELECT COUNT(from_date) from Salaries;
```
**Count Distinct: Find the number of times unique values are encountered in a given
column.**
```
SELECT COUNT(distinct (from_date)) from Salaries;
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;
```
**COUNT(*): * returns the number of all rows of the table, values NULL included**
```
SELECT COUNT(*) from Salaries;
```
---
# Aggregate Functions- Sum()
- **SUM()** - works only with numeric data
```SELECT SUM(Salary) from Salaries;```
```SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';```
---
# Aggregate Functions- Max() and Min()
```
SELECT MAX(Salary) from Salaries;
SELECT MIN(Salary) from Salaries;
SELECT MAX(salary) FROM salaries WHERE from_date > '1997-01-01’;
SELECT MIN(emp_no) FROM employees;
SELECT MAX(emp_no) FROM employees;
```
---
# Aggregate Functions- Avg()
- Extracts the average value of all non-null values in a field
```SELECT AVG(Salary) from Salaries;```
```SELECT AVG(salary) FROM salaries WHERE from_date > '1997-01-01’;```
---
# Aggregate Functions- ROUND()
- ROUND(#,decimal_places) - numeric, or math, function you can use
- ROUND() - usually applied to the single values that aggregate functions return

```SELECT ROUND(AVG(Salary)) from Salaries;```
```SELECT ROUND(AVG(Salary),2) from Salaries;```
```SELECT ROUND(AVG(Salary),-2) from Salaries;```
```SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';```

---
# IF NULL () and COALESCE()
- IFNULL(expression_1, expression_2)

- Returns the first of the two indicated values if the data value found in the table is not null, and returns the second value if there is a null value

- COALESCE(expression_1, expression_2 …, expression_N) Allows you to insert N arguments in the parentheses

- COALESCE() will always return a single value of the ones we have within parentheses, and this value will be the first non-null value of this list, reading the values from left to right

- if COALESCE() has two arguments, it will work precisely like IFNULL()

- IFNULL() and COALESCE() do not make any changes to the data set. They merely create an output where certain data values appear in place of NULL values. 

- **IFNULL()works with precisely two arguments**

- **COALESCE() can have one, two, or more arguments I**
```
DROP TABLE IF EXISTS department_dup ;
CREATE TABLE department_dup
 (
dept_no char(4),
dept_name varchar(40),
dept_manager varchar(40)
);
INSERT INTO department_dup (dept_no , dept_name ) select * from departments ;
select * from department_dup;
insert into department_dup (dept_no) values ('D100’);
insert into department_dup (dept_no) values ('D101’);
```
- **Use of IFNULL**
```
select * from department_dup;

select dept_no, IFNULL (dept_name, 'No Department Name') as dept_name from department_dup; 
```
- **Replace IFNULL() with COALESCE()**
```select dept_no, COALESCE(dept_name, 'No Department Name') as dept_name from department_dup;```
- COALESCE() – with three arguments
```select dept_no, dept_name, COALESCE(Dept_Manager, Dept_Name , 'N/A') as dept_manager from department_dup;```

- COALESCE () Can be used to generate Dummy columns
```
select dept_no,COALESCE ('Good Day') as Day from department_dup;
SELECT dept_no, dept_name, COALESCE(dept_no, dept_name) AS dept_info FROM
departments_dup ORDER BY dept_no ASC;
```
---
# Replacing NULL Values
- Three ways to replace **NULL values - ISNULL() Function, Case Statement & COALESCE() Function**
<img width="668" height="440" alt="Screenshot 2026-01-03 121347" src="https://github.com/user-attachments/assets/34d63b92-587c-45ce-9b74-8ea1e5e2225f" />

- Create Table 
```
Drop table if exists tblEmployees;

Create table tblEmployees
(	
EmployeeID int,  
Name varchar(50),    
ManagerID int 
); 
Insert  Data 

insert into tblEmployees values (1, 'Mike',3);
insert into tblEmployees values (2, 'Rob',1);
insert into tblEmployees values (3, 'Todd',NULL);
insert into tblEmployees values (4, 'Ben',1);
insert into tblEmployees values (5, 'Sam',1);
```

- Replace Manager null with No Manager
```
SELECT E.Name as Employee, IFNULL(M.Name,'No Manager') as Manager 
FROM tblEmployees E
LEFT JOIN tblEmployees M 
ON E.ManagerID = M.EmployeeID;
```

- Replacing **NULL** value using **COALESCE()** function: COALESCE() function, returns the first NON NULL value.
```
SELECT E.Name as Employee, COALESCE(M.Name, 'No Manager') as Manager
FROM tblEmployees E
LEFT JOIN tblEmployees M
ON E.ManagerID = M.EmployeeID;
```
- Please refer to the Select Aggregate Functions.sql file for better understanding.

----

# Union and Join
----
# Union
- Union is used to combine two queries into a single result set using the select statements. Union extracts all the rows that are described in the query.

**Rules for Union**
- The number and order of the columns should be the same in all queries.
- The corresponding column position of each select query must have a compatible data type.
- The column name selected in the different SELECT queries must be in the same order.
- The first SELECT query's column name will be the output's column name.
- The number of columns used in your first and second queries must be the same and the data type (e.g. INT,VARCHAR,etc.) must match.
- The column name included in both queries can differ; when this is the case, the resulting dataset will show the column name from the first query.
- When using SQL aliases in conjunction with UNION and UNION ALL, you only need to include the alias with the first query, Including it with the second query will not cause an error but will also have no impact on the output.
---
# Union VS Union ALL
#### **Union** combines the result set of two or more SELECT statements, only distinct values.
```
SELECT column_1, column_2
FROM table_1
[WHERE condition]
 
UNION
 
SELECT column_1, column_2
FROM table_2
[WHERE condition]

```
#### **UNION ALL** combines the results of two or more SELECT statements, showing all values, including duplicates if they exist.
```
SELECT column_1, column_2
FROM table_1
[WHERE condition]
 
UNION ALL
 
SELECT column_1, column_2
FROM table_2
[WHERE condition]
```
<img width="1686" height="749" alt="Screenshot 2026-01-02 115250" src="https://github.com/user-attachments/assets/acd228a2-6ee5-4d6f-bb76-7cbb386c8802" />

- The Union and Join clauses are different
  - Union always combines the result set vertically.
  - UNION combines data from multiple similar tables.
  - Join appends the output horizontally. 
  - JOIN combines data from multiple different tables
<img width="1168" height="549" alt="Screenshot 2026-01-02 125753" src="https://github.com/user-attachments/assets/fb146c63-4c71-4577-a82e-38b2807060b9" />

----
# Union
- Please refer to the Union and Joins.sql file for better understanding.
----
# Joins
<img width="1346" height="765" alt="Screenshot 2026-01-03 124538" src="https://github.com/user-attachments/assets/60d504be-6298-4670-af24-e7099d02abc8" />
<img width="1179" height="671" alt="Screenshot 2026-01-03 124652" src="https://github.com/user-attachments/assets/c8147d38-780c-4be0-ae66-4f342e54e879" />

- Join in the SQL tool that allows us to cunstruct a relationship between objects.
- A join shows a result set,containing fields derived from two or more tables.
- To create Join need to find a related column from the two tables that contains the same type of data.

# Inner Join or Join

<img width="938" height="540" alt="Screenshot 2026-01-03 125156" src="https://github.com/user-attachments/assets/3f47b4ba-cd9a-4aea-bf89-942641abf311" />

- Please refer to the Union and Joins.sql file for better understanding.

----

# Left Outer Join or Left Join

<img width="957" height="643" alt="Screenshot 2026-01-03 195252" src="https://github.com/user-attachments/assets/691a2c2e-44d6-4785-9493-aa570fed085d" />

- Please refer to the Union and Joins.sql file for better understanding.

----

# Right Outer Join or Right Join

<img width="927" height="626" alt="Screenshot 2026-01-03 195432" src="https://github.com/user-attachments/assets/68093cc4-f63b-4264-a9d7-675c55d10bf1" />


- Please refer to the Union and Joins.sql file for better understanding.

----

# Full Outer Join or Full Join

<img width="887" height="580" alt="Screenshot 2026-01-03 125606" src="https://github.com/user-attachments/assets/fe4cabb7-09a6-4c91-aa72-981b661c011c" />

- Please refer to the Union and Joins.sql file for better understanding.
----
# Subqueries
- A subquery is a SQL query nested inside a larger query

- A subquery may occur in:
  - A SELECT clause
  - A FROM clause
  - A WHERE clause
- In MySQL subquery can be nested inside a SELECT, INSERT, UPDATE, DELETE, SET, or DO statement or inside another subquery
- A subquery is usually added within the WHERE Clause of another SQL SELECT statement
-  You can use the comparison operators, such as >, <, or =. The comparison operator can also be a multiple-row operator, such as IN, ANY, SOME, or ALL
- A subquery can be treated as an inner query, which is a SQL query placed as a part of another query called as outer query
- The inner query executes first before its parent query so that the results of the inner query can be passed to the outer query.

---

#### **The following are the rules to use subqueries:**
- Subqueries should always be in parentheses.
- If the main query does not have multiple columns for subquery, then a subquery can have only one column in the SELECT command.
- We cannot use the ORDER BY clause in a subquery, although it can be used inside the main query.
- If we use a subquery in a set function, it cannot be immediately enclosed in a set function.

---

#### **The following are the advantages of using subqueries:**
- The subqueries provide alternative ways to query the data from the table; otherwise, we need to use complex joins and unions.
- The subqueries are more readable than complex join or union statements.
- The subqueries make the queries in a structured form that allows us to isolate each part of a statement.

#### **Subqueries-Exists**
#### EXISTS
- checks whether certain row values are found within a subquery
  - this check is conducted row by row
  - it returns a Boolean value
- if a row value of a subquery exists  **-> TRUE ->**  the corresponding record of the outer query is extracted
- if a row value of a subquery doesn’t exist **->FALSE->** no row value from the outer query is extracted

---

####  Comparison Exists and IN
<img width="1068" height="515" alt="Screenshot 2026-01-04 092942" src="https://github.com/user-attachments/assets/24e7fc43-6448-4e67-a110-16a59d4d94c3" />

- Please refer to the Subqueries.sql file for better understanding.



