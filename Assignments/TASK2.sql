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

SELECT name as schema_name
FROM sys.schemas;

create schema market

create table market.marketTable
(
id int
)

insert into market.marketTable values(1)

create schema finance

alter schema finance transfer market.marketTable

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


