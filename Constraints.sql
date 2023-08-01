--***** CONSTRAINTS [SET OF RULES APPLIED FOR HAVING CONSISTANT(VALID) VALUES   
---------------------------------------

--**PRIMARY KEY [UNIQUE + NOT NULL -- Only one primary key in a table - To identify the record uniquely)
--**UNIQUE [ No duplicates, but allows any number of NOT NULLs)
--**COMPOSITE KEY [Combination of more than one columns act as PRIMARY KEY]
--**CANDIDATE KEY [Additional columns added with SUPER KEY column to identify the particular record]
--**FOREIGN KEY - REFERENCES [Child table column which refers the parent table Primary key field]
--**CHECK [To insists to enter only the valid value]
--**DEFAULT [When no value is entered, default value is automatically taken] 
--**NOT NULL [ Value must be entered - Should not be left null]

---------------------------------------------

USE Test1;
CREATE SCHEMA Practice1;

--  Table Creation with constraints
CREATE TABLE Practice1.EmployeeCons1
(EID int PRIMARY KEY,
EName varchar(30) UNIQUE,
Gender varchar(10) CHECK (gender='Male' OR gender='Female'),
Age INT CHECK (Age>=18),
Designation varchar(20) DEFAULT 'Trainee',
Salary float CHECK (Salary between 20000 and 30000) )
INSERT INTO Practice1.EmployeeCons VALUES(101,'DAVID','Male',54,'Manager',25000) -- Inserted
Go
INSERT INTO EmployeeCons VALUES(101,'LILLY',54,'Accountant')  -- Error comes

----------------------------------------------------
-- Table Creation with constraints using explicit Constraint name
CREATE TABLE Practice1.EmployeeCons1
(EID int Constraint PEmpPKey PRIMARY KEY,
EName varchar(30) Constraint PEmpUniq UNIQUE,
Gender varchar(10) Constraint PEmpChkGen CHECK (gender='Male' OR gender='Female'),
Age INT Constraint PEmpChkAge CHECK (Age>=18),
Designation varchar(20) DEFAULT 'Trainee',
Salary float Constraint PEmp CHECK (Salary between 20000 and 30000) )







-- Create Table Departments
USE TEST2

-- TABLE LEVEL CONSTRAINTS
CREATE TABLE Departments
(
id int IDENTITY (1,1),
Dept_id INT,
Dept_name varchar(25),
CONSTRAINT pk_id PRIMARY KEY(id),
CONSTRAINT uk_id_name UNIQUE (Dept_id,Dept_name)
)

insert into Departments(Dept_id,Dept_name) values(100,'Angular Development')
insert into Departments(Dept_id,Dept_name) values(101,'React Development')
insert into Departments(Dept_id,Dept_name) values(102,'PHP Development')
insert into Departments(Dept_id,Dept_name) values(103,'Testing')
insert into Departments(Dept_id,Dept_name) values(104,'HR')

select * from Departments
------------------------------------------------

--create table Employees
create table Employees
(
id int IDENTITY (1,1),
empid int not null,
empname varchar(50) not null,
depid int,
designation varchar(25),
CONSTRAINT fk_dept foreign key(depid,designation) references Departments(Dept_id,Dept_name),
CONSTRAINT pk_eid primary key(id),
CONSTRAINT uk_empid_empname Unique (empid,empname)
);

--insert command in Employees
insert into Employees(empid,empname,depid,designation) values(111,'Nick',100,'Angular Development');
insert into Employees(empid,empname,depid,designation) values(112,'Tom',100,'Angular Development');
insert into Employees(empid,empname,depid,designation) values(113,'John',104,'HR');
insert into Employees(empid,empname,depid,designation) values(114,'Rita',103,'Testing');
insert into Employees(empid,empname,depid,designation) values(115,'Paul',103,'Testing');
insert into Employees(empid,empname,depid,designation) values(116,'Amy',104,'HR');
insert into Employees(empid,empname,depid,designation) values(117,'Jancy',101,'React Development');
insert into Employees(empid,empname,depid,designation) values(118,'Jack',101,'React Development');

--SELECT Trainees35
select * from Trainees35;
----------------------------------------------------------

--create table DeptDev
create table DeptDev
(
id int IDENTITY(1,1),
empid int,
empname varchar(50),
depid int,
designation varchar(25),
CONSTRAINT fk_empdev foreign key(empid,empname) references Employees(empid,empname),
CONSTRAINT fk_deptdev foreign key(depid,designation) references Departments(Dept_id,Dept_name),
CONSTRAINT pk_devid primary key(id)
);

insert into DeptDev(empid,empname,depid,designation) values(111,'Nick',100,'Angular Development');
insert into DeptDev(empid,empname,depid,designation) values(112,'Tom',100,'Angular Development');
insert into DeptDev(empid,empname,depid,designation) values(117,'Jancy',101,'React Development');
insert into DeptDev(empid,empname,depid,designation) values(118,'Jack',101,'React Development');

select * from DeptDev
---------------------------------------------------------------

--create table Testing
create table Testing
(
id int IDENTITY(1,1),
empid int,
empname varchar(50),
depid int,
designation varchar(25),
CONSTRAINT fk_emptest foreign key(empid,empname) references Employees(empid,empname),
CONSTRAINT fk_depttest foreign key(depid,designation) references Departments(Dept_id,Dept_name),
CONSTRAINT pk_testid primary key(id)
);

insert into Testing(empid,empname,depid,designation) values(114,'Rita',103,'Testing');
insert into Testing(empid,empname,depid,designation) values(115,'Paul',103,'Testing');

select empid,empname,depid,designation from Testing
--------------------------------------------------------------------

