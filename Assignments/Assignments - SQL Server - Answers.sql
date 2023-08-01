------------- Assignment -- Query Results ---------------------------------

------------------ Task 1 ---------------------

drop table Trainees

Create database tasks\

---TASK 1

use tasks
CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--INSERT 20 RECORDS 

INSERT INTO Trainees (Trainee_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
  (1, 'John', 'Doe', 30000, '2022-01-01', 'Developer'),
  (2, 'Jane', 'Doe', 40000, '2022-01-02', 'Designer'),
  (3, 'Jenny', 'Smith', 25000, '2022-01-03', 'Developer'),
  (4, 'Jacob', 'Johnson', 35000, '2022-01-04', 'Designer'),
  (5, 'Jason', 'Lee', 45000, '2022-01-05', 'Developer'),
  (6, 'Julia', 'Taylor', 50000, '2022-01-06', 'Designer'),
  (7, 'Joshua', 'Brown', 22000, '2022-01-07', 'Developer'),
  (8, 'Jeremy', 'Jones', 42000, '2022-01-08', 'Designer'),
  (9, 'Jasmine', 'Chang', 32000, '2022-01-09', 'Developer'),
  (10, 'Jack', 'Nguyen', 28000, '2022-01-10', 'Designer'),
  (11, 'Mary', 'Kim', 45000, '2022-01-11', 'Developer'),
  (12, 'Mark', 'Lee', 35000, '2022-01-12', 'Designer'),
  (13, 'Luke', 'Park', 40000, '2022-01-13', 'Developer'),
  (14, 'Leah', 'Choi', 30000, '2022-01-14', 'Designer'),
  (15, 'Logan', 'Yoo', 42000, '2022-01-15', 'Developer'),
  (16, 'Taylor', 'Johnson', 28000, '2022-01-16', 'Designer'),
  (17, 'Tyler', 'Davis', 37000, '2022-01-17', 'Developer'),
  (18, 'Tara', 'Patel', 33000, '2022-01-18', 'Designer'),
  (19, 'Thomas', 'Brown', 45000, '2022-01-19', 'Developer'),
  (20, 'Tiffany', 'Wang', 40000, '2022-01-20', 'Designer');

  Select * from Trainees

  --first name starting with J-T

  SELECT * FROM Trainees WHERE FIRST_NAME LIKE '[J-T]%'

  --SALARY between 20000 and 50000

  SELECT * FROM Trainees WHERE SALARY BETWEEN 20000 AND 50000

  --first name ending with I

  SELECT * FROM Trainees WHERE FIRST_NAME LIKE '%i'

  --salary without duplicants 

  SELECT DISTINCT SALARY FROM Trainees

  --records where dept is developer or designer

  SELECT * FROM Trainees WHERE DEPARTMENT IN ('Developer', 'Designer')

  --trainees ID less than 5

  SELECT * FROM Trainees WHERE Trainee_ID < 5

  --6 to 15 records

 SELECT * FROM Trainees ORDER BY Trainee_ID 
		OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY

--top5 with ties
SELECT TOP 5 WITH TIES * FROM Trainees
	ORDER BY SALARY DESC;

-- desc order based on dept column

SELECT * FROM Trainees ORDER BY DEPARTMENT DESC

-- last name with third character as a

SELECT * FROM Trainees WHERE LAST_NAME LIKE '__a%'


-------------------------------------------------------

-------------------------  TASK - 2 ------------------
use tasks
create table Employees
(EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(50) UNIQUE,
  Salary INT CHECK (Salary >= 0),
  HireDate DATE DEFAULT GETDATE()
);

-- rename  table
EXEC sp_rename 'Employees', 'EMPLOYEE';

SELECT * FROM	EMPLOYEE

---alter db name
ALTER DATABASE tasks MODIFY NAME = task;

--rename schema
create schema sales

SELECT name as schema_name FROM sys.schemas;   -- Select all the schema names

create schema market

create table market.marketTable
(
id int
)

insert into market.marketTable values(1)

create schema finance

alter schema finance transfer market.marketTable   -- Transfers the table from one schema to anither schema

--

CREATE TABLE WORKER(
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(50),
  Salary INT,
  Increment INT,
  RevisedSalary AS (Salary + Increment)
);

INSERT INTO WORKER (Name, Salary, Increment)
VALUES 
    ('John Doe', 50000, 5000),
    ('Jane Smith', 60000, 6000),
    ('Bob Johnson', 70000, 7000),
    ('Alice Lee', 80000, 8000),
    ('Mike Brown', 90000, 9000);

	SELECT * FROM WORKER

SELECT *
INTO HighPaidEmployees
FROM WORKER
WHERE Salary > 50000;

-------------------------------------------------------------------------

-----------------------  TASK - 3   ---------------------------------

use task
CREATE TABLE Student (
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Designation VARCHAR(50),
  DeptID INT,
  Mobile1 VARCHAR(10),
  Mobile2 VARCHAR(10),
  StreetAddress VARCHAR(100),
  AddressID INT,
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE Department (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50)
);


CREATE TABLE Address (
  AddressID INT PRIMARY KEY,
  City VARCHAR(50),
  State VARCHAR(50),
  Pincode VARCHAR(10)
);


--inserting records

-- Insert data into Department table
INSERT INTO Department (DeptID, DeptName)
VALUES (1, 'IT'), (2, 'Finance'), (3, 'HR');

-- Insert data into Address table
INSERT INTO Address (AddressID, City, State, Pincode)
VALUES (1, 'New York', 'NY', '10001'), (2, 'San Francisco', 'CA', '94105'), (3, 'Chicago', 'IL', '60601');

-- Insert data into Student table
INSERT INTO Student (ID, Name, Designation, DeptID, Mobile1, Mobile2, StreetAddress, AddressID)
VALUES (1, 'John Doe', 'Software Engineer', 1, '1234567890', '0987654321', '123 Main St', 1),
       (2, 'Jane Smith', 'Financial Analyst', 2, '9876543210', '0123456789', '456 Market St', 2),
       (3, 'Bob Johnson', 'HR Manager', 3, '5555555555', NULL, '789 Elm St', 3),
       (4, 'Alice Lee', 'Software Engineer', 1, '1111111111', NULL, '321 Oak St', 1),
       (5, 'Mark Chen', 'Financial Analyst', 2, '2222222222', NULL, '654 Pine St', 2);

select * from Student
select * from Department
select * from Address

--working of foreign and primary key

INSERT INTO department (deptid, deptname) VALUES (4, 'Marketing');

--fails
INSERT INTO student (id, name, designation, deptid, mobile1, mobile2, streetaddress, addressid) 
VALUES (7, 'Rose Mary', 'HR Manager', 1, '3333333333', '1234555555', '123 Main St', 3);

--works
INSERT INTO student (id, name, designation, deptid, mobile1, mobile2, streetaddress, addressid) 
VALUES (8, 'Rose Mary', 'HR Manager', 1, '3333333333', '1234555555', '123 Main St', 3);

-----------------------------------------------------------------------

-----------------------------------  TASK - 4  ---------------------- 

use task


drop table Bonus
drop table Worker

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2000-02-02', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2000-02-02', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2000-02-02', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2000-02-02', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin');

--BONUS

CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID)
ON UPDATE CASCADE
ON DELETE CASCADE);


