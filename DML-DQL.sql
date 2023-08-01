
--*****Create the database
 CREATE DATABASE MyDataBase
 
---------------------------------------------------------------

--*****Activating / using the database 
 USE MyDataBase
---------------------------------------------------------------

--***** SQL Statement types
-- 1. DDL statements *** create, alter, drop, truncate
-- 2. DML statements *** insert, update, delete
-- 3. DQL statements *** select
-- 4. DCL statements *** grant, revoke
-- 5. TCL statements *** commit, rollback, save point
------------------------------------------------------------------------

--*****Creating the table
CREATE TABLE Employee
(ECode int,
EmpName varchar(30),
Department varchar(20),
DOJ date,
Designation varchar(20),
Experience float);
-------------------------------------------------------------------------

-- To View the structure of the table -- WAY 1  -- With table name and Schema name
EXEC sp_help 'HospitalSch.Doctor';

-- To View the structure of the table -- WAY 2   -- With table name and Schema name
SELECT s.name as schema_name, t.name as table_name, c.* FROM sys.columns AS c
INNER JOIN sys.tables AS t ON t.object_id = c.object_id
INNER JOIN sys.schemas AS s ON s.schema_id = t.schema_id
WHERE t.name = 'Doctor' AND s.name = 'HospitalSch';



--***** Inserting the values to the table
--1. Insert only one record
 INSERT INTO Employee VALUES (1001, 'Vasanth', 'IT', '05-20-2023', 'Developer', 2.5) 
--2. Insert multiple records
 INSERT INTO Employee VALUES (1002, 'Hari Karthick', 'Tech', '05-25-2020', 'Developer', 2.5) ,(1003, 'Vickram', 'Tech', '05-25-2020', 'Developer', 4) 
--3. Insert only the specific fields
 INSERT INTO Employee(Empcode,Empname,department,doj) VALUES (1004, 'Sharon David', 'Tech', '04-20-2024') 
 
 INSERT INTO Employee VALUES (1011, 'Vasanth', 'IT', '05-20-2023', 'Developer', 2.5) 

------------------------------------------------------------
-- CREATE THE TABLE AND POPULATE THE TABLE ROWS BASED ON THE EXISING TABLE
-- select into (CopyOfEmployee will be created automatically)
SELECT * INTO CopyOfEmployee FROM Employee   -- Where clause can also be included

SELECT * FROM CopyOfEmployee
-----------
--4. Insert records from the existing table
INSERT INTO COPYOFEMPLOYEE SELECT * FROM EMPLOYEE WHERE SALARY > 20000
SELECT * FROM CopyOfEmployee

INSERT INTO COPYOFEMPLOYEE(EmpCode, EmpName, Department, Salary ) SELECT Empcode, empname, Department, Salary FROM Employee WHERE Experience=4
----------------------------------------------------------------------------------

--*****Updating the table data/columns
UPDATE employee SET designation='Testing', experience=1 WHERE empcode=1004
UPDATE employee SET designation='Testing', experience=experience*2 WHERE empcode=1004
UPDATE employee SET designation=designation+',Testing', experience=experience*2 WHERE empcode=1011

SELECT * from employee
------------------------------------------------------------------------------

--*****Deleting the record  -- specific record / entire records if no where clause
 DELETE FROM employee WHERE empcode=101
 DELETE employee WHERE empname='Malathi'
 DELETE FROM employee    --- OR ---    DELETE employee         ---- To delete entire records from the table

SELECT * FROM employee
----------------------------------------------------------------------------

--*****Truncate command used  to delete the entire recoed from the table

----------------------------------------------------------------------------
USE MyDataBase
GO

--***** SELECT (DQL) statement
 SELECT * FROM employee;    -- Select all records with all columns in each record
 SELECT empcode,empname,department FROM employee;   -- Select only the specific columns
 SELECT empcode, empname, department, salary, salary*.5 BONUS FROM Employee;  -- Computed column / Dummy column
 --- Concatenated Column values with alias
 SELECT empcode, 'Mr./ Ms. ' + empname [Employee Name], department, salary, salary*.5 BONUS FROM Employee; 
 SELECT empcode, 'Mr./ Ms. ' + empname 'Employee Name', department, salary, salary*.5 BONUS FROM Employee; 
 SELECT * INTO employeebackup from employee where ecode<3;    -- employeebackup table is created and populated with 2 rows

 --*** USING ALIAS NAMES TO THE COLUMNS
 SELECT empcode EMPCODE, empname 'EMPLOYEE CODE', department FROM employee   --- Give alias name to the column values
 SELECT empcode AS ECODE, empname AS [EMPLOYEE CODE], department FROM employee -- Give alias name to the column values using AS keyword and []
--SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address FROM Customers;  -- Alias name in MySQL
--SELECT CustomerName, (Address || ', ' || PostalCode || ' ' || City || ', ' || Country) AS Address FROM Customers;  -- Alias name in Oracle
--*** ALIAS NAMES TO THE TABLES
 SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o WHERE c.CustomerName='Aron Antony' AND c.CustomerID=o.CustomerID;
 SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers, Orders  WHERE Customers.CustomerName='Aron Antony' AND Customers.CustomerID=Orders.CustomerID;  -- Without alias
 SELECT ecode,empname,experience 'In-HOUSE', experience+3 'Total Experience' FROM employee  -- Including compluted column in SELECT statement
 SELECT ecode,empname,experience AS [In-HOUSE], experience+3 AS [Total Experience] FROM employee    -- Including compluted column in the query

--*** DISTINCT
 SELECT DISTINCT designation FROM Employee  -- Distinct with 1 columns
 SELECT DISTINCT department,designation FROM employee  -- Distinct with 2 columns
 USE MyDataBase
 SELECT TOP 3 * FROM employee  --- Select top 2 rows from the table (SQL SERVER/MS ACCESS/ORACLE) [Use WHERE clause also with top]
SELECT TOP 3 WITH TIES empname,salary FROM Employee ORDER BY salary DESC -- Displays all records that matches the last resultant value apart from top 3 records
--SELECT * FROM employee LIMIT 3;  -- Select top 2 rows from the table (MySQL)  
--SELECT * FROM Employee FETCH FIRST 3 ROWS ONLY; -- Select first 3 rows (ORACLE)
 SELECT TOP 10 PERCENT * FROM Employee;  -- Select top 10% records from employes table (SQL SERVER/MS ACCESS) [Use WHERE clause also with top]
--SELECT * FROM Customers FETCH FIRST 10 PERCENT ROWS ONLY;  --  Select top 10% records from employes table (ORACLE)

--***ORDER BY clause
 SELECT * FROM employee ORDER BY experience --[ASC/DESC] -- ASC is default, must specify DESC for descending order
 SELECT  * FROM  employee ORDER BY experience DESC, designation ASC  -- Order by with multiple column
 --SELECT product_name, list_price FROM production.products ORDER BY list_price, product_name; -- Orderby without offset(Skipping)
 --SELECT product_name, list_price FROM production.products ORDER BY list_price, product_name OFFSET 10 ROWS;  --Skips first 10 rows and gets all other records
 --SELECT product_name, list_price FROM production.products ORDER BY list_price, product_name OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY; --Skips first 10 rows and fetches next 10 rows only
 --SELECT product_name, list_price FROM production.products ORDER BY list_price DESC, product_name  OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY; --Fetches top 10 most expensive product
 

 --***FILTER THE RECORDS [WHERE clause]
SELECT * FROM employee WHERE experience>=2.5;
SELECT * FROM employee WHERE salary<20000;
SELECT * FROM employee WHERE salary>20000 and experience>3;
SELECT * FROM employee WHERE EmpName='Vasanth';
SELECT * FROM employee WHERE EmpName!='Vasanth';

SELECT * FROM employee WHERE Experience=2.5 OR EmpName='Vasanth'
SELECT * FROM employee WHERE Experience=2.5 AND EmpName='Vasanth'

SELECT * FROM employee WHERE Experience=2.5 or Experience=2
SELECT * FROM employee WHERE Experience IN (2.5, 2)
SELECT * FROM employee WHERE Experience NOT IN (2.5, 2)
SELECT * FROM employee WHERE Designation='Developer' OR Designation='Testing'
SELECT * FROM employee WHERE Designation IN ('Developer','Testing')
SELECT * FROM employee WHERE Designation NOT IN ('Developer','Testing')

SELECT * FROM employee WHERE Experience >=2 AND Experience<=4
SELECT * FROM employee WHERE Experience BETWEEN 2 AND 4     --  2 and 4 values are inclusive
SELECT * FROM employee WHERE Experience NOT BETWEEN 2 AND 4

SELECT * FROM employee WHERE Designation=NULL;
SELECT * FROM employee WHERE Designation IS NULL;
SELECT * FROM employee WHERE Designation IS NOT NULL;
SELECT * FROM employee WHERE Designation IS NULL;

