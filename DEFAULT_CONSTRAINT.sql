# Default Constraint
-- The DEFAULT constraint is used to set a default if no other for a column.
-- The default value will be added to all new records if no other value is specified.

USE prajwal_data;

DROP TABLE IF EXISTS Person;

CREATE TABLE Person
(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
City varchar(255) DEFAULT 'Delhi'
);

# Insert Data to All Columns

INSERT INTO Person values(100,'John','Green',20,'Pune');
INSERT INTO Person values(101,'Prajwal','Ghotkar',23,'Mumbai');

# Insert Data to Selected Columns - Default Value in City column

INSERT INTO Person(ID,LastName,Age) Values (101,'Tom',40);

select * from Person;

# Default Constraint with Currect Date

# The DEFAULT Value with Current Date

Drop Table if exists Orders;

CREATE TABLE Orders
(
ID int NOT NULL,
OrderNumber int NOT NULL,
OrderDate datetime default current_timestamp
);

# Insert Data without Date column - Default current timestamp will be inserted

INSERT INTO Orders(ID,OrderNumber) VALUES(100,1000);
SELECT * FROM Orders;

# Default Constraint - Alter Table

DROP TABLE IF EXISTS Persons;

CREATE TABLE Persons
(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
City varchar(255)
);

# Add Default Constraint with Alter Table

ALTER TABLE Persons ALTER City SET DEFAULT 'Delhi';

# Insert Data - With Default Value

INSERT INTO Persons (ID,LastName,Age) Values(101,'Tom',40);

select * from Persons;

# Drop Default Constraint

ALTER TABLE Persons ALTER city DROP Default;

select * from Persons;