ALTER TABLE Bonus NOCHECK CONSTRAINT FK__Bonus__WORKER_RE__17036CC0;

ALTER TABLE Bonus CHECK CONSTRAINT FK__Bonus__WORKER_RE__17036CC0;

SELECT * FROM Bonus

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(010,	5000,	'2016-02-02'),
(012,	3000,	'2016-06-01'),
(013,	4000,	'2016-02-02'),
(014,	4500,	'2016-02-02'),
(015,	3500,	'2016-06-01');


--TITLE

--TITLE

ALTER TABLE Title NOCHECK CONSTRAINT FK__Title__WORKER_RE__18EBB532;

ALTER TABLE Title CHECK CONSTRAINT FK__Title__WORKER_RE__18EBB532;

CREATE TABLE Title (
WORKER_REF_ID INT, WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME, 
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

--Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

--Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM Worker;

--Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;

--Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME, 1, 3) AS FIRST_THREE_CHAR FROM Worker;

--Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LEN(DEPARTMENT) AS DEPT_LENGTH FROM Worker;

-- Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Worker;

-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');

-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM Worker WHERE DEPARTMENT = 'Admin';

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

--Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

-----------------------------------------------------------------------------------

--------------------------------  TASK - 5 -----------------------------------------

SELECT * FROM TRAINEES
--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
ALTER TABLE trainees
ADD ESTIMATED_INDUCTION_DAY DATE;

UPDATE TRAINEES
SET ESTIMATED_INDUCTION_DAY = DATEADD(day, 5, JOINING_DATE)

select * from Student
select * from Department

--1. Write an SQL query to get the count of employees in each department.

SELECT Department.DeptName, COUNT(Student.ID) as emp_count
FROM Student
INNER JOIN Department
ON Department.DeptId = Student.DeptId
GROUP BY Department.DeptName;

--3. Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.

SELECT DATENAME(month, JOINING_DATE) AS MONTH_IN_WORDS
FROM Trainees;



-- 4. Write an SQL query to perform the total and subtotal of salary in each department.

SELECT DEPARTMENT, SUM(SALARY) AS department_total_salary, 
       COUNT(Trainee_ID) AS department_employee_count
			FROM Trainees
				GROUP BY DEPARTMENT WITH ROLLUP;


--5. Write an SQL query to retrieve first 3 records randomly.

SELECT TOP 3 * 
FROM Trainees
ORDER BY NEWID();

--6. Show the working of composite key with any example.

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  product_id INT,
  order_date DATE,
  PRIMARY KEY (order_id, customer_id, product_id)
);

-- insert 
INSERT INTO orders (order_id, customer_id, product_id, order_date) VALUES
(1, 1001, 2001, '2022-01-01'),
(2, 1001, 2001, '2022-01-02');


-- iif
SELECT order_id, customer_id, product_id, order_date,
       IIF((SELECT COUNT(*) FROM orders o2 WHERE o2.customer_id = o.customer_id) = 1,
           'new', 'returning') AS customer_type
FROM orders o;

-- case
SELECT order_id, customer_id, product_id, order_date,
       CASE WHEN (SELECT COUNT(*) FROM orders o2 WHERE o2.customer_id = o.customer_id) = 1
            THEN 'new'
            ELSE 'returning'
       END AS customer_type
FROM orders o;

--8. Show the working of Sequence.


CREATE SEQUENCE my_sequence
    START WITH 1
    INCREMENT BY 1;

create table my_table (id int , name varchar(20))

INSERT INTO my_table (id, name)
VALUES (NEXT VALUE FOR my_sequence, 'John');

select * from my_table

-- 9. Show the working of creation of Synonym for a table in DB1 from DB2.
USE Test;
GO

CREATE SYNONYM my_table FOR task.dbo.my_table;
GO

select * from my_table

--identity insert

CREATE TABLE identitytable (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  email VARCHAR(100)
);

select * from identitytable

INSERT INTO identitytable (name, age, email)
VALUES ('John', 25, 'john@example.com'),
       ('Jane', 30, 'jane@example.com'),
       ('Bob', 40, 'bob@example.com');

--------------------------------------------------------------------------------

---------------------------  TASK - 6 ----------------------------

use task

-- salesman 

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'John Smith', 'New York', 0.10),
(5002, 'Jane Doe', 'Los Angeles', 0.12),
(5005, 'Bob Johnson', 'Chicago', 0.08),
(5006, 'Alice Lee', 'San Francisco', 0.15),
(5007, 'Mike Brown', 'Dallas', 0.07),
(5003, 'Lauson Hen', 'San Jose', 0.14);

select * from salesman
select * from customer

-- customer

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3001, 'Acme Corp', 'New York', 100, 5001),
(3002, 'Widgets Inc', 'Los Angeles', 200, 5001),
(3003, 'Gizmos Ltd', 'Chicago', 300, 5002),
(3004, 'ABC Co', 'San Francisco', 200, 5002  ),
(3005, 'XYZ Corp', 'Dallas', 300, 5006),
(3006, 'Geoff Cameron', 'Berlin', 100, 5003),
(3007, 'Jozy Altidor', 'Moscow', 200, 5007),
(3008, 'Brad Guzan ', 'London', 300, 5005);

-- orders
select * from orders
DROP TABLE orders
CREATE TABLE orders (
  ord_no INT PRIMARY KEY,
  purch_amt DECIMAL(8,2),
  ord_date DATE,
  customer_id INT,
  salesman_id INT
);


INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES 
  (70001, 150.5, '2012-10-05', 3005, 5002),
  (70009, 270.65, '2012-09-10', 3001, 5005),
  (70002, 65.26, '2012-10-05', 3002, 5001),
  (70004, 110.5, '2012-08-17', 3009, 5003),
  (70007, 948.5, '2012-09-10', 3005, 5002),
  (70005, 2400.6, '2012-07-27', 3007, 5001),
  (70008, 5760, '2012-09-10', 3002, 5001),
  (70010, 1983.43, '2012-10-10', 3004, 5006),
  (70003, 2480.4, '2012-10-10', 3009, 5003),
  (70012, 250.45, '2012-06-27', 3008, 5002),
  (70011, 75.29, '2012-08-17', 3003, 5007),
  (70013, 3045.6, '2012-04-25', 3002, 5001);

