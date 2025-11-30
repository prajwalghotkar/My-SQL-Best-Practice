# CHECK
# CHECK Constraint is used limit the range of the values, that can be entered for a column.
/*
The general formula for adding check constarint in SQL Server.

# ALTER TABLE {TABLE_NAME}
ADD CONSTRAINT {CONSTRAINT_NAME} CHECK (BOOLEAN_EXPERSSION)

# To drop the CHECK constraint:

ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age
*/

# In simple way before it inserting data check constraint check whether if it is following condition satisfy or not.

USE database_data;

# Create Table

DROP TABLE IF exists tblperson1;
CREATE TABLE if not exists tblperson1
(
id int,
Name nvarchar(50),
Age int
);

# Insert Data (250 is not valid Age)

insert into tblperson1 values (1,'Sam',50);
insert into tblperson1 values (2,'Pam',250);
select * from tblperson1;

delete from tblperson1;

# Insert Data

insert into tblperson1 values (1,'Prajwal',23);
insert into tblperson1 values (2,'Jully',22);

ALTER TABLE tblperson1 ADD CONSTRAINT CK_tblperson1_Age CHECK (Age>=0 AND Age<=100);

# Insert Data, it gives an error

insert into tblperson1 values (2,'Siriya',250);

--------

# Check Constraint

-- The CHECK constraint is used to limit the value range that can be placed in a column.
-- If you define a CHECK constraint on a column it will allow only certain values for this column.
-- If you define a CHECK constraint on a table it can limit the values in certain columns baseed on avlues in other columns in the row.alter

# CREATE TABLE with Check Constraint

DROP TABLE IF EXISTS Persons1;

CREATE TABLE Persons1
(
ID int NOT NULL,
FirstName varchar(255) NOT NULL,
LastName varchar(255),
Age int,
CHECK (Age>=18)
);

# Insert Data

INSERT INTO Persons1 VALUES(100,'Prajwal','Ghotkar',20);
INSERT INTO Persons1 VALUES(101,'Jully','Green',21);

select * from Persons1;

# Insert Data Error - Age < 18

INSERT INTO Persons1 VALUES(102,'Tom','Soto',15);

---

# CREATE TABLE with Check Constraint Multiple Columns

DROP TABLE IF EXISTS Persons1;

CREATE TABLE Persons1
(
ID INT NOT NULL,
LASTNAME varchar(255) NOT NULL,
FIRSTNAME varchar(255),
Age int,
City varchar(255),
CONSTRAINT CHECK_Persons1 CHECK(Age >=18 AND City='LONDON')
);

INSERT INTO Persons1 VALUES(1,'Ghotkar','Prajwal',21,'LONDON');

# Add invalid age and city ---> error

INSERT INTO Person1 VALUES(2,'Green','Juliya',23,'USA');

----

# CREATE TABLE and Add check constraint with Alter Statement

DROP TABLE IF EXISTS Persons1;

CREATE TABLE Persons1
(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
City varchar(255)
);

ALTER TABLE Persons1 ADD CHECK (Age >= 18); 

INSERT INTO Persons1 VALUES(1,'GHOTKAR','PRAJWAL',23,'UK');

# Insert Data Error ---> Age > 18

INSERT INTO Persons1 VALUES(2,'SOTO','SIRIYA',17,'USA'); # ----> ERROR

----

# CREATE TABLE and Add check constraint with Alter Statement

DROP TABLE IF EXISTS Persons1;

CREATE TABLE Persons1
(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
City varchar(255)
);

# Alter Statement - Check with multiple columns and with Constraint Name

ALTER TABLE Persons1 ADD CONSTRAINT CK_Persons1_Age CHECK(Age>=18 AND City = 'Mumbai');

INSERT INTO Persons1 VALUES(2,'SOTO','SIRIYA',19,'Mumbai');
INSERT INTO Persons1 VALUES(3,'GREEN','JULIYA',21,'Mumbai');
INSERT INTO Persons1 VALUES(4,'GHOTKAR','PRAJWAL',23,'Mumbai');
INSERT INTO Persons1 VALUES(5,'SUTO','JULLY',24,'Mumbai');

SELECT * FROM Persons1;

# INSERT DATA ERROR ----> AGE > 18 AND CITY = 'MUMBAI'

INSERT INTO Persons1 VALUES(5,'SUTO','JULLY',24,'Singapur'); # error

# Drop Check Constraint

ALTER TABLE Persons1 DROP CHECK CK_Persons1_Age;

-- Keep Learning SQL with Prajwal 














