
---- Insert image in the table 
----- Way 1
CREATE TABLE Employees
(
    Id int,
    Name varchar(50) not null,
    Photo varbinary(max) not null
)


INSERT INTO Employees (Id, Name, Photo) 
SELECT 10, 'John', BulkColumn 
FROM Openrowset( Bulk 'C:\photo.bmp', Single_Blob) as EmployeePicture

---- WAY 2
---- Updaing the images
UPDATE Employees SET [Photo] = (SELECT
 MyImage.* from Openrowset(Bulk
 'C:\photo.bmp', Single_Blob) MyImage)
 where Id = 10


 --- WAY 3
 Create Table EmployeeProfile ( 
    EmpId int, 
    EmpName varchar(50) not null, 
    EmpPhoto varbinary(max) not null ) 
Go
Insert EmployeeProfile 
   (EmpId, EmpName, EmpPhoto) 
   Select 1001, 'Vadivel', BulkColumn 
   from Openrowset( Bulk 'C:\Image1.jpg', Single_Blob) as EmployeePicture


--- WAY 4
--- Inserting multiple images
INSERT INTO [dbo].[User]
           ([Name]
           ,[Image1]
           ,[Age]
           ,[Image2]
           ,[GroupId]
           ,[GroupName])
           VALUES
           ('Umar'
           , (SELECT BulkColumn 
            FROM Openrowset( Bulk 'path-to-file.jpg', Single_Blob) as Image1)
           ,26
           ,(SELECT BulkColumn 
            FROM Openrowset( Bulk 'path-to-file.jpg', Single_Blob) as Image2)
            ,'Group123'
           ,'GroupABC')

----------------------------------------------------------------------------------------------------
---- Creating tables for storing images

---- Creating tables for storing images
--CREATE TABLE DatabaseImageTable (
-- [image name] nvarchar(100),
-- [image] varbinary(max) )
---- Inserting the images into the table
--INSERT INTO DatabaseImageTable ([image name], [image])
--SELECT 'SQL Server Image', *
--FROM OPENROWSET(BULK N'D:\CGVAK\Miscellaneous\Images\RedRose.jpg', SINGLE_BLOB) image;