--1. From the above tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT s.name AS Salesman, c.cust_name AS cust_name, s.city AS city
FROM salesman s
JOIN customer c ON s.city = c.city
ORDER BY s.name;

--2. From the above tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

SELECT c.cust_name AS "Customer Name", c.city AS "Customer City", s.name AS "Salesman", s.commission AS "Commission"
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id
WHERE s.commission > 0.12
ORDER BY s.name;

--3. From the above tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.

SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name AS customer_name, c.grade, s.name AS salesman_name, s.commission
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id

--4. From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT ord_no, purch_amt, cust_name, city
FROM orders 
JOIN customer ON orders.customer_id = customer.customer_id
WHERE purch_amt BETWEEN 500 AND 2000;

-- 5. From the above tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

SELECT c.cust_name, c.city AS customer_city, c.grade, s.name AS salesman, s.city AS salesman_city
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY c.customer_id ;

---------------------------------------------------------

---------------------   TASK - 7 -------------------
CREATE TABLE students (
  studentid INT PRIMARY KEY,
  studentname VARCHAR(50),
  department VARCHAR(50),
  score INT
);

--INSERT

INSERT INTO students(studentid, studentname, department, score)
VALUES 
    (1, 'John Doe', 'BCA', 85),
    (2, 'Jane Smith', 'BBA', 75),
    (3, 'Peter Parker', 'BCA', 90),
    (4, 'Mary Jane', 'BBA', 80),
    (5, 'Tony Stark', 'MBA', 95),
    (6, 'Clark Kent', 'BCA', 80),
    (7, 'Bruce Wayne', 'MBA', 88),
    (8, 'Diana Prince', 'BBA', 87),
    (9, 'Barry Allen', 'BCA', 92),
    (10, 'Hal Jordan', 'MBA', 78),
    (11, 'Oliver Queen', 'BBA', 81),
    (12, 'Carol Danvers', 'BCA', 89),
    (13, 'Stephen Strange', 'MBA', 93),
    (14, 'Natasha Romanoff', 'BBA', 85),
    (15, 'Scott Lang', 'BCA', 82);

--Create a non-clustered index for department.

CREATE NONCLUSTERED INDEX index_department
ON students(department);

--To create a filtered index for department='BCA':

CREATE NONCLUSTERED INDEX index_bca_students
ON students(studentid, studentname, score)
WHERE department = 'BCA';

-- create a view for students in BCA department:

CREATE VIEW BCA_Students
AS SELECT studentid, studentname, score
FROM students
WHERE department = 'BCA';

--Apply Rank() for all the students based on score.
SELECT studentid, studentname, department, score,
RANK() OVER (ORDER BY score DESC) as student_rank
FROM students;

--To apply DENSE_RANK() for students in each department based on score:

SELECT studentid, studentname, department, score,
DENSE_RANK() OVER (PARTITION BY department ORDER BY score DESC) as department_rank
FROM students;


