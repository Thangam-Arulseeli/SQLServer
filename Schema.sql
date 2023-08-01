
--SCHEMA CREATION
CREATE SCHEMA EmpDBOSch1;
--CREATE TABLE empdbo.employee (EID int, EName varchar(20), salary bigint)
--INSERT INTO empdbo.employee values (101, 'Harita', 20000), (102,'Ranita', 18000), (103,'Yamini',28000), (104,'Harishmita',14000)
--SELECT * from empdbo.Employee;

--DROP SCHEMA EmpDBO
-- SELECT * FROM [INFORMATION_SCHEMA].[TABLES]  ---- Displays all tables under the schema 
-- [ It is listed in Databases->System Databases->master->Views->System Views->INFORMATION-SCHEMA.TABLES

--------------------------------------------------------

-- SCHEMA CREATION -- [Must be the first statement in the batch]

create schema Training

create table Training.Test1
(
TID int,
TName varchar(20)
)

drop table Training.Test1 
drop schema Training 
----------------------------------

-- rename  table
EXEC sp_rename Employees, EMPLOYEE;

---------------------------------------------

--- Alter DB Name Tasks to Task
ALTER DATABASE tasks MODIFY NAME = task;    
------------------------------------------------
--RENAME SCHEMA
CREATE SCHEMA Sales  -- Creates Sales schema

SELECT NAME AS schema_name FROM SYS.SCHEMAS;

CREATE SCHEMA Market   -- market schema

create table Market.MarketTable    -- Creates MarketTable in Market schema 
(
id int
)
insert into Market.MarketTable values(1)  


CREATE SCHEMA Finance   -- create Finance schema

-- Transfer the table from one schema to another schema
ALTER SCHEMA Finance TRANSFER Market.MarketTable    -- Transfers MarketTable from Market schema to Finance schema 

---------------------------------

--Rename a schema using transfer method
CREATE SCHEMA Schema1     --- Create a schema

CREATE TABLE Schema1.Test1     ---- Create a table in a schema
(
id int,
pname varchar(20),
)
INSERT INTO Schema1.Test1 VALUES(1,'Johnny');    

CREATE SCHEMA Schema2        ---- Create new schema

ALTER SCHEMA Schema2 TRANSFER Schema1.Test1      ---- Transfer/Move the table from one schema to another schema
SELECT * FROM Schema2.Test1                      ----- Table Test1 is not in Schema1
SELECT * FROM Schema1.Test1     -- ERROR Since Table Test1 is not in Schema1, it is moved to Schema2
------------------------------------ 

