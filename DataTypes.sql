USE Test2

--DATATYPES

CREATE TABLE types
 (
	bigint_col BIGINT,
	int_col INT,
	smallint_col SMALLINT,
	tinyint_col tinyint,
	dec_col DECIMAL (4, 2),
       	num_col NUMERIC (4, 2),  -- Total digits including . is 4, after . is 2 (ie. 9.99)
	bit_col BIT,      -- Single bit
	val CHAR(10),      -- Fixed length character, leave spaces after the actual values, ranges from 1 - 8000 (1 byte) each 
	val1 NCHAR(10) NOT NULL,    -- 16 bit UTF encoding, national character, ranges from 1 - 4000 (2 bytes) each
	val2 VARCHAR(10) NOT NULL,     -- Variable length character, does not leave space after the actual values
	val3 NVARCHAR(20) NOT NULL,  --  -- Variable length character, does not leave space after the actual values
	created_at DATETIME2,    -- 
	dob DATE NOT NULL,
	login TIME (0) NOT NULL,
	modified_on DATETIMEOFFSET NOT NULL    -- Default precision is 7 digits with accuracy of 100ns, 
)

-- ABOUT NUMRIC DATA TYPES
--The size of storage required for numeric data types:
--On SQL Server:

-- tinyint    1 byte,   0 to 255
-- smallint   2 bytes, -215   (-32,768) to 215-1 (32,767)
-- int        4 bytes, -231   (-2,147,483,648) to 231-1 (2,147,483,647)
-- bigint     8 bytes, -263   (-9,223,372,036,854,775,808) to 263-1 (9,223,372,036,854,775,807)


--Those seem to be MySQL data types.

-- tinyint    = 1 byte
-- smallint   = 2 bytes
-- mediumint  = 3 bytes
-- int        = 4 bytes
-- bigint     = 8 bytes

-- END OF NUMERIC DATA TYPES

insert into types values
(
9223372036854775807,
		2147483647,
		32767,
		255,
		10.05, 
		20.05,
		1,
		'a',
		N'あ',
		'Hello',
		(N'ありがとうございました'),
		getdate(),
		'2000-01-31',
		'11:30:30',
		'2019-02-28 01:45:00.0000000 -08:00'
)


SELECT * FROM types


-- EXAMPLE FOR DATE - TIME ---
-- EXAMPLE 1
DECLARE @datetime DATETIME, @datetime2 DATETIME2(3);
    
SET @datetime2 = '2022-11-23 10:45:30.6782222';
SET @datetime = @datetime2;

SELECT @datetime AS 'DateTime',  @datetime2 AS 'DateTime2';
-- END OF EXAMPLE 1---



-- Example 2 : DateTime vs DateTime2 -- 
DECLARE @datetime datetime, @datetime2 datetime2(3);

SET @datetime2 = GETDATE();
SET @datetime = GETDATE();

SELECT DATALENGTH(@datetime) AS 'datetime', DATALENGTH(@datetime2) AS 'datetime2';
-- END OF EXAMPLE 2 --


-- Example 3: DateTime vs DateTime2 
DECLARE @datetime datetime;

SET @datetime = GETDATE();

SELECT @datetime + 1 as Tomorrow;
-- END OF EXAMPLE 3 -- 

-- Example 4 : DateTime vs DateTime2 Copy
DECLARE @datetime2 datetime2(7);
 
SET @datetime2 = GETDATE();

SELECT @datetime2 + 1 as Tomorrow;
-- END OF EXAMPLE 4 -- 