---------------------- Task 7 (b) ----------------------------------------
CREATE TABLE Manager (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE EmployeeList (
  eid INT PRIMARY KEY,
  ename VARCHAR(50),
  mid INT,
  department VARCHAR(50),
  FOREIGN KEY (mid) REFERENCES Manager(id) ON DELETE CASCADE ON UPDATE SET DEFAULT
);

-- Insert 5 records into the Manager table
INSERT INTO Manager (id, name)
VALUES (1, 'John Doe'),
       (2, 'Mary Johnson'),
       (3, 'David Lee'),
       (4, 'Samantha Smith'),
       (5, 'Michael Chen');

-- Insert 5 records into the Employee table
INSERT INTO EmployeeList (eid, ename, mid, department)
VALUES (1, 'Jane Smith', 1, 'Sales'),
       (2, 'Bob Johnson', 1, 'Marketing'),
       (3, 'Emily Davis', 2, 'Sales'),
       (4, 'Kevin Brown', 2, 'Marketing'),
       (5, 'Lisa Lee', 3, 'Sales');

---complex view

CREATE VIEW ManagerEmployeeView AS
SELECT m.id, m.name AS manager_name, e.eid, e.ename AS employee_name, e.department
FROM Manager m
INNER JOIN EmployeeList e ON m.id = e.mid;

--on delete cascade
drop table Manager
drop table EmployeeList

select* from Manager
select * from EmployeeList

DELETE FROM Manager WHERE id = 1;

------------------------------------------------------------------------------

--------------------------  TASK - 8 ----------------------------------
-- Create a table with studentid, studentname, semester, securedmarks, totalmarks

CREATE TABLE student_records (
  student_id INT,
  student_name VARCHAR(50),
  semester INT,
  secured_marks INT,
  total_marks INT
);

INSERT INTO student_records (student_id, student_name, semester, secured_marks, total_marks)
VALUES
  (1, 'Alice', 1, 80, 100),
  (2, 'Bob', 1, 70, 100),
  (3, 'Charlie', 1, 85, 100),
  (4, 'David', 1, 90, 100),
  (5, 'Eve', 1, 75, 100);

  --- scalar function for percentage
  CREATE FUNCTION calculate_percentage (@secured_marks INT, @total_marks INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
  DECLARE @percentage DECIMAL(5,2)
  SET @percentage = (@secured_marks * 100.0) / @total_marks
  RETURN @percentage
END

SELECT student_id, student_name, semester, secured_marks, total_marks, dbo.calculate_percentage(secured_marks, total_marks) AS percentage
FROM student_records;

--  Create user-defined function to generate a table that contains result of Sem 3 students.

CREATE FUNCTION get_semester_3_results ()
RETURNS @result_table TABLE (
  student_id INT,
  student_name VARCHAR(50),
  secured_marks INT,
  total_marks INT,
  percentage DECIMAL(5,2)
)
AS
BEGIN
  INSERT INTO @result_table (student_id, student_name, secured_marks, total_marks, percentage)
  SELECT student_id, student_name, secured_marks, total_marks, dbo.calculate_percentage(secured_marks, total_marks)
  FROM student_records
  WHERE semester = 3

  RETURN;
END

SELECT * FROM dbo.get_semester_3_results();

--procedure to get all student records
DROP PROCEDURE get_all_student_details;

CREATE PROCEDURE get_all_student_details
AS
BEGIN
  SELECT *
  FROM student_records;
END

exec get_all_student_details

--procedure for semester 1

CREATE PROCEDURE get_semester_1_details
  @semester INT
AS
BEGIN
  SELECT *
  FROM student_records
  WHERE semester = @semester;
END

EXEC get_semester_1_details @semester = 1;

--total students using output

CREATE PROCEDURE get_total_student_details
  @total_students INT OUTPUT
AS
BEGIN
  SELECT @total_students = COUNT(*)
  FROM student_records;
END

DECLARE @total_students INT;
EXEC get_total_student_details @total_students OUTPUT;
SELECT @total_students AS 'Total Students';

-- Create a backup table for Semester 1 student details
CREATE TABLE student_records_backup
(
  studentid INT PRIMARY KEY,
  studentname VARCHAR(50),
  semester INT,
  securedmarks FLOAT,
  totalmarks FLOAT
);

-- Merge Semester 1 student details into the backup table
MERGE INTO student_records_backup AS target
USING (
  SELECT student_id, student_name, semester, secured_marks, total_marks
  FROM student_records
  WHERE semester = 1
) AS source
ON target.studentid = source.student_id
WHEN MATCHED THEN
  UPDATE SET
    target.studentname = source.student_name,
    target.securedmarks = source.secured_marks + 10 -- increase secured marks by 10
WHEN NOT MATCHED THEN
  INSERT (studentid, studentname, semester, securedmarks, totalmarks)
  VALUES (source.student_id, source.student_name, source.semester, source.secured_marks, source.total_marks);

-- View the contents of the backup table
SELECT *
FROM student_records_backup;

select * from student_records

----------------------------------------------------------------------------------------
--------------------  TASK - 9  ----------------------------------- 
--Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.

CREATE PROCEDURE search_student_by_name
  @name VARCHAR(50)
AS
BEGIN
  IF EXISTS(SELECT * FROM student_records WHERE student_name = @name)
  BEGIN
    SELECT * FROM student_records WHERE student_name = @name;
  END
  ELSE
  BEGIN
    PRINT 'Student not found.';
  END
END

EXEC search_student_by_name 'John Doe';

--Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.

CREATE PROCEDURE add_remarks_to_students
AS
BEGIN
  UPDATE student_records
  SET remarks = 
    CASE 
      WHEN secured_marks >= 80 THEN 'Excellent'
      WHEN secured_marks >= 60 AND secured_marks < 80 THEN 'Good'
      WHEN secured_marks >= 40 AND secured_marks < 60 THEN 'Average'
      ELSE 'Poor'
    END;
END

EXEC add_remarks_to_students;
select * from student_records
alter table student_records add remarks varchar(50)

--Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

-- table variable 
DECLARE @myTableVariable TABLE (
  Id INT,
  Name VARCHAR(50)
);

INSERT INTO @myTableVariable (Id, Name)
VALUES (1, 'John'),
       (2, 'Jane'),
       (3, 'Joe');

SELECT * FROM @myTableVariable;



-- temp table

CREATE TABLE #myTempTable (
  Id INT,
  Name VARCHAR(50)
);

INSERT INTO #myTempTable (Id, Name)
VALUES (1, 'John'),
       (2, 'Jane'),
       (3, 'Joe');

SELECT * FROM #myTempTable;

--temp procedure

DROP PROCEDURE #myTempStoredProcedure

CREATE PROCEDURE #myTempStoredProcedure
AS
BEGIN
  SELECT * from student_records;
END;

EXEC #myTempStoredProcedure;

-----------------------------------------------------------------------------

--------------------------  TASK - 10 ---------------------------------
CREATE DATABASE EMPLOYEE
use EMPLOYEE
create table employees(
  EMPLOYEE_ID INT PRIMARY KEY,
  FIRST_NAME VARCHAR(50) NOT NULL,
  LAST_NAME VARCHAR(50) NOT NULL,
  EMAIL VARCHAR(100) NOT NULL,
  PHONE_NUMBER VARCHAR(20),
  HIRE_DATE DATE NOT NULL,
  JOB_ID VARCHAR(10) NOT NULL,
  SALARY NUMERIC(10,2) NOT NULL
);

INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY)
VALUES (1001, 'John', 'Doe', 'john.doe@company.com', '555-1234', '2022-01-01', 'IT_PROG', 60000.00),
       (1002, 'Jane', 'Doe', 'jane.doe@company.com', '555-2345', '2022-01-02', 'ACCT_CLERK', 40000.00),
       (1003, 'Bob', 'Smith', 'bob.smith@company.com', '555-3456', '2022-01-03', 'SA_MAN', 80000.00),
       (1004, 'Alice', 'Jones', 'alice.jones@company.com', '555-4567', '2022-01-04', 'SA_REP', 70000.00),
       (1005, 'Tom', 'Lee', 'tom.lee@company.com', '555-5678', '2022-01-05', 'IT_PROG', 65000.00),
       (1006, 'Sara', 'Brown', 'sara.brown@company.com', '555-6789', '2022-01-06', 'ACCT_CLERK', 42000.00),
       (1007, 'David', 'Garcia', 'david.garcia@company.com', '555-7890', '2022-01-07', 'SA_MAN', 82000.00),
       (1008, 'Emily', 'Taylor', 'emily.taylor@company.com', '555-8901', '2022-01-08', 'SA_REP', 73000.00),
       (1009, 'Kevin', 'Brown', 'kevin.brown@company.com', '555-9012', '2022-01-09', 'IT_PROG', 61000.00),
       (1010, 'Lisa', 'Williams', 'lisa.williams@company.com', '555-0123', '2022-01-10', 'ACCT_CLERK', 41000.00),
       (1011, 'Mark', 'Davis', 'mark.davis@company.com', '555-1234', '2022-01-11', 'SA_MAN', 79000.00),
       (1012, 'Julia', 'Johnson', 'julia.johnson@company.com', '555-2345', '2022-01-12', 'SA_REP', 72000.00),
       (1013, 'Michael', 'Gonzalez', 'michael.gonzalez@company.com', '555-3456', '2022-01-13', 'IT_PROG', 64000.00),
       (1014, 'Olivia', 'Miller', 'olivia.miller@company.com', '555-4567', '2022-01-14', 'ACCT_CLERK', 43000.00);


--Write a SQL query to find those employees who receive a higher salary than the employee with ID 1014. Return first name, last name.

SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE SALARY > (SELECT SALARY FROM employees WHERE EMPLOYEE_ID = 1014)

--Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 1010. Return first name, last name, job ID
SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM employees
WHERE HIRE_DATE = (SELECT HIRE_DATE FROM employees WHERE EMPLOYEE_ID = 1010)
AND EMPLOYEE_ID != 1010;

--Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

--Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
use EMPLOYEE
ALTER TABLE employees add manager_id int 

ALTER TABLE employees add manager_first_name varchar(50) 


update employees set manager_id = 4 where Employee_ID = 1005
update employees set manager_first_name = 'yaamini' where manager_id = 1 

select * from employees

SELECT e1.FIRST_NAME, e1.LAST_NAME, e1.EMPLOYEE_ID, e1.SALARY
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.EMPLOYEE_ID
WHERE e2.manager_first_name = 'yaamini';


--Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.


SELECT *
FROM employees
WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 25000;


--------------------------------------------------------------------------

-------------------  TASK - 11 ------------------------------------
CREATE DATABASE EMPLOYEE
use EMPLOYEE
create table employees(
  EMPLOYEE_ID INT PRIMARY KEY,
  FIRST_NAME VARCHAR(50) NOT NULL,
  LAST_NAME VARCHAR(50) NOT NULL,
  EMAIL VARCHAR(100) NOT NULL,
  PHONE_NUMBER VARCHAR(20),
  HIRE_DATE DATE NOT NULL,
  JOB_ID VARCHAR(10) NOT NULL,
  SALARY NUMERIC(10,2) NOT NULL
);

INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY)
VALUES (1001, 'John', 'Doe', 'john.doe@company.com', '555-1234', '2022-01-01', 'IT_PROG', 60000.00),
       (1002, 'Jane', 'Doe', 'jane.doe@company.com', '555-2345', '2022-01-02', 'ACCT_CLERK', 40000.00),
       (1003, 'Bob', 'Smith', 'bob.smith@company.com', '555-3456', '2022-01-03', 'SA_MAN', 80000.00),
       (1004, 'Alice', 'Jones', 'alice.jones@company.com', '555-4567', '2022-01-04', 'SA_REP', 70000.00),
       (1005, 'Tom', 'Lee', 'tom.lee@company.com', '555-5678', '2022-01-05', 'IT_PROG', 65000.00),
       (1006, 'Sara', 'Brown', 'sara.brown@company.com', '555-6789', '2022-01-06', 'ACCT_CLERK', 42000.00),
       (1007, 'David', 'Garcia', 'david.garcia@company.com', '555-7890', '2022-01-07', 'SA_MAN', 82000.00),
       (1008, 'Emily', 'Taylor', 'emily.taylor@company.com', '555-8901', '2022-01-08', 'SA_REP', 73000.00),
       (1009, 'Kevin', 'Brown', 'kevin.brown@company.com', '555-9012', '2022-01-09', 'IT_PROG', 61000.00),
       (1010, 'Lisa', 'Williams', 'lisa.williams@company.com', '555-0123', '2022-01-10', 'ACCT_CLERK', 41000.00),
       (1011, 'Mark', 'Davis', 'mark.davis@company.com', '555-1234', '2022-01-11', 'SA_MAN', 79000.00),
       (1012, 'Julia', 'Johnson', 'julia.johnson@company.com', '555-2345', '2022-01-12', 'SA_REP', 72000.00),
       (1013, 'Michael', 'Gonzalez', 'michael.gonzalez@company.com', '555-3456', '2022-01-13', 'IT_PROG', 64000.00),
       (1014, 'Olivia', 'Miller', 'olivia.miller@company.com', '555-4567', '2022-01-14', 'ACCT_CLERK', 43000.00);


--Write a SQL query to find those employees who receive a higher salary than the employee with ID 1014. Return first name, last name.

SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE SALARY > (SELECT SALARY FROM employees WHERE EMPLOYEE_ID = 1014)

--Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 1010. Return first name, last name, job ID
SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM employees
WHERE HIRE_DATE = (SELECT HIRE_DATE FROM employees WHERE EMPLOYEE_ID = 1010)
AND EMPLOYEE_ID != 1010;

--Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

--Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
use EMPLOYEE
ALTER TABLE employees add manager_id int 

ALTER TABLE employees add manager_first_name varchar(50) 


update employees set manager_id = 4 where Employee_ID = 1005
update employees set manager_first_name = 'yaamini' where manager_id = 1 

select * from employees

SELECT e1.FIRST_NAME, e1.LAST_NAME, e1.EMPLOYEE_ID, e1.SALARY
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.EMPLOYEE_ID
WHERE e2.manager_first_name = 'yaamini';


--Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.


SELECT *
FROM employees
WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 25000;

-----------------------------------------------------------------------

-------------------------  TASK - 12 ---------------------------
CREATE DATABASE MyDatabase;
GO

USE MyDatabase;
GO

CREATE TABLE EMPLOYEE (
    id INT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);
select * from EMPLOYEE
CREATE TABLE CALL_OUTCOME (
    id INT PRIMARY KEY,
    outcometext VARCHAR(50) NOT NULL
);
SELECT * FROM CALL_OUTCOME
CREATE TABLE CUSTOMER (
    id INT PRIMARY KEY,
    customername VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    nextcalldate DATE NOT NULL,
    ts_inserted DATETIME NOT NULL,
    countryid INT,
    FOREIGN KEY (countryid) REFERENCES COUNTRY(id)
);
SELECT * FROM CUSTOMER
CREATE TABLE CITY (
    id INT PRIMARY KEY,
    cityname VARCHAR(50) NOT NULL,
    lat DECIMAL(9,6) NOT NULL,
    long DECIMAL(9,6) NOT NULL,
    countryid INT,
    FOREIGN KEY (countryid) REFERENCES COUNTRY(id)
);
SELECT * FROM CITY
CREATE TABLE COUNTRY (
    id INT PRIMARY KEY,
    countryname VARCHAR(50) NOT NULL,
    countrynameeng VARCHAR(50) NOT NULL,
    countrycode VARCHAR(10) NOT NULL
);
SELECT * FROM COUNTRY
CREATE TABLE CALL (
    id INT PRIMARY KEY,
    employeeid INT,
    customerid INT,
    starttime DATETIME NOT NULL,
    endtime DATETIME NOT NULL,
    calloutcomeid INT,
    FOREIGN KEY (employeeid) REFERENCES EMPLOYEE(id),
    FOREIGN KEY (customerid) REFERENCES CUSTOMER(id),
    FOREIGN KEY (calloutcomeid) REFERENCES CALL_OUTCOME(id)
);
SELECT * FROM CALL

INSERT INTO EMPLOYEE (id, firstname, lastname)
VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Doe'),
(3, 'Bob', 'Smith'),
(4, 'Alice', 'Johnson'),
(5, 'Mike', 'Brown');

INSERT INTO CALL_OUTCOME (id, outcometext)
VALUES
(1, 'Successful'),
(2, 'No answer'),
(3, 'Busy'),
(4, 'Wrong number');

