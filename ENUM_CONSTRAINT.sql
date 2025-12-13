# ENUM
/*
- An Enum is a string object with a value chosen from a list of permitted values that are enumerated explicitly in the column specification at table creation time.
- MySQl allows us to defined the ENUM data type with the following attributes: NOT NULL: By default, the ENUM data type is NULL.
*/

# Benefits of ENUM data type
/*
- Succinct data storage is required to store data in limited-size columns. The strings that you pass to the enum data types implicitly get the numerical numbering.
- It also provides readable queries and output easily because the numbers can be translated back to the result of the corresponding string.
*/

# MySQL allows us to define the ENUM data type with the following three attributes -
/*
- NOT NULL:
If we don't want NULL values, it is required to use the NOT NULL property in the ENUM column.

- NULL:
It is a synonym for DEFAULT NULL, and its index value is alwayes NULL.

- DEFAULT:
By default, the ENUM data type is NULL, if the user doesn't want to pass any value to it.
*/


# ENUM
/*
Suppose, we want to store the student data in the table Student_grade in order to store the grade of students in the corresponding coloumns (High,Medium,Low). We use the priority statement to assign the priority to the Enum column.
*/

Drop Table if exists Student_grade;

CREATE TABLE Student_grade
(
id INT PRIMARY KEY AUTO_INCREMENT,
Grade VARCHAR(250) NOT NULL,
priority ENUM('Low','Medium','High') NOT NULL
);

# The prioritized column will accept only three columns. Here, the order of numbering Low->1,Medium->2,High->3.

# Insert Data

INSERT INTO Student_grade(Grade,priority) VALUES ('Good grades','High');

-- Instead of using the enumeration values, you can also use the numerical indexes too, in order to insert the values into the Enum column of the table.

INSERT INTO Student_grade(Grade,priority) VALUES('Poor grades',1);
INSERT INTO Student_grade(Grade,priority) VALUES('Mediocre garde','Medium');
INSERT INTO Student_grade(Grade,priority) VALUES('Poor grades',1);
INSERT INTO Student_grade(Grade,priority) VALUES('Good grades','High');

select * from Student_grade;

