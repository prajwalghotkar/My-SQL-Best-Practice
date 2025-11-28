/* Syntax to create table and database
Database--> 
- CREATE DATABASE DATABASE_NAME;

Table-->
CREATE TABLE IF NOT EXISTS TABLE_NAME
(
TABLE1 data_type constraints,
TABLE2 data_type constraints,
TABLE3 data_type constraints,
TABLEN data_type constraints..
)
*/

# Create database
CREATE DATABASE IF NOT EXISTS DATABASE_DATA;
use DATABASE_DATA;
# Create table1
create table tutorial_tbl(
tutorial_id INT NOT NULL AUTO_INCREMENT,
tutorial_title VARCHAR(150) NOT NULL,
tutorial_author VARCHAR(50) NOT NULL,
submission_date DATE,
PRIMARY KEY (tutorial_id)
);
select * from tutorial_tbl;

# Create table2,table3 like that....

create table if not exists sales
(
purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
date_of_purchase DATE NOT NULL,
customer_id INT,
item_code VARCHAR(10) NOT NULL
);
select * from sales;

# table3

create table if not exists customer
(
customer_id INT,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int
);
select * from customer;

/*
DROP TABLE
The drop statement used for deleting an 
*/