INSERT INTO CUSTOMER (id, customername, address, nextcalldate, ts_inserted)
VALUES
(1, 'ABC Corp', '123 Main St, Anytown, USA', '2023-05-01', GETDATE()),
(2, 'XYZ Inc', '456 Elm St, Anytown, USA', '2023-04-15', GETDATE()),
(3, '123 LLC', '789 Oak St, Anytown, USA', '2023-04-20', GETDATE());

INSERT INTO CITY (id, cityname, lat, long, countryid)
VALUES
(1, 'Anytown', 37.7749, -122.4194, 1),
(2, 'Othertown', 34.0522, -118.2437, 1),
(3, 'Smallville', 39.0062, -94.6719, 2);

INSERT INTO COUNTRY (id, countryname, countrynameeng, countrycode)
VALUES
(1, 'United States', 'United States', 'US'),
(2, 'Canada', 'Canada', 'CA');

INSERT INTO CALL (id, employeeid, customerid, starttime, endtime, calloutcomeid)
VALUES
(1, 1, 1, '2023-04-01 09:00:00', '2023-04-01 09:15:00', 1),
(2, 2, 1, '2023-04-01 09:30:00', '2023-04-01 09:45:00', 2),
(3, 3, 2, '2023-04-01 10:00:00', '2023-04-01 10:15:00', 3),
(4, 4, 3, '2023-04-01 10:30:00', '2023-04-01 10:45:00', 4),
(5, 5, 1, '2023-04-01 11:00:00', '2023-04-01 11:15:00', 1);

-----------------------------------------------------------------------------

----------------------   TASK - 13 ---------------------------------
--TASK 13
-- creating db for university
create database university
use university

-- TABLE COURSE

CREATE TABLE course (
    classid VARCHAR(7) PRIMARY KEY,
    name VARCHAR(250),
    deptname VARCHAR(25) REFERENCES department(dept_name),
    credits NUMERIC(5),
    description VARCHAR(8000)
);
drop table course
INSERT INTO course (classid, name, deptname, credits, description)
VALUES 
    ('CS101', 'Introduction to Computer Science', 'Computer Science', 3, 'This course introduces the basic concepts and techniques of computer programming and software development.'),
    ('MATH201', 'Calculus I', 'Mathematics', 4, 'This course covers the fundamentals of calculus, including limits, derivatives, and integrals.'),
    ('ENG102', 'Composition II', 'English', 3, 'This course is a continuation of ENG101 and focuses on advanced writing techniques and research skills.'),
    ('HIST201', 'US History I', 'History', 3, 'This course covers US history from colonial times to the Civil War.'),
    ('PHIL101', 'Introduction to Philosophy', 'Philosophy', 3, 'This course introduces students to the basic concepts and methods of philosophical inquiry.'),
    ('SPAN101', 'Beginning Spanish I', 'Modern Languages', 4, 'This course introduces the basic grammar and vocabulary of the Spanish language.');

--TABLE DEPARTMENT

CREATE TABLE department (
    dept_name VARCHAR(25) PRIMARY KEY,
    building VARCHAR(30),
    budget NUMERIC(18,2)
);

INSERT INTO department (dept_name, building, budget)
VALUES 
    ('Computer Science', 'Science Building', 1000000.00),
    ('Mathematics', 'Science Building', 750000.00),
    ('English', 'Arts Building', 500000.00),
    ('History', 'Humanities Building', 600000.00),
    ('Philosophy', 'Humanities Building', 400000.00),
    ('Modern Languages', 'Arts Building', 800000.00);


--requisite table 

CREATE TABLE requisite (
    class_id VARCHAR(7) REFERENCES course(classid) ,
    req_id VARCHAR(7) REFERENCES course(classid) ,
    type VARCHAR(40),
    PRIMARY KEY (class_id, req_id)
);

INSERT INTO requisite (class_id, req_id, type)
VALUES 
    ('CS101', 'CS101', 'Prerequisite'),
    ('MATH201', 'MATH201', 'Prerequisite'),
    ('ENG102', 'ENG102', 'Prerequisite'),
    ('HIST201', 'HIST201', 'Prerequisite'),
    ('PHIL101', 'PHIL101', 'Prerequisite'),
    ('SPAN101', 'SPAN101', 'Prerequisite');


-- Create USER table
CREATE TABLE [USER] (
    userid INT PRIMARY KEY,
    username VARCHAR(25) UNIQUE,
    password VARCHAR(30)
);

-- Create USER_SALARY table with foreign key constraint
CREATE TABLE USER_SALARY (
    user_id INT REFERENCES [USER] (userid),
    salary NUMERIC(18,2),
    PRIMARY KEY (user_id)
);

-- Insert 6 records into USER table
INSERT INTO [USER] (userid, username, password)
VALUES (1, 'john', 'password1'),
       (2, 'jane', 'password2'),
       (3, 'bob', 'password3'),
       (4, 'alice', 'password4'),
       (5, 'dave', 'password5'),
       (6, 'sara', 'password6');

-- Insert 6 records into USER_SALARY table
INSERT INTO USER_SALARY (user_id, salary)
VALUES (1, 50000.00),
       (2, 60000.00),
       (3, 55000.00),
       (4, 75000.00),
       (5, 65000.00),
       (6, 70000.00);


---- Create "time_slot" table
CREATE TABLE time_slot (
    timeslotID INT PRIMARY KEY,
    days VARCHAR(10),
    starttime TIME,
    endtime TIME
);
select * from time_slot
drop table time_slot
INSERT INTO time_slot (timeslotID, days, starttime, endtime)
VALUES 
    (1, 'Monday', '09:00:00', '10:30:00'),
    (2, 'Monday', '10:45:00', '12:15:00'),
    (3, 'Tuesday', '09:00:00', '10:30:00'),
    (4, 'Tuesday', '10:45:00', '12:15:00'),
    (5, 'Wednesday', '09:00:00', '10:30:00'),
    (6, 'Wednesday', '10:45:00', '12:15:00');


-- CREATES SECTION TABLE

CREATE TABLE section (
    class_id VARCHAR(7) REFERENCES course (classid),
    class_num INT PRIMARY KEY,
    semester VARCHAR(7),
    year INT,
    room_no VARCHAR(10),
    timeslotID INT REFERENCES time_slot (timeslotID),
    capacity INT
);

