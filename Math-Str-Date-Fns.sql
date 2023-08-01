USE Test2;

-----------------------------------------
--The CAST() function converts a value (of any type) into a specified datatype.
SELECT CAST(25.65 AS int) as Number;

SELECT CAST(25.65 AS varchar) as Character;

SELECT CAST('2017-08-25' AS datetime) as DateTime;
-----------------------------------------------------

--The CONVERT() function converts a value (of any type) into a specified datatype
SELECT CONVERT(int, 25.65);    -- 25

SELECT CONVERT(varchar, 25.65);  -- 25.65

SELECT CONVERT(datetime, '2017-08-25');   -- 2017-08-25 00:00:00.000

SELECT CONVERT(varchar, '2017-08-25');   -- 2017-08-25

SELECT GETDATE();    --- 2023-03-30 12:52:11.393

SELECT CONVERT(VARCHAR, GETDATE());    --- Mar 30 2023 12:52PM

--CAST is part of the ANSI-SQL specification; whereas, CONVERT is not.  In fact, CONVERT is SQL implementation-specific.
--CONVERT differences lie in that it accepts an optional style parameter that is used for formatting.
--For example, when converting a DateTime datatype to Varchar, you can specify the resulting date’s format, such as YYYY/MM/DD or MM/DD/YYYY.

SELECT CONVERT(VARCHAR,GETDATE(),100) as LargeDate, CONVERT(VARCHAR,GETDATE(),101) as MMDDYYYY,
       CONVERT(VARCHAR,GETDATE(),111) as YYYYMMDD, CONVERT(VARCHAR,GETDATE(),102) as 'YYYY:MM:DD'
--https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15
-------------------------------------------------------------------------------

--The COALESCE() function returns the first non-null value in a list.

SELECT COALESCE(NULL, NULL, NULL, 'Hello', NULL, 'Trainees') as FirstNotNull;   -- Hello
SELECT COALESCE(NULL, 1, 2, 'Welcome') as FirstNotNull;    -- 1
---------------------------------------------------------------------

--The CURRENT_USER function returns the name of the current user(Schema) in the SQL Server database. 
SELECT CURRENT_USER as DefaultSchema;   -- dbo
------------------------------------------------------------

--The IIF() function returns a value if a condition is TRUE, or another value if a condition is FALSE. -- Ternary/Conditional operator
SELECT IIF(500<1000, 'YES', 'NO') as Result;   -- YES
SELECT IIF(500>1000, 5, 10) as Result;     --- 10

SELECT empname,salary, IIF(salary>20000, 'Senior Developer', 'Junior Developer') as Details FROM Employees;
-----------------------------------------------------------

select * from Employees

-------------------------------
--SQL | NUMERIC FUNCTIONS 

SELECT ABS(-243.5) as abs;   --243.5  -- absolute value (Only the magnitude not the direction)
SELECT ACOS(0.25) as acos; 
SELECT ASIN(0.25) as asin;
SELECT ATAN(2.5) as atan;
SELECT CEILING(25.75) as ceiling;  -- 26 -- Highest value
SELECT CEILING(25.05) as ceiling;   -- 26 
SELECT CEILING(-25.75) as ceiling;  --    -25 -- Highest value
SELECT CEILING(-25.05) as ceiling;   --   -25 
SELECT COS(30) as cos;
SELECT COT(6) as cot;
SELECT DEGREES(1.5) as degrees;--It converts a radian value into degrees.
SELECT DEGREES(PI()) as pidegree;
SELECT EXP(10) as exp;
SELECT FLOOR(25.75) as Flooring  -- 25 -- Least value
SELECT FLOOR(25.05) as Flooring   -- 25 
SELECT FLOOR(-25.75) as Flooring  --     -26 -- Least value
SELECT FLOOR(-25.05) as Flooring   --    -26 
SELECT ROUND(235.414, 2) AS RoundValue;   --   235.410   Round with 2 digit precision when >= 5
SELECT ROUND(235.415, 2) AS RoundValue;   --   235.420
SELECT SIGN(255.5) as PositiveNegativeSign;    ---   1.0
SELECT SIGN(-255.5) as PositiveNegativeSign;    ---   -1.0
SELECT SQUARE(4) as Square;   --  16 
SELECT POWER(4, 2) as Power;   -- 16
SELECT POWER (2,5) as Power -- 32
--RAND(seed)
--seed	Optional. If seed is specified, it returns a repeatable sequence of random numbers. 
--If no seed is specified, it returns a completely random number
SELECT RAND();--no seed value - so it returns a completely random number >= 0 and <1
SELECT RAND(6);   -- 0.713685158069215  -- Constant value always
SELECT RAND(10);
SELECT RAND()*(10-5+1)+5;    --Return a random number >= 5 and <11:
SELECT RAND()*(10-5)+5;     --Return a random decimal number >= 5 and <10:
SELECT CHAR(FLOOR(RAND()*100)) AS CodeToCharacter;    -- Gives a Character value randomly
SELECT CHAR((RAND()*70)) AS CodeToCharacter;		---  -- Gives a Character value randomly

