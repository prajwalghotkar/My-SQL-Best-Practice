# Cascading referential integrity
/*
Cascading referential integrity constraint allows Microsoft SQL Server should take when a user attempts to delete or update a key to which an exisiting foreign keys points.alter

For example, if you delete row with ID = 1 FROM tblGender table,then with ID = 3 from tblPerson table becomes an orphan record. You will not be able to tell the Gender for this row.
So, Cascading referential integrity constraint can be used to define actions Microsoft SQL Server should take when this happens. By default,we get an error and the DELETE or UPDATE statement is rolled back.
*/

/*
- Cascading referential integrity
- Options when setting up Cascading referential integrity constraint:

1) NO Action: This is the default behaviour. No Action specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables,
   an error is raised and the DELETE or UPDATE is rolled back.alter
   
2) Cascade: Specifies that if an attempt is made to delete or update a row with a key referenced by foregin keys in existing rows in other tables, all rows containing those foreign keys are also 
   deleted or updated.
   
3) Set NULL: Specifies that if an attempt is made to delete or update a row with a key referenced by foregin keys in esisting rows in other tables, all rows containing those foreign keys are set to NULL.

4) Set Default: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are set to default values.   
*/

USE prajwal_data;
# Drop Table if Exist

drop table if exists riPerson;
drop table if exists riGender;

# Table 1
CREATE TABLE riPerson
(
ID int primary key,
Name varchar(50),
Email varchar(50),
GenderID int
);

# Table 2
CREATE TABLE riGender
(
ID int NOT NULL Primary Key,
Gender varchar(50) NOT NULL
);

# Insert Data ---> insert into table riPerson

insert into riPerson values(1,'Prajwal','p@p.com',1);
insert into riPerson values(2,'Manu','m@m.com',3);
insert into riPerson values(3,'Martin','ma@ma.com',1);
insert into riPerson values(4,'Rob','r@r.com',NULL);
insert into riPerson values(5,'May','may@may.com',2);
insert into riPerson values(6,'Kristy','k@k.com',NULL);
insert into riPerson values(7,'John','j@j.com',2);
insert into riPerson values(8,'Simon','s@s.com',3);
insert into riPerson values(9,'Rich','r@r.com',1);
insert into riPerson values(10,'Sara','s@s.com',NULL);
insert into riPerson values(11,'Johnny','jo@j.com',2);

select * from riPerson;
# Insert Data ---> Insert into table riGender

insert into riGender values(1,'Male');
insert into riGender values(2,'Female');
insert into riGender values(3,'Unknown');
insert into riGender values(4,'NA');
insert into riGender values(5,'Default');
select * from riGender;

# Referential Integrity - No Action

ALTER TABLE riPerson ADD CONSTRAINT riPerson_GenderID_FK FOREIGN KEY(GenderID) REFERENCES riGender(ID);

select * from riGender;

select * from riPerson;

# DELETE  from rigender = Error Foreign key violation

delete from rigender where ID = 2;

# DELETE from rigender - ID=4 --> No Error since not referenced
delete from rigender where ID = 4;
select * from riPerson;
select * from riGender;
----

# Referential Integrity - Set NULL

# Drop Foreign Key constraint
ALTER table riPerson drop CONSTRAINT riPerson_GenderID_FK;

# Alter Foreign Key constraint - to set referential integrity to NULL
ALTER TABLE riPerson ADD CONSTRAINT riPerson_Gender_FK FOREIGN KEY(GenderID) REFERENCES riGender(ID) ON DELETE SET NULL ON UPDATE SET NULL;

# Delete from riGender where ID = 3;
DELETE from riGender where ID = 3;

select * from riGender;
select * from riPerson;
----

# Referential Integrity - Set Cascade

# Drop Foreign Key constraint
ALTER TABLE riPerson drop CONSTRAINT riPerson_Gender_FK;

# Alter Foreign Key constraint - to set referential integrity to NULL

ALTER TABLE riPerson ADD CONSTRAINT riPerson_GenderID_FK FOREIGN KEY(GenderID) REFERENCES riGender(ID) ON DELETE CASCADE ON UPDATE CASCADE;

# Delete from rigender
DELETE FROM riGender where ID = 1; 

select * from riGender;
select * from riPerson;
---
# Referential Integrity - Set Default
# Default Constraint

ALTER TABLE riPerson ALTER COLUMN GenderID SET DEFAULT 5;

# DROP Foreign Key constraint
alter table riperson drop CONSTRAINT riPerson_GenderID_FK;

# Alter Foreign Key constraint - to set referential integrity to default

ALTER TABLE riPerson 
ADD CONSTRAINT riPerson_GenderID_FK 
FOREIGN KEY (GenderID) REFERENCES riGender(ID)
ON DELETE SET DEFAULT 
ON UPDATE SET DEFAULT;








