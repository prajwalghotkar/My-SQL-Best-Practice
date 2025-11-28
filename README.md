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
  

  
