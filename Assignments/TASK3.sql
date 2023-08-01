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



