# Auto Increment

-- MySQL uses the AUTO_INCREMENT  keyword to perform an auto-increment feature.
-- By default, the starting value for AUTO_INCREMENT is 1, and it will increament by 1 for each new record.

# Person id is auto increament Column


DROP TABLE IF EXISTS Persons;
CREATE TABLE IF NOT EXISTS Persons
(
Personid INT NOT NULL AUTO_INCREMENT,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Age int,
PRIMARY KEY(Personid)
);

# Insert Data

INSERT INTO Persons(LastName,Age) values ('John',40);

select * from Persons;

INSERT INTO Persons(LastName,Age) values ('Prajwal',50);

# Auto Increament
-- Auto Increment Start with 100 (Reset Auto Increatement Value)

ALTER TABLE Persons AUTO_INCREMENT=100;

# Insert Data
INSERT INTO Persons(LastName,Age) values ('John',40);

select * from Persons;

# Auto Increment Start with 500 (Reset Auto Increament Value)

INSERT INTO Persons(Personid,LastName,Age) values(500,'Johan',40);
INSERT INTO Persons(LastName,Age) values('Manu',41);
select * from Persons;