-------------------------------------------------------
--STRING FUNCTIONS

USE Mydatabase
SELECT * FROM Employee;
SELECT empname,ASCII(empname) AS NumCodeOfFirstChar FROM Employee;  
SELECT ASCII('A')  -- 65   ---- Gives ASCII value of first character
SELECT ASCII('Arulseeli')  -- 65
SELECT ASCII('A') as Uppercase;   -- 65
SELECT ASCII('a') as Lowercase;   -- 97

----------------------------------------------------------------
-- NOTE : Starting index is 1 and Not case sensitive
SELECT CHARINDEX('t', 'Trainee') AS MatchPosition;     --  1  -- CHARINDEX(substring, Actual string, start)
SELECT CHARINDEX('in', 'Trainee') AS MatchPosition;    -- 4 
SELECT CHARINDEX('rain', 'Trainee') AS MatchPosition;    -- 2
SELECT CHARINDEX('gain', 'Trainee') AS MatchPosition;    -- 0   -- No match found
SELECT CHARINDEX('i', 'Training') AS MatchPosition;    -- 4
SELECT CHARINDEX('i', 'Training',5) AS MatchPosition;    -- 6

SELECT empname, CHARINDEX('a',empname) FROM Employee;
-----------------------------------------------------------
-- Concatenation

SELECT CONCAT('Hello',' ','Trainees') AS Concatenation;
SELECT 'Welcome '+' '+'to'+' '+'CG VAK' AS StringConcatenation;
------------------------------------------------------

SELECT DATALENGTH('CG VAK') as Company;
SELECT DATALENGTH('G2') as Company;
SELECT empname,DATALENGTH(empname) as NameLength from Employee
--------------------------------------------------
/*The DIFFERENCE() function compares two SOUNDEX values, and returns an integer.
The integer value indicates the match for the two SOUNDEX values, from 0 to 4.
0 indicates weak or not similarity between the SOUNDEX values.
4 indicates strong similarity or identically SOUNDEX values.*/

SELECT DIFFERENCE('Trainees', 'Trainees') as Difference;   -- 4
SELECT DIFFERENCE('Trainee', 'Trainy') as Difference;    --- 4
SELECT DIFFERENCE('celi', 'Seelie') as Difference;    --- 3
SELECT * FROM Employee WHERE SOUNDEX(EMPNAME)=SOUNDEX('VIKRUM');   -- GETS THE RECORD WHEN SOUND IS SIMILAR

--------------------------------------------------

