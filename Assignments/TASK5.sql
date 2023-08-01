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







