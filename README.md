# My-SQL-Best-Practice

<img width="1731" height="843" alt="Screenshot 2025-11-28 082837" src="https://github.com/user-attachments/assets/f7d15cad-ef20-42b1-939b-368e1dad2088" />

---

# DataBase:
- MySQL is the world’s most popular open-source database. It is a relational database management system (RDBMS) developed by Oracle based on structured query language (SQL).

- A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each.

#### Syntax
- CREATE DATABASE databasename;

#### Example 
- create database Sales

#### Drop (Delete) database 

- drop database Sales
---
## Syntax
### **CREATE DATABASE [IF NOT EXISTS] database_name;**
- [IF NOT EXISTS] verifies if a database with the same name exists already
- Element the square brackets are optional

- **database_name:** Give a name that is short but at the same time as related to the content of the data as possible

 - The SQL code is not case-sensitive 

- ; (the semicolon character) it functions as a statement terminator
  - when your code contains more than a single statement, ; is indispensable
  - will help you avoid errors sometimes
  - will improve the readability of your code

- Example (to view the database created use the refresh button)
create database if not exists Sales;    
drop database Sales;

---
# Create Schema
- In MySQL, schema is synonymous with database. As the query is written to create the database, similarly the query can be written to create the schema.

- The logical structure can be used by the schema to store data while the memory component can be used by the database to store data. Also, a schema is a collection of tables while a database is a collection of schema.

- The database is created with the syntax ----> 	create database databasename;

##### Example     create database DatabaseSample;

##### The syntax to create a schema ---->	create schema SchemaName;

##### Example create schema SchemaSample;

- To display the database and the schema as well, the show command is used.

- Example ----> show databases;

# Data Base Details 
- Click the information symbol next to the database, it opens the database details in different tabs such as info, Tables, Columns, Indexes  etc
<img width="1359" height="406" alt="Screenshot 2025-11-28 084244" src="https://github.com/user-attachments/assets/2e9b26da-8dee-4506-bc13-07b7ea1450bf" />

- To use or activate the database use the command ---->  **use sales**

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
<img width="887" height="327" alt="Screenshot 2025-11-28 084846" src="https://github.com/user-attachments/assets/141a97e1-a3cc-4d81-9656-6c84df7d93bb" />
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
**SELECT * FROM sales;**
**SELECT * FROM sales.sales;**
---
# Drop Table
- The DROP statement used for deleting an SQL object
##### Syntax
- DROP TABLE table_name;
##### Example 
- DROP TABLE sales

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
