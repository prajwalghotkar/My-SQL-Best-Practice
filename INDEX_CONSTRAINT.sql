# INDEX 
/*
- The CREATE INDEX statement is used to create indexes in tables.
- Indexes are used to retrive data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.alter
*/

DROP TABLE IF EXISTS Persons;
CREATE TABLE IF NOT EXISTS Persons
(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
City varchar(255)
);

INSERT INTO Persons(ID,LastName,firstName,Age,City) values (100,'John','Green',40,'Mumbai');

# Create an Index on One Column
CREATE INDEX idx_lastname ON Persons(LastName);

select * from Persons;

# Create an Index on Multiple Column
CREATE INDEX idx_pname ON Persons(LastName,FirstName);

# Drop Index
Alter Table Persons Drop Index idx_pname;

