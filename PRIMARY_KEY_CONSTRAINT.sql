# Primary Key
/*
- Primary Key is used to identify each recor in a table uniquely.alter
- If the column constraint primary key constraints, then it cannot be null or empty.
- A table may have duplicate columns, but it can contain only one primary key.
- It always contains a unique value in a column.
*/
USE prajwal_data;

DROP TABLE IF EXISTS Students;

CREATE TABLE IF NOT EXISTS Students
(
Student_ID int NOT NULL,
Student_Name varchar(255) NOT NULL,
Class_Name varchar(255),
Age int,PRIMARY KEY (Student_ID)
);

# No Error
INSERT INTO Students VALUES(100,'PRAJWAL','MS_DATA_SCIENECE',24);

# Error
INSERT INTO Student VALUES(100,'SEJU','MS_DATA_SCIENCE',23);

----

# Example 2

DROP TABLE IF EXISTS Persons;

CREATE TABLE IF NOT EXISTS Persons
(
ID int not null Primary Key,
Name varchar(45) NOT NULL,
Age int,
City varchar(25)
);

-- Insert Data to Table

insert into Persons(ID,Name,Age,City) Values(1,'Robert',15,'Florida'),(2,'Prajwal',25,'California'),(3,'Peter',40,'Alaska');

select * from Persons; 

# Insert one more records with the Same ID Primary Key Violation
INSERT INTO Persons(Id,Name,Age,City) VALUES(1,'Stephen',15,'Florida');

----

# Create table customers

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers
(
customer_id INT,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key (customer_id)
);


-- table2 Create Table Items

Drop Table If Exists items;

Create Table if not exists items(
item_code varchar(255),
item varchar(255),
unit_price numeric(10,2),
primary key (item_code)
);

-- table 3 Create Table Companies

DROP TABLE IF EXISTS companies;

create table if not exists companies
(
company_id varchar(255),
company_name varchar(255),
headquarters_phone_number int(12),
primary key (company_id)
); 

 

 