SELECT * FROM employee WHERE EmpName LIKE 'Vasanth';
SELECT * FROM employee WHERE EmpName NOT LIKE 'Vasanth';
SELECT * FROM employee WHERE EmpName  LIKE 'V%';
SELECT * FROM employee WHERE EmpName  LIKE 'Raj_';      --  EmpName like Raji, Raja, Raj1, Raj2 etc can be selected
SELECT * FROM employee WHERE EmpName  LIKE 'Raj[1-5]';   -- Raj1 to Raj5 can be selected
SELECT * FROM employee WHERE EmpName  LIKE 'Raj[^1-5]';   -- EmpName is other than Raj1 to Raj5 are selected
SELECT * FROM employee WHERE EmpName  LIKE 'Raj[a,i,u,1,2]';  -- Select  EmpName like Raji, Raja, Raju, Raj1 and Raj2
SELECT * FROM employee WHERE EmpName  LIKE 'Raj[^a,i,u,1,2]';  -- Select  EmpName not like Raji, Raja, Raju, Raj1 and Raj2
SELECT * FROM employee WHERE EmpName  NOT LIKE 'Raj[a,i,u,1,2]';   -- Select  EmpName not like Raji, Raja, Raju, Raj1 and Raj2
SELECT * FROM employee WHERE EmpName  LIKE '[ADJ]%';   -- Name starts with A, D and J are displayed
SELECT * FROM employee WHERE EmpName  NOT LIKE '[A-M]%'  -- Name starts from A-M are displayed
SELECT * FROM Employee WHERE SOUNDEX(EMPNAME)=SOUNDEX('VIKRUM');   -- GETS THE RECORD WHEN SOUND IS SIMILAR
-- retrieve case sensitive record
 SELECT * FROM Employee where empname='Vasanth' COLLATE SQL_Latin1_General_CP1_CS_AS;


-- Retrieves case sensitive record
  select * from employee where empname='Vikram' COLLATE SQL_Latin1_General_CP1_CS_AS;
-------------------------------------------------------------------------------------
 --COLLATION
 -- Defines a collation of a database or table column, or a collation cast operation when applied to character string expression.
 --Collation name can be either a Windows collation name or a SQL collation name. 
 --If not specified during database creation, the database is assigned the default collation of the instance of SQL Server.
 --If not specified during table column creation, the column is assigned the default collation of the database.

 
 -- system function fn_helpcollations to retrieve 
 -- a list of all the valid collation names for Windows collations and SQL Server collations
 SELECT name, description FROM fn_helpcollations() WHERE name='SQL_Latin1_General_CP1_CS_AS'; 

ALTER TABLE Employee ALTER COLUMN EmpName VARCHAR(40) COLLATE Modern_Spanish_CI_AS;

-- Retrive Case Sensitive Record
SELECT * FROM Employee where empname='Vasanth' COLLATE SQL_Latin1_General_CP1_CS_AS; 
 
SELECT * FROM sys.fn_helpcollations() WHERE name LIKE 'SQL%';  -- To list the SQL Server collations supported by your server

SELECT *                        -- collation_name
FROM SYS.COLUMNS 
WHERE object_id = object_id('Employee')
--and name = 'stringdata';
----------------------------------------------

--***** IDENTITY
 -- Identity column of a table is a column whose value increases automatically. The value in an identity column is created by the server. 
 -- A user generally cannot insert a value into an identity column. Identity column can be used to uniquely identify the rows in the table.

-- -- IDENTITY [( seed, increment)]

-- Seed: Starting value of a column. Default value is 1.
-- Increment: Incremental value that is added to the identity value of the previous  row that was loaded. The default value 1.

CREATE TABLE IdentityTable
(IdVal int IDENTITY(1001, 1),
PNAME varchar(30));
INSERT INTO IdentityTable VALUES ('George');
INSERT INTO IdentityTable VALUES ('Infantina');
INSERT INTO IdentityTable VALUES ('Geraldine');
INSERT INTO IdentityTable VALUES ('Janifer');
SELECT * FROM IdentityTable



------------------------------------------
--COMPUTED COLUMNS IN TABLE CREATION
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
-------------------------------------------------------------

--COMPUTED COLUMN IN ALTER TABLE
CREATE TABLE WORKER1
(
fname varchar(25),
lname varchar(25),
designation varchar(25)
)

insert into WORKER1 values('John','J','Developer')
insert into WORKER1 values('James','J','Designer')
insert into WORKER1 values('Jamie','J','Tester')
insert into WORKER1 values('Jenny','J','HR')

select * from WORKER1

ALTER TABLE WORKER1 ADD FullName AS (fname + ' ' + lname)

select *  from WORKER1
------------------------------------------------------------------------------------

