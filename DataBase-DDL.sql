--***** CREATING A DATABASE AND RENAMING THE DATABASE

CREATE DATABASE db1   -- Created DBs are stored in 'sys.databases' from that we can select it.... select * from sys.databases;  
USE db1

---------------------------------------------
 --*****Creating the table
CREATE TABLE Employee
(ECode int,
EmpName varchar(30),
Department varchar(20))
----------------------------------------------------
-- To View the structure of the table -- WAY 1  -- With table name and Schema name
EXEC sp_help 'HospitalSch.Doctor';

-- To View the structure of the table -- WAY 2   -- With table name and Schema name
SELECT s.name as schema_name, t.name as table_name, c.* FROM sys.columns AS c
INNER JOIN sys.tables AS t ON t.object_id = c.object_id
INNER JOIN sys.schemas AS s ON s.schema_id = t.schema_id
WHERE t.name = 'Doctor' AND s.name = 'HospitalSch';

-----------------------------------------------------
EXEC sp_rename 'dbo.Employees', 'Employee';  -- To rename the table in the data base

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
---------------------------------------------------

--Alter Table command to Add new column - DDL
USE MyDataBase
ALTER TABLE Employee 
ADD Salary INT;
----------------------------------------------
-- Alter Table command to RENAME the COLUMN Name
EXEC sp_rename 'Employee.Ecode', 'EmpCode', 'COLUMN';  -- Not working

ALTER TABLE Employee     --- Not Working
RENAME COLUMN Ecode to EmpCode;

--------------------------------------------
--Alter table command to modify the existing column - DDL   ( In SQL server & MS ACCESS )
ALTER TABLE Employee   
ALTER COLUMN salary numeric(8)

--Alter table command to modify the existing column - DDL   ( MySQL & Oracle (prior version 10G) )
--ALTER TABLE table_name
--MODIFY COLUMN column_name datatype;  

--Alter table command to modify the existing column - DDL   ( Oracle 10G and later )
--ALTER TABLE table_name
--MODIFY column_name datatype; 
-------------------------------------------------------

--Alter table command to delete the existing column - DDL
ALTER TABLE Employee   
DROP COLUMN salary 
--------------------------------------------------------------

-- GUID (Globally Unique Identifier)
--GUID is a 16 byte binary SQL Server data type that is globally unique across tables, databases, and servers. 
--The term GUID stands for Globally Unique Identifier and it is used interchangeably with UNIQUEIDENTIFIER.

USE MyDataBase
--SELECT NEWID() FROM GUID
SELECT NEWID() -- Execute this SQL multiple times and we receive a different value every time. 
--This is because the NEWID() function generates a unique value whenever you execute it.

-- To declare a variable of type GUID, the keyword used is UNIQUEIDENTIFIER as mentioned in the script below:
DECLARE 
    @id UNIQUEIDENTIFIER;
SET @id = NEWID();
SELECT 
    @id AS GUID;

-- NOTE: GUIDs can be considered as global primary keys. GUIDs can be considered as global primary keys.
-- PRIMARY KEY is  uniquely identify records within a table. 


-- Work : 1
CREATE DATABASE EngDB;
GO
 
USE EngDB;
GO
 
CREATE TABLE EnglishStudents
(
	Id INT PRIMARY KEY IDENTITY,
	StudentName VARCHAR (50) )
GO
 
INSERT INTO EnglishStudents VALUES ('Shane')
INSERT INTO EnglishStudents VALUES ('Jonny')
SELECT * FROM EnglishStudents 
-- Work 1 - Over  --  Similarly create MathStudent table in MathDB database


-- When the below query gets executed we get duplicate Id values -- To resolve this UNIQUEIDENTIFIER is used instred of PRIMARY KEY 
SELECT * FROM EngDB.dbo.EnglishStudents
UNION ALL
SELECT * FROM MathDB.dbo.MathStudents


-- Work 2 to resolve conflict in Work 1
USE MathDB
GO
 
CREATE TABLE MathStudents1
(
	Id UNIQUEIDENTIFIER PRIMARY KEY default NEWID(),
	StudentName VARCHAR (50)
)
GO
 
INSERT INTO MathStudents1 VALUES (default,'Sally')
INSERT INTO MathStudents1 VALUES (default,'Edward')
-- Work 2 -- Over  ---- Similarly use the above for EnglishStusents1 table with MathDB

-- GUID -- TASK 1 -- Using UNIQUEIDENTIFIER for PRIMARY KEY field with default keyword
-- USAGE of DELETE / TRUNCATE / DROP
USE MyDataBase
GO
 
CREATE TABLE UniqueIDTest1
(
	Id UNIQUEIDENTIFIER PRIMARY KEY default NEWID(),
	StudentName VARCHAR (50)
)
GO
 
INSERT INTO UniqueIDTest1 VALUES (default,'Sally')
INSERT INTO UniqueIDTest1 VALUES (default,'Edward')

SELECT * FROM UniqueIDTest1
TRUNCATE TABLE UniqueIDTest1 -- DDL statement to delete all records, without the table structure & memory and cannot ROLLACK
DELETE FROM UniqueIDTest1 WHERE id='71DD91DA-5039-49B1-9223-2A2CE07AF929' -- DML statement to delete all / specified records, without the table structure & memory and can ROLLACK
DROP TABLE UniqueIDTest1 -- Entire records as well as the table structure are removed with memory and cannot ROLLBACK
-- TASK 1 Over


-- GUID -- TASK 2 -- Using UNIQUEIDENTIFIER for PRIMARY KEY field with default keyword
USE MyDataBase
GO
 
CREATE TABLE UniqueIDTest2
(
	Id UNIQUEIDENTIFIER PRIMARY KEY default NEWID(),
	StudentName VARCHAR (50)
)
GO
 
INSERT INTO UniqueIDTest2 (StudentName) VALUES ('Kenny')
INSERT INTO UniqueIDTest2 VALUES (default, 'Jenny')

SELECT * FROM UniqueIDTest2
-- TASK 2 Over

-----------------------------------------------------------











