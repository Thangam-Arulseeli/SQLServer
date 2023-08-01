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

 SELECT * FROM Trainees 
ORDER BY Trainee_ID
OFFSET 5 ROWS
FETCH NEXT 10 ROWS ONLY

--top5 with ties
SELECT TOP 5 WITH TIES *
FROM Trainees
ORDER BY SALARY DESC;

-- desc order based on dept column

SELECT * FROM Trainees ORDER BY DEPARTMENT DESC

-- last name with third character as a

SELECT * FROM Trainees WHERE LAST_NAME LIKE '__a%'











