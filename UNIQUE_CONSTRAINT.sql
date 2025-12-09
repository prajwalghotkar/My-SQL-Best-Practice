# The UNIQUE constraint ensures that all values in a column are different.alter
/*
 Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
 
 A PRIMARY KEY constraint automatically has a UNIQUE constraint.
 
 However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

*/
USE database_data;

# CREATE TABLE with Unique Key Constraint.

DROP table if exists Persons;

CREATE TABLE Persons
(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
UNIQUE(ID)
);

# Insert Data No Error

INSERT INTO Persons Values (100,'Ghotkar','Prajwal',24);
INSERT INTO Persons Values (101,'Ghotkar','Manu',21);
INSERT INTO Persons Values (102,'Dhule','Samu',18);

select * from Persons;

# Insert Data Error due to Duplicate ID

INSERT INTO Persons Values(100,'John','Green',23);

# Unique Constraint - Multiple Columns

DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer
(
Customer_id INT NOT NULL,
Customer_last_name VARCHAR(255) NOT NULL,
Customer_first_name VARCHAR(255),
Customer_location VARCHAR(255),
Customer_Email VARCHAR(255),
CONSTRAINT UC_Customer UNIQUE(Customer_id,Customer_Email)
);

# No Error 
INSERT INTO Customer Values(100,'John','Green','UK','xyz@gmail.com');
 
 # No Error
INSERT INTO Customer Values(102,'Seem','Green','USA','seem@gmail.com'); 

Drop table customer;

# Error ID and Email Combination repeating
INSERT INTO Customer Values(102,'Kim','Prajwal','India','xyz@gmail.com');


# Unique Constraint - Alter Table

DROP TABLE IF Exists Customer;

CREATE TABLE Customer
(
ID int NOT NULL,
LASTNAME varchar(255) NOT NULL,
FIRSTNAME varchar(255) NOT NULL,
AGE INT
);

-- Create a Unique Key with an Alter Table

ALTER TABLE Customer ADD UNIQUE(ID);

INSERT INTO Customer VALUES(100,'Green','Johan',21);
INSERT INTO Customer VALUES(101,'Ghotkar','Prajwal',22); 

# ERROR
INSERT INTO Customer VALUES(101,'xyz','pqr',21);

/*
Display all the indexes for the given table_name. and you can pick the name of the index or the unqiue key you want to remove.

-- Key Name is the Index Name

SHOW INDEX FROM Customer;
*/

# Example 2

-- First UNIQUE constraint is defined for the phone column

-- The second constraint is for both name and address columns

DROP Table if Exists suppliers;

CREATE TABLE suppliers
(
suppliers_id INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
phone VARCHAR(255) NOT NULL UNIQUE,
address VARCHAR(255) NOT NULL,
PRIMARY KEY(suppliers_id),
CONSTRAINT uc_name_address UNIQUE(name,address)
);

# Insert first Record

INSERT INTO suppliers (name,phone,address) VALUES('ABC INC','(408)-908-2476','400 NORTH 1st Street');

# View Data
select * from suppliers;

# Insert record with same phone number - ERROR
INSERT INTO Customer (name,phone,address) VALUES('XYZ Corporation','(408)-908-2476','3000 North 1st Street');

 





