# Constraints:
/*
1) NOT NULL 
2) CHECK
3) UNIQUE
4) PRIMARY KEY
5) FOREIGN KEY
6) AUTO INCREMENT
7) INDEX
8) ENUM
*/

# 1) NOT NULL
CREATE DATABASE IF NOT EXISTS PRAJWAL_DATA;
USE PRAJWAL_DATA;
DROP TABLE IF EXISTS Persons;
# Without NOT NULL
CREATE TABLE Persons
(
ID int,
LastName varchar(255),
FirstName varchar(255),
Age int
);
INSERT INTO Persons VALUES(100,'Ghotkar','Prajwal',23);
INSERT INTO Persons VALUES(101,'Mark','Mariya',NULL);
SELECT * FROM Persons;

# With NOT NULL
CREATE TABLE IF NOT EXISTS Customers
(
ID int NOT NULL,
Customer_LastName varchar(255) NOT NULL,
Customer_FirstName varchar(255) NOT NULL,
Location varchar(255)
);

INSERT INTO Customers VALUES(101,'GHOTKAR','PRAJWAL','LONDON');
INSERT INTO Customers VALUES(102,'MARK','JULIYA','LONDON');
INSERT INTO Customers VALUES(103,'GHOTKAR','PARTH',NULL);
SELECT * FROM Customers;

DROP TABLE customers;

# NOT NULL Constraint - Alter Table

CREATE TABLE Student_data
(
STU_ID INT,
First_Name VARCHAR(255),
Last_Name VARCHAR(255),
Age INT 
);
INSERT INTO Student_data VALUES(1,'Jully','Mark',NULL);
SELECT * FROM Student_data;
# Delete Data from the table since already NULL values in the Table

DELETE FROM Student_data;

# ALTER Table Statement
ALTER TABLE Student_data MODIFY COLUMN Age int NOT NULL;

# Insert record No Error

INSERT INTO Student_data VALUES(1,'John','Paul',30);
INSERT INTO Student_data VALUES(2,'Prajwal','Ghotkar',23);
INSERT INTO Student_data VALUES(3,'Juliya','Paul',25);
INSERT INTO Student_data VALUES(4,'Seeri','Ghotkar',22);
SELECT * FROM Student_data;

# INSERT Record Error Since Age is NULL

INSERT INTO Student_data VALUES(5,'Tom','Joe',NULL);

