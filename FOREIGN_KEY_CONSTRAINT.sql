# Foreign Key
/*
- Foreign Key constraint is used to link two tables together.It is also known as the referencing key.

- A foregin key column matches the primary key field of another table. It means a foreign key field in one table refers to the primary key field of another table.

- Syntax:

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
*/

/*
# Parameters:

- CREATE TABLE table_name_1: This statement is used to create a new database table.

- column_name_1,column_name_2,....: Specify the name columns you want to create on the table.

- datatype: Specify the datatype of each column in the table.

- PRIMARY KEY (column_name_1): Specify the column name on which the primary key constraint has to be applied. it should be a NOT NULL column.

- FOREGIN KEY (column_name_2): Specify the column name on which foregin key constraint has to be applied.

- REFERENCES table_name_2(column_name_2): Specify the table name and the column on which the foregin key in the first table is linked.
*/
# Foreign Key - Example 1
 
USE prajwal_data;

# Create Table Persons with Primary Key
DROP TABLE IF EXISTS Persons;
CREATE TABLE IF NOT EXISTS Persons
(
Person_ID int NOT NULL PRIMARY KEY,
Name varchar(45) NOT NULL,
Age int,
City varchar(25)
);

# Create Table Orders with Foreign Key
DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders
(
Order_ID int NOT NULL PRIMARY KEY,
Order_Num int NOT NULL,
Person_ID int,
FOREIGN KEY(Person_ID) REFERENCES Persons(Person_ID)
);
------
# Foreign Key - Example 2

-- Create Table Customers Primary Key
DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers
(
Customer_id INT,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key (Customer_id)
);

-- Create Table Sales Foregin Key

DROP TABLE IF EXISTS Sales;
CREATE TABLE if not exists Sales
(
purchase_number INT NOT NULL AUTO_INCREMENT,
date_of_purchase DATE,
customer_id INT,
intem_code VARCHAR(10),
PRIMARY KEY (purchase_number),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

# Foreign Key - Alter Table
-- Create Table Sales with Primary Key

DROP TABLE IF EXISTS Sales;
CREATE TABLE if not exists sales
(
purchase_number INT NOT NULL AUTO_INCREMENT,
date_of_purchase DATE,
customer_id INT,
intem_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

# Alter table to add foreign key

ALTER TABLE Sales ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

# DROP Foreign Key
/*
Click the I button Next to the Table name, Click the DDL tab, and get the Foreign Key name. Use the Alter command to Drop the Foreign Key
*/
ALTER TABLE Sales DROP FOREIGN KEY sales_ibfk_1;





