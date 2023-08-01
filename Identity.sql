 
--***** IDENTITY
 -- Identity column of a table is a column whose value increases automatically. The value in an identity column is created by the server. 
 -- A user generally cannot insert a value into an identity column. Identity column can be used to uniquely identify the rows in the table.

-- -- IDENTITY [( seed, increment)]

-- Seed: Starting value of a column. Default value is 1.
-- Increment: Incremental value that is added to the identity value of the previous row that was loaded. The default value 1. 
-- Increment value can also be changed

-------------------------------------------------------------------------------

USE MyDataBase
CREATE TABLE IdentityTable
(IdVal int IDENTITY(1001, 1),
PNAME varchar(30));

INSERT INTO IdentityTable VALUES ('George');
INSERT INTO IdentityTable VALUES ('Infantina');
INSERT INTO IdentityTable VALUES ('Geraldine');
INSERT INTO IdentityTable VALUES ('Janifer');
SELECT * FROM IdentityTable
Go


-------------------------------------------------------------------------------

--Script to display all identity values in a database

SELECT 
	OBJECT_SCHEMA_NAME(tables.object_id, db_id())
	AS SchemaName,
	tables.name As TableName,
	identity_columns.name as ColumnName,
	identity_columns.seed_value,
	identity_columns.increment_value,
	identity_columns.last_value
FROM sys.tables tables 
	JOIN sys.identity_columns identity_columns 
ON tables.object_id=identity_columns.object_id
GO

------------------------------------------------------------------------------------

-- Adding an identity column to the existing table

-- Creating table and inserting records without identity
CREATE TABLE Invoices
(
    InvoiceDate date, 
    InvoiceNumber varchar(100),
    PayTo varchar (100)
);
INSERT INTO Invoices VALUES
(getdate(), 'GL_0001', 'William'),
(getdate(), 'GL_0002', 'George Lilly');


-- Add Identity Column in the table
ALTER TABLE Invoices  
   ADD InvoiceID int identity;


-- Review Rows
SELECT * FROM Invoices;
-----------------------------------------------------------------------------------


--Altering an existing column to be an identity column

DROP TABLE Invoices -- clean up from prior example
GO

-- Step 1: Create Invoices table and populate with data
CREATE TABLE Invoices
(   
    InvoiceID int NOT NULL, 
    InvoiceDate date, 
    InvoiceNumber varchar(100),
    PayTo varchar (100)
);
INSERT INTO Invoices VALUES
(1, getdate(), 'GL_0001', 'Larsen'),
(2, getdate(), 'GL_0003', 'Mangalson');

-- Step 2: create temporary work table with same schema, but has identity column
CREATE TABLE Invoices2
(   
    InvoiceID int identity(1,1), 
    InvoiceDate date, 
    InvoiceNumber varchar(100),
    PayTo varchar (100)
);

-- Step 3: Switch Tables, drop original, and rename
 ALTER TABLE Invoices SWITCH TO Invoices2;
 -- drop original table
 DROP TABLE Invoices;
 -- Rename temp table back to original table name
 EXEC sp_rename 'Invoices2','Invoices';  

-- Step 4: Update the current seed value for new Invoices table
 DBCC CHECKIDENT('Invoices');

 ---------------------------------------------------------

 --Reseeding an identity column

-- Make sure to reseed the identity column of the new table using the DBCC CHECKIDENT command.
-- If this is not done, then the next row inserted will use the original seed value, and duplicate identity values could be created 
-- if there is not a primary key, or unique constraint, or unique index on the identity column.

--All foreign keys will need to be dropped prior to running the ALTER TABLE …SWITCH command.

--If indexes exist on the original table, then the temporary table will also need the exact same indexes, or the switch operation will fail.


--While the ALTER TABLE …SWITCH command is running, there must be no transactions running against the table. 
--All new transactions will be prevented from starting while the switch operation is being performed.

--When switching tables, security permissions could be lost because the security permissions are associated with the target table 
--when a switch operation is performed. Therefore, make sure permissions of the original table are recreated on the target table 
--ither before or shortly after the switch operation.


--Reseeding an identity column
--DBCC CHECKIDENT
-- (
--    table_name  
--        [, { NORESEED | { RESEED [, new_reseed_value ] } } ]  
--)  
--[ WITH NO_INFOMSGS ]  



--Using the RESEED option

--DBCC CHECKIDENT('Invoices',RESEED,2);


select CHARINDEX ('e', 'trainees trainer',10) as Result 

select  floor(rand()*100)  as result

---------------------------

--IDENTITY COLUMN

select id from s2.t1

alter table s2.t1 add name varchar(25)

truncate table s2.t1

alter table s2.t1 add id int identity(1,1)

insert into s2.t1(name) values ('John')

select * from s2.t1

set identity_insert s2.t1 on

insert into s2.t1(id,name) values (7,'John')

set identity_insert s2.t1 off

insert into s2.t1(name) values ('John')

Select SCOPE_IDENTITY()

DBCC CHECKIDENT('s2.t1', RESEED, 0)

Select IDENT_CURRENT('s2.t1')

select * from s2.t1

alter table s2.t1 add empid as (id+100)

----------------------------------------------