INSERT INTO section (class_id, class_num, semester, year, room_no, timeslotID, capacity)
VALUES 
    ('CS101', 1, 'Spring', 2022, 'Room A', 1, 30),
    ('MATH201', 2, 'Spring', 2022, 'Room B', 2, 25),
    ('ENG102', 3, 'Fall', 2022, 'Room C', 3, 40),
    ('HIST201', 4, 'Fall', 2022, 'Room D', 4, 35),
    ('PHIL101', 5, 'Summer', 2023, 'Room E', 5, 20),
    ('SPAN101', 6, 'Summer', 2023, 'Room F', 6, 15);

--TABLE ROLE

CREATE TABLE ROLE (
  role_id INT primary key,
  role_name VARCHAR(3) unique,
  role_fullname VARCHAR(15),
  
);
drop table ROLE
INSERT INTO ROLE (role_id, role_name, role_fullname)
VALUES
  (1, 'ADM', 'Administrator'),
  (2, 'USR', 'User'),
  (3, 'MGR', 'Manager');

-- user role 

CREATE TABLE userrole (
  userid INT references [USER](userid),
  roleid INT references ROLE(role_id)
  
);

--user balance

CREATE TABLE userbalance (
  userid INT references [USER](userid),
  balance NUMERIC(18, 2)
);

INSERT INTO userbalance (userid, balance)
VALUES
  (1, 1000),
  (2, 500),
  (3, 2000);

INSERT INTO userrole (userid, roleid)
VALUES
  (1, 1),
  (2, 2),
  (3, 1);

--Create table teaches 

CREATE TABLE teaches (
  userid INT,
  classid VARCHAR(7),
  classnum INT,
  semester VARCHAR(7),
  year INT,
  FOREIGN KEY (userid) REFERENCES [user](userid),
  FOREIGN KEY (classid) REFERENCES course(classid),
  FOREIGN KEY (classnum) REFERENCES section(class_num)
);

INSERT INTO teaches (userid, classid, classnum, semester, year)
VALUES
  (1, 'CS101', 1, 'Fall', 2022),
  (2, 'MATH201', 3, 'Spring', 2023),
  (3, 'ENG102', 2, 'Summer', 2022),
  (4, 'HIST201', 1, 'Fall', 2022),
  (5, 'PHIL101', 4, 'Spring', 2023),
  (6, 'SPAN101', 2, 'Summer', 2022);

-- table takes
CREATE TABLE takes (
  userid INT references [USER](userid),
  classid VARCHAR(7) references course(classid),
  classnum INT references section(class_num),
  semester VARCHAR(7),
  year INT,
  grade VARCHAR(2)
);

INSERT INTO takes (userid, classid, classnum, semester, year, grade)
VALUES
  (1, 'CS101', 1, 'Fall', 2022, 'A'),
  (2, 'MATH201', 2, 'Spring', 2023, 'B+'),
  (3, 'ENG102', 1, 'Fall', 2022, 'A-'),
  (4, 'HIST201', 1, 'Fall', 2022, 'B'),
  (5, 'PHIL101', 1, 'Spring', 2023, 'C'),
  (6, 'SPAN101', 1, 'Fall', 2022, 'B+');

--CREATE TABLE USER_NUMBER 

CREATE TABLE user_number (
  userid INT REFERENCES [USER](userid),
  number NUMERIC(15,0),
  description VARCHAR(15)
);

INSERT INTO user_number (userid, number, description) VALUES 
(1, 1234567890, 'Home'),
(2, 9876543210, 'Work'),
(3, 5555555555, 'Mobile');

-- create table user address

CREATE TABLE user_address (
    userid int,
    address varchar(50),
    apt_num varchar(10),
    city varchar(25),
    state varchar(25),
    zip numeric(6),
    description varchar(25),
    FOREIGN KEY (userid) REFERENCES [USER](userid)
);


INSERT INTO user_address (userid, address, apt_num, city, state, zip, description)
VALUES
    (1, '123 Main St', 'Apt 4', 'New York', 'NY', 10001, 'Home'),
    (1, '456 1st Ave', NULL, 'New York', 'NY', 10016, 'Work'),
    (2, '789 Elm St', 'Unit 5', 'Los Angeles', 'CA', 90001, 'Home'),
    (3, '234 Oak Rd', NULL, 'Chicago', 'IL', 60601, 'Home'),
    (4, '567 Pine St', 'Suite 200', 'San Francisco', 'CA', 94101, 'Work'),
    (5, '890 Maple Ave', 'Apt 10', 'Boston', 'MA', 02101, 'Home');

-- table finaid_main

CREATE TABLE finaid_main (
  aid_id int PRIMARY KEY,
  name varchar(50),
  category varchar(50)
);

-- user_finaid_map

CREATE TABLE user_finaid_map (
  userid int REFERENCES [USER](userid),
  aidid int REFERENCES finaid_main(aid_id),
  semester varchar(15),
  offered numeric(18,2),
  accepted numeric(18,2),
  PRIMARY KEY (userid, aidid, semester)
);

DROP TABLE user_finaid_map

INSERT INTO finaid_main (aid_id, name, category)
VALUES 
    (1, 'Scholarship A', 'Merit-Based'),
    (2, 'Grant B', 'Need-Based'),
    (3, 'Loan C', 'Student Loan'),
    (4, 'Work-Study D', 'Employment-Based'),
    (5, 'Scholarship E', 'Merit-Based'),
    (6, 'Grant F', 'Need-Based');


INSERT INTO user_finaid_map (userid, aidid, semester, offered, accepted)
VALUES
    (1, 1, 'Fall 2022', 5000.00, 5000.00),
    (1, 2, 'Fall 2022', 2000.00, 2000.00),
    (1, 3, 'Fall 2022', 10000.00, 5000.00),
    (2, 1, 'Fall 2022', 4000.00, 4000.00),
    (2, 4, 'Fall 2022', 3000.00, 3000.00),
    (2, 5, 'Fall 2022', 6000.00, 6000.00);


-- user email , hold_main , user_hold_map

CREATE TABLE user_email (
  userid int REFERENCES [USER](userid),
  email varchar(50),
  description varchar(25)
);

CREATE TABLE hold_main (
  userid int REFERENCES [USER](userid),
  hold_id int PRIMARY KEY,
  name varchar(50),
  description varchar(250)
);
drop table hold_main
drop table user_hold_map

CREATE TABLE user_hold_map (
  userid int REFERENCES [USER](userid),
  holdid int REFERENCES hold_main(hold_id)
);

--insert records

INSERT INTO user_email (userid, email, description)
VALUES (1, 'john.doe@example.com', 'Personal email'),
       (2, 'jane.doe@example.com', 'Work email'),
       (3, 'bob.smith@example.com', 'Alternate email'),
       (4, 'sara.jones@example.com', 'Secondary email'),
       (5, 'david.brown@example.com', 'Backup email'),
       (6, 'jennifer.white@example.com', 'Primary email');