--***** CONSTRAINTS [SET OF RULES APPLIED FOR HAVING CONSISTANT(VALID) VALUES   
--**PRIMARY KEY [UNIQUE + NOT NULL -- Only one primary key in a table - To identify the record uniquely)
--**UNIQUE [ No duplicates, but allows any number of NOT NULLs)
--**COMPOSITE KEY [Combination of more than one columns act as PRIMARY KEY]
--**CANDIDATE KEY [Additional columns added with main key column to identify the particular record [EmpId is primary key where as EmailID/ ContactNo is candidate key]
--**FOREIGN KEY - REFERENCES [Child table column which refers the parent table Primary key field]
--**CHECK [To insists to enter only the valid value]
--**DEFAULT [When no value is entered, default value is automatically taken] 
--**NOT NULL [ Value must be entered - Should not be left null]

-- [NOTE : A CANDIDATE KEY is a subset of the super key that can uniquely identify the other attributes of the table.
-- A table can have more than one candidate key.
-- The candidate key helps in determining the prime and non-prime attributes of a table and
-- ensures the integrity of the data by preventing duplicate data.]

USE MyDataBase
CREATE TABLE EmployeeCons
(EID int PRIMARY KEY,
EName varchar(30) NOT NULL UNIQUE,
Age INT CHECK (Age>=18),
Designation varchar(20) DEFAULT 'Trainee')
INSERT INTO EmployeeCons VALUES(101,'DAVID',54,'Manager') -- Inserted
INSERT INTO EmployeeCons VALUES(101,'LILLY',54,'Accountant')  -- Error comes


------------------------------------------------------------------------------

--Schema Creation
--create schema EmpDBO;
--create table empdbo.employee (EID int, EName varchar(20), salary bigint)
--insert into empdbo.employee values (101, 'Harita', 20000), (102,'Ranita', 18000), (103,'Yamini',28000), (104,'Harishmita',14000)
--select * from empdbo.Employee;
--drop schema EmpDBO
-- select * from [INFORMATION_SCHEMA].[TABLES]  ---- Displays all tables under the schema 
-- [ It is listed in Databases->System Databases->master->Views->System Views->INFORMATION-SCHEMA.TABLES

--------------------------------------------------------
--***** CREATING A DATABASE AND RENAMING THE DATABASE

CREATE DATABASE db1
USE db1

 --*****Creating the table
CREATE TABLE Employee
(ECode int,
EmpName varchar(30),
Department varchar(20))

--*** WAY - 1
ALTER DATABASE [db1] MODIFY NAME = [test1]   -- Command works in SQL Server 2005 and above for renaming the database

--*** WAY - 2
EXEC sp_renamedb 'Test1', 'Test2'     -- Command works in SQL Server 2000 and above for renaming the database

EXEC sp_helpdb 'Test2'   --- Gives the details about the database and database log files

--*** WAY - 3
USE master;
GO
CREATE DATABASE Accounting;
GO
EXEC sp_renamedb N'Accounting', N'Financial';
GO
SELECT name, database_id, modified_date FROM sys.databases WHERE name = N'Financial';   -- To display the database ID, name ad modified date 
GO

------------------------------------------

--***** Delete the database
DROP DATABASE DB1;
DROP DATABASE DB1, DB2


-----------------------------------------------------------------
--***** RENAME TABLE 

USE Test2;    -- Activate the database
GO
EXEC sp_rename Employee, Employees;   --- Old table name is Employee and new table name is Employees

-------------------------------------------------------------

--***** DELETING THE TABLE
USE Test2
DROP TABLE employee;


----------------------------------------------------------------------------------------------------
---- Creating tables for storing images

---- Creating tables for storing images
--CREATE TABLE DatabaseImageTable (
-- [image name] nvarchar(100),
-- [image] varbinary(max) )
---- Inserting the images into the table
--INSERT INTO DatabaseImageTable ([image name], [image])
--SELECT 'SQL Server Image', *
--FROM OPENROWSET(BULK N'D:\CGVAK\Miscellaneous\Images\RedRose.jpg', SINGLE_BLOB) image;
-----------------------------------------------------------------------------------------
--Using GRANT permission 

-- add the bulkadmin role to SQL login
--ALTER SERVER ROLE [bulkadmin] ADD MEMBER [login_user]

-- OR
-- grant bulk operations permissions to SQL login
--GRANT ADMINISTER BULK OPERATIONS TO [login_user] -- you can take back the granted permissions by running REVOKE command later
-- REVOKE ADMINISTER BULK OPERATIONS TO [login_user]
------------------------------------------------------------------------------------------
select * from employee