---   SPACE(NUM) Function   -- Leaves specific spaces   --- PUT '' to give ' (For single quote put '' )
SELECT concat(empname,'''s salary is ',space(5),salary) as Details from Employee;   --Return a string with 5 spaces:

SELECT STR(1852.476, 6, 2);   --  1852.5  --  STR(actual value, length-including . , digits after .)
SELECT STR(1852.476, 7, 2);   -- 1852.48
SELECT STR(1852.4);    --        186
       
-----------------------------------------------------------

--The STUFF() function deletes a part of a string and then inserts another part into the string, starting at a specified position.
-- STUFF(string, start, length, new_string)

SELECT STUFF('Hello Trainees', 1, 5, 'Hi');      --   Hi Trainees --  Removes Hello and add Hi 
SELECT STUFF('Hi Trainees!', 12, 1, ' Welcome!!!');    --  Hi Trainees Welcome!!!  -- Removes ! and add Welcome!!!
-------------------------------------------------------------------

--The SUBSTRING() function extracts some characters from a string.
--SUBSTRING(string, start, length)

SELECT SUBSTRING('Hello Trainees', 1, 5) AS ExtractString;
SELECT empname,SUBSTRING(empname, 1, 3) AS ExtractString from Employee;

SELECT empname,UNICODE(empname) AS UnicodeOfFirstChar from Employee;
SELECT empname,UPPER(empname) AS UnicodeOfFirstChar from Employee;
SELECT empname,LOWER(empname) AS UnicodeOfFirstChar from Employee;

-----------------------------------------
--DATE FUNCTIONS
/*
SQL Server SYSDATETIME, SYSDATETIMEOFFSET and SYSUTCDATETIME Functions
SQL Server High Precision Date and Time Functions have a scale of 7 and are:
SYSDATETIME - returns the date and time of the machine the SQL Server is running on
SYSDATETIMEOFFSET - returns the date and time of the machine the SQL Server is running on plus the offset from UTC
SYSUTCDATETIME - returns the date and time of the machine the SQL Server is running on as UTC*/

-- Higher precision functions 
SELECT SYSDATETIME()       AS 'DateAndTime';        -- return datetime2(7)   -- 2023-03-30 16:18:54.6917525    
SELECT SYSDATETIMEOFFSET() AS 'DateAndTime+Offset'; -- datetimeoffset(7)     -- 2023-03-30 16:18:54.6917525 +05:30
SELECT SYSUTCDATETIME()    AS 'DateAndTimeInUtc';   -- returns datetime2(7)  -- 2023-03-30 10:48:54.6917525

/*SQL Server CURRENT_TIMESTAMP, GETDATE() and GETUTCDATE() Functions
SQL Server Lesser Precision Data and Time Functions have a scale of 3 and are:
CURRENT_TIMESTAMP - returns the date and time of the machine the SQL Server is running on
GETDATE() - returns the date and time of the machine the SQL Server is running on
GETUTCDATE() - returns the date and time of the machine the SQL Server is running on as UTC(Universal Time Coordinated */

-- lesser precision functions - returns datetime
SELECT CURRENT_TIMESTAMP AS 'DateAndTime'; -- note: no parentheses   -- 2023-03-30 16:20:07.500
SELECT GETDATE()         AS 'DateAndTime';							 -- 2023-03-30 16:20:07.500
SELECT GETUTCDATE()      AS 'DateAndTimeUtc';						 -- 2023-03-30 10:50:07.500 

/*SQL Server DATENAME Function
DATENAME - Returns a string corresponding to the datepart specified for the given date*/
-- date and time parts - returns nvarchar 
SELECT GETDATE() AS CURRENTDATE;
SELECT DATENAME(YEAR, GETDATE())        AS 'Year';        
SELECT DATENAME(QUARTER, GETDATE())     AS 'Quarter';     
SELECT DATENAME(MONTH, GETDATE())       AS 'Month Name';       
SELECT DATENAME(DAYOFYEAR, GETDATE())   AS 'DayOfYear';   
SELECT DATENAME(DAY, GETDATE())         AS 'Day';         
SELECT DATENAME(WEEK, GETDATE())        AS 'Week';        
SELECT DATENAME(WEEKDAY, GETDATE())     AS 'Day of the Week';     
SELECT DATENAME(HOUR, GETDATE())        AS 'Hour';        
SELECT DATENAME(MINUTE, GETDATE())      AS 'Minute';      
SELECT DATENAME(SECOND, GETDATE())      AS 'Second';      
SELECT DATENAME(MILLISECOND, GETDATE()) AS 'MilliSecond'; 
SELECT DATENAME(MICROSECOND, GETDATE()) AS 'MicroSecond'; 
SELECT DATENAME(NANOSECOND, GETDATE())  AS 'NanoSecond';  
SELECT DATENAME(ISO_WEEK, GETDATE())    AS 'Week';    

/*SQL Server DATEPART Function
DATEPART - returns an integer corresponding to the datepart specified*/

-- date and time parts - returns int
SELECT DATEPART(YEAR, GETDATE())        AS 'Year';        
SELECT DATEPART(QUARTER, GETDATE())     AS 'Quarter';     
SELECT DATEPART(MONTH, GETDATE())       AS 'Month';       
SELECT DATEPART(DAYOFYEAR, GETDATE())   AS 'DayOfYear';   
SELECT DATEPART(DAY, GETDATE())         AS 'Day';         
SELECT DATEPART(WEEK, GETDATE())        AS 'Week';        
SELECT DATEPART(WEEKDAY, GETDATE())     AS 'WeekDay';     
SELECT DATEPART(HOUR, GETDATE())        AS 'Hour';        
SELECT DATEPART(MINUTE, GETDATE())      AS 'Minute';      
SELECT DATEPART(SECOND, GETDATE())      AS 'Second';      
SELECT DATEPART(MILLISECOND, GETDATE()) AS 'MilliSecond'; 
SELECT DATEPART(MICROSECOND, GETDATE()) AS 'MicroSecond'; 
SELECT DATEPART(NANOSECOND, GETDATE())  AS 'NanoSecond';  
SELECT DATEPART(ISO_WEEK, GETDATE())    AS 'Week'; 

/*SQL Server DAY, MONTH and YEAR Functions
DAY - returns an integer corresponding to the day specified
MONTH - returns an integer corresponding to the month specified
YEAR - returns an integer corresponding to the year specified*/

SELECT DAY(GETDATE())   AS 'Day';                            
SELECT MONTH(GETDATE()) AS 'Month';                       
SELECT YEAR(GETDATE())  AS 'Year';  

/*SQL Server DATEFROMPARTS, DATETIME2FROMPARTS, DATETIMEFROMPARTS, DATETIMEOFFSETFROMPARTS, SMALLDATETIMEFROMPARTS and  TIMEFROMPARTS Functions
DATEFROMPARTS - returns a date from the date specified
DATETIME2FROMPARTS - returns a datetime2 from part specified
DATETIMEFROMPARTS - returns a datetime from part specified
DATETIMEOFFSETFROMPARTS - returns a datetimeoffset from part specified
SMALLDATETIMEFROMPARTS - returns a smalldatetime from part specified
TIMEFROMPARTS - returns a time from part specified*/

-- date and time from parts
SELECT DATEFROMPARTS(2019,1,1)                         AS 'Date';          -- returns date, 3 arguments
SELECT DATETIME2FROMPARTS(2019,1,1,6,7,8,123,3)          AS 'DateTime2';     -- returns datetime2, 8 arguments
SELECT DATETIMEFROMPARTS(2019,1,1,6,7,8,123)             AS 'DateTime';      -- returns datetime , 7 arguments
SELECT DATETIMEOFFSETFROMPARTS(2019,1,1,6,2,3,4,5,30,7) AS 'Offset';        -- returns datetimeoffset
SELECT SMALLDATETIMEFROMPARTS(2019,1,1,6,0)            AS 'SmallDateTime'; -- returns smalldatetime
SELECT TIMEFROMPARTS(6,7,8,123,3)                        AS 'Time';          -- returns time

/*SQL Server DATEDIFF and DATEDIFF_BIG Functions
DATEDIFF - returns the number of date or time datepart boundaries crossed between specified dates as an int
DATEDIFF_BIG - returns the number of date or time datepart boundaries crossed between specified dates as a bigint*/

--Date and Time Difference
SELECT DATEDIFF(DAY, 2021-10-09, 2021-01-08)      AS 'DateDif'    -- returns int
SELECT DATEDIFF_BIG(DAY, 2021-10-09, 2021-03-08)  AS 'DateDifBig' -- returns bigint

/*SQL Server DATEADD, EOMONTH, SWITCHOFFSET and TODATETIMEOFFSET Functions
DATEADD - returns datepart with added interval as a datetime
EOMONTH - returns last day of month of offset as type of start_date
SWITCHOFFSET - returns date and time offset and time zone offset
TODATETIMEOFFSET - returns date and time with time zone offset*/

-- modify date and time
SELECT DATEADD(DAY,1,GETDATE())        AS 'DatePlus1';          -- returns data type of the date argument
SELECT DATEADD(YEAR,1,GETDATE())        AS 'YearPlus1';  
SELECT EOMONTH(GETDATE(),1)            AS 'LastDayOfNextMonth'; -- returns start_date argument or date
SELECT EOMONTH(GETDATE(),5)            AS 'LastDayOfAugustMonth';

--The following example uses SWITCHOFFSET to display a different time zone offset than the value stored in the database.
CREATE TABLE dbo.test   
    (  
    ColDatetimeoffset datetimeoffset  
    );  
INSERT INTO dbo.test   
VALUES ('1998-09-20 7:45:50.71345 -5:00');  
INSERT INTO dbo.test   
VALUES ('1998-09-20 7:45:50.71345 -5:30');  
INSERT INTO dbo.test   
VALUES ('1998-09-20 7:45:50.71345 +5:30');  
 
SELECT SWITCHOFFSET (ColDatetimeoffset, '-08:00')   
FROM dbo.test;  --temporary retrieval

--Returns: 1998-09-20 04:45:50.7134500 -08:00  
SELECT ColDatetimeoffset  
FROM dbo.test;  
--Returns: 1998-09-20 07:45:50.7134500 -05:00  
 
SELECT
    TODATETIMEOFFSET (
        '2019-03-06 07:43:58',
        '-08:00'
    ) result;

SELECT SYSDATETIME() AS [SYSDATETIME()]  ,SYSDATETIMEOFFSET() AS [SYSDATETIMEOFFSET()]  

--CONVERT
SELECT CONVERT (date, SYSDATETIME())  
    ,CONVERT (date, SYSDATETIMEOFFSET())  
    ,CONVERT (date, SYSUTCDATETIME())  
    ,CONVERT (date, CURRENT_TIMESTAMP)  
    ,CONVERT (date, GETDATE())  
    ,CONVERT (date, GETUTCDATE());  

SELECT CONVERT (time, SYSDATETIME()) AS [SYSDATETIME()]  
    ,CONVERT (time, SYSDATETIMEOFFSET()) AS [SYSDATETIMEOFFSET()]  
    ,CONVERT (time, SYSUTCDATETIME()) AS [SYSUTCDATETIME()]  
    ,CONVERT (time, CURRENT_TIMESTAMP) AS [CURRENT_TIMESTAMP]  
    ,CONVERT (time, GETDATE()) AS [GETDATE()]  
    ,CONVERT (time, GETUTCDATE()) AS [GETUTCDATE()]; 

	/*SQL Server ISDATE Function to Validate Date and Time Values
ISDATE - returns int - Returns 1 if a valid datetime type and 0 if not*/

-- validate date and time - returns int
SELECT ISDATE(GETDATE()) AS 'IsDate'; 
SELECT ISDATE(NULL) AS 'IsDate';

--DATEADD (date_part , value , input_date ) 
SELECT DATEADD(second, 1, '2018-12-31 23:59:59') result;
SELECT DATEADD(day, 1, '2018-12-31 23:59:59') result;

create table orders
(
orderid int,
orderdate datetime
)

insert into orders values(1,'2022-10-10'),(2,'2022-10-15'),(3,'2022-10-21')
select * from orders;

SELECT 
    orderid, 
    orderdate,
    DATEADD(day, 2, orderdate) estimated_shipped_date
FROM 
    orders;

SELECT DATEADD(month, 4, '2019-05-31') AS result;

--------------------------------------------------

-- FORMAT() Function to Foramt the Date & Time values 
-- FORMAT (value,format[,culture])

SELECT FORMAT (getdate(), 'dd-MM-yy') as date
SELECT FORMAT (getdate(), 'dd/MM/yyyy') as date
SELECT FORMAT (getdate(), 'dd-MMM-yy') as date
SELECT FORMAT (getdate(), 'hh:mm:ss') as time

--dd - this is day of month from 01-31
--dddd - this is the day spelled out
--MM - this is the month number from 01-12
--MMM - month name abbreviated
--MMMM - this is the month spelled out
--yy - this is the year with two digits
--yyyy - this is the year with four digits
--hh - this is the hour from 01-12
--HH - this is the hour from 00-23
--mm - this is the minute from 00-59
--ss - this is the second from 00-59
--tt - this shows either AM or PM
--d - this is day of month from 1-31 (if this is used on its own it will display the entire date)
--us - this shows the date using the US culture which is MM/DD/YYYY


-----   FORMAT with culture(3rd argument)
SELECT FORMAT (getdate(), 'd', 'en-us') as date  -- English USA Format 
GO
-- In the USA the format is month, day, year.
-- If this was run for March 21, 2018 the output would be: 3/21/2018

-- we will use the Spanish culture in Bolivia (es-bo):
SELECT FORMAT (getdate(), 'd', 'es-bo') as date
GO
-- In Bolivia the format is day, month, year.
-- If this was run for March 21, 2021 the output would be: 21/03/2021.

-------------------------------

-- FORMAT() FUNCTION TO FORMAT Numbers

--General Format	
SELECT FORMAT(200.3625, 'G', 'en-us') AS 'Format'	-- 200.3625

--Numeric Format	
SELECT FORMAT(200.3625, 'N', 'en-us') AS 'Format'  --	200.36

--Numeric 3 decimals	
SELECT FORMAT(11.0, 'N3', 'EN-US') AS 'Format'	-- 11.000

--Decimal	
SELECT FORMAT(12, 'D', 'en-us') AS 'Format'	-- 12

--Decimal 4	
SELECT FORMAT(12, 'D4', 'en-us') AS 'Format'	-- 0012

--Exponential	
SELECT FORMAT(120, 'E', 'EN-US') AS 'Format'	-- 1.200000E+002

--Percent
SELECT FORMAT(0.25, 'P', 'EN-US') AS 'Format'	-- 25.00%

--Hexadecimal
SELECT FORMAT(11, 'X', 'EN-US') AS 'Format'   --	B

--Currency-English-USA
SELECT FORMAT(200.36, 'C', 'en-us') AS 'Currency Format'  --	$200.36

--Currency-Germany
SELECT FORMAT(200.36, 'C', 'de-DE') AS 'Currency Format'	-- 200,36 €

--Currency-Japan	
SELECT FORMAT(200.36, 'C', 'ja-JP') AS 'Currency Format'	-- ¥200

--------------------------------------------------------------