INSERT INTO hold_main (userid, hold_id, name, description)
VALUES (1, 1001, 'Library hold', 'Overdue book'),
       (2, 1002, 'Parking hold', 'Unpaid parking ticket'),
       (3, 1003, 'Academic hold', 'Incomplete coursework'),
       (4, 1004, 'Financial hold', 'Unpaid tuition'),
       (5, 1005, 'Medical hold', 'Incomplete health form'),
       (6, 1006, 'Registrar hold', 'Unresolved registration issue');


INSERT INTO user_hold_map (userid, holdid)
VALUES (1, 1001),
       (2, 1002),
       (3, 1003),
       (4, 1004),
       (5, 1005),
       (6, 1006);

------------------------------------------------------------------------------------

-------------------------------- TASK - 14 ----------------------------------
 --Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
--1. insert records into the table using a stored procedure.
use tasks1
CREATE TABLE Hobbies (
    HobbyID INT PRIMARY KEY,
    HobbyName VARCHAR(50) UNIQUE
);

CREATE PROCEDURE InsertHobby
    @HobbyID INT,
    @HobbyName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Hobbies (HobbyID, HobbyName)
    VALUES (@HobbyID, @HobbyName);
END

EXEC InsertHobby 1, 'Reading';
EXEC InsertHobby 2, 'Swimming';
EXEC InsertHobby 3, 'Cooking';

-- creating exception hanling procedure

CREATE PROCEDURE InsertHobbyWithExceptionHandling
    @HobbyID INT,
    @HobbyName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO Hobbies (HobbyID, HobbyName)
        VALUES (@HobbyID, @HobbyName);
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH;
END

EXEC InsertHobbyWithExceptionHandling 1, 'Reading';
EXEC InsertHobbyWithExceptionHandling 2, 'Swimming';
EXEC InsertHobbyWithExceptionHandling 3, 'Reading'; 

--To store the error details in an errorbackup table, you can create a table like this:

CREATE TABLE ErrorBackup (
    ErrorID INT IDENTITY PRIMARY KEY,
    ErrorMessage VARCHAR(MAX),
    ErrorTime DATETIME DEFAULT GETDATE()
);

CREATE PROCEDURE InsertHobbyWithBackup
    @HobbyID INT,
    @HobbyName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO Hobbies (HobbyID, HobbyName)
        VALUES (@HobbyID, @HobbyName);
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage VARCHAR(MAX) = ERROR_MESSAGE();
        
        INSERT INTO ErrorBackup (ErrorMessage)
        VALUES (@ErrorMessage);
        
        PRINT @ErrorMessage;
    END CATCH;
END

EXEC InsertHobbyWithBackup 1, 'Reading';
EXEC InsertHobbyWithBackup 2, 'Swimming';
EXEC InsertHobbyWithBackup 3, 'Reading';

select * from ErrorBackup

-- Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.

CREATE PROCEDURE CalculateProduct
    @Number1 INT,
    @Number2 INT
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @Number1 = @Number2
        SELECT @Number1 * @Number2 AS Product;
    ELSE
        RAISERROR('The two numbers are not equal.', 16, 1);
END

EXEC CalculateProduct 5, 5; 
EXEC CalculateProduct 2, 7;

--Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
    CREATE TABLE Friends (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

create PROCEDURE InsertFriend
    @name VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @name LIKE '[ADHKPRSTVY]%'
        INSERT INTO Friends (name) VALUES (@name);
    ELSE
        THROW 50001, 'The name must start with A, D, H, K, P, R, S, T, V, or Y.', 1;
END


EXEC InsertFriend 'Anna'; 
EXEC InsertFriend 'Zoe';

-----------------------------------------------------------------------------

-------------------------  TASK - 15 -------------------------------
--task15
create database task15
use task15

--create student table
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  gender VARCHAR(10)
);

--auto-commit and auto-rollback

INSERT INTO students (id, name, age, gender) VALUES (101, 'John Doe', 21, 'Male');

INSERT INTO students (id, name, age, gender) VALUES (101, 'John Doe', 'Twenty One', 'Male');

--implicit transaction

UPDATE students SET age = 22 WHERE id = 101;

--explicit transaction

--only commit - insert
BEGIN TRANSACTION;
INSERT INTO students (id, name, age, gender) VALUES (102, 'Jane Doe', 20, 'Female');
COMMIT;

--only rollback -update

BEGIN TRANSACTION;
UPDATE students SET age = 19 WHERE id = 102;
ROLLBACK;

--savepoint - commit update and insert

BEGIN TRANSACTION;
INSERT INTO students (id, name, age, gender) VALUES (103, 'Alice Smith', 22, 'Female');
SAVE transaction sp1;
UPDATE students SET age = 23 WHERE id = 103;
INSERT INTO students (id, name, age, gender) VALUES (104, 'Bob Johnson', 20, 'Male');
ROLLBACK transaction sp1;
DELETE FROM students WHERE id = 103;
COMMIT;

--------------------------------------------------------------------------------

----------------------- TASK - 16 -------------------------------------------
--task 16
use task15
CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  login_time DATETIME,
  logout_time DATETIME,
  employee_name VARCHAR(255),
  technology VARCHAR(255),
  working_days VARCHAR(255),
  operations BIT
);

INSERT INTO employee (employee_id, login_time, logout_time, employee_name, technology, working_days, operations) 
VALUES 
(1, '2023-04-01 09:00:00', '2023-04-01 18:00:00', 'John Doe', 'Software Engineering', 'Monday', '1'),
(2, '2023-04-02 09:00:00', '2023-04-02 18:00:00', 'David Doe', 'Software Engineering', 'Tuesday', '1'),
(3, '2023-04-03 09:00:00', '2023-04-03 18:00:00', 'Peter Pan', 'Software Engineering', 'Wednesday', '1'),
(4, '2023-04-01 08:00:00', '2023-04-01 17:00:00', 'Jane Smith', 'Data Science', 'Monday, Wednesday, Friday', '1'),
(5, '2023-04-02 08:00:00', '2023-04-02 17:00:00', 'Joe Smith', 'Data Science', 'Tuesday, Thursday', '0'),
(6, '2023-04-01 07:00:00', '2023-04-01 16:00:00', 'Bob Johnson', 'IT Support', 'Monday, Tuesday, Wednesday, Thursday, Friday', '1'),
(7, '2023-04-02 07:00:00', '2023-04-02 16:00:00', 'Bob Miller', 'IT Support', 'Saturday, Sunday', '0');

alter table employee drop column operations

select * from employee

-------------------------------------------------------------------------------------























































