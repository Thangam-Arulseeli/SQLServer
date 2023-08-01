-- Create Data base
CREATE DATABASE DbDesign
USE DbDesign

-- Create Schema
CREATE SCHEMA HospitalSch;

-- Create Doctor Table
CREATE TABLE HospitalSch.Doctor(
DoctorID Varchar(15) CONSTRAINT DOCPKey Primary Key,
DoctorName	Varchar(40)	Not Null,
Age	Int	Not Null,
Gender	Varchar(15)	Not Null,
Address	Varchar(100) Not Null,
ContactNo Bigint Not Null,
Qualification Varchar(50)	Not Null,
Specialization	Varchar(50)	Not Null,
VisitingDays Varchar(50) Not Null,
VisitingHrs	Varchar(50)	Not Null,
CreatedDate	DateTime	Not Null default getdate(),
CreatedUser	Varchar(40)	Not Null,
ModifiedDate DateTime	Not Null default getdate(),
ModifiedUser Varchar(40)	Not Null,
Status	Varchar(20)	Not Null)

-- To View the structure of the table -- WAY 1
EXEC sp_help 'HospitalSch.Doctor';

-- To View the structure of the table -- WAY 2
SELECT s.name as schema_name, t.name as table_name, c.* FROM sys.columns AS c
INNER JOIN sys.tables AS t ON t.object_id = c.object_id
INNER JOIN sys.schemas AS s ON s.schema_id = t.schema_id
WHERE t.name = 'Doctor' AND s.name = 'HospitalSch';


-- Create Room Table
CREATE TABLE HospitalSch.Room(
RoomNo	Int	CONSTRAINT RMPKey Primary Key,
BlockName Varchar(30)	Not Null,
RoomType Varchar(30) Not Null,
Rent Int Not Null,
Availability Char(2) Not Null)


-- Create Patient Table
CREATE TABLE HospitalSch.Patient(
PatientID varchar(15)	 CONSTRAINT PatPKey Primary Key,
PatientName varchar(40)	Not Null,
Age	int	Not Null,
Gender	varchar(15)	Not Null,
Address	varchar(100) Not Null,
ContactNo bigint	Not Null,
GardianName	varchar(40),	
Disease	varchar(100) Not Null,
DoctorID varchar(15) CONSTRAINT PatDocFKey Foreign Key REFERENCES HospitalSch.Doctor,
CreatedDate	DateTime Not Null Default getDate(),
CreatedUser	varchar(40)	Not Null,
DateModified DateTime	Not Null Default getDate(),
ModifiedUser varchar(40)	Not Null,
Status	Varchar(2)	Not Null)   -- L/NL

-- Create Laboratory Table 
CREATE TABLE HospitalSch.Laboratory(
LabReferenceNo	Int	CONSTRAINT LabPKey Primary Key,
PatientID Varchar(15) Foreign Key REFERENCES HospitalSch.Patient,
DoctorID Varchar(15) Foreign Key REFERENCES HospitalSch.Doctor,
TestDate	DateTime	Not Null Default getDate(),
InchargeName Varchar(40)	Not Null,
CreatedDate	DateTime	Not Null Default getDate(),
CreatedUser	Varchar(40)	Not Null,
ModifiedDate DateTime	Not Null Default getDate(),
ModifiedUser Varchar(40) Not Null)

-- Create OutPatient Table
CREATE TABLE HospitalSch.OutPatient(
OPReferenceNo	Int	CONSTRAINT OPPKey PRIMARY KEY,
PatientID 	varchar(15)	 FOREIGN KEY REFERENCES HospitalSch.Patient,
DoctorID	Varchar(15)	FOREIGN KEY REFERENCES HospitalSch.Doctor,
VisitDate	DateTime	Not Null Default getDate(),
Complaint	Varchar(100)	Not Null,
Diagnosis	Varchar(100)	Not Null,
Treatment	Varchar(100)	Not Null,
CreatedDate		DateTime	Not Null Default getDate(),
CreatedUser	Varchar(40)	Not Null,
ModifiedDate	DateTime	Not Null Default getDate(),
ModifiedUser	Varchar(40)	Not Null,
Status	Varchar(10)	Not Null)

-- Create Inpatient Table
CREATE TABLE HospitalSch.Inpatient(
IPReferenceNo	Int	CONSTRAINT IPPKey PRIMARY KEY,
PatientID	Varchar(15)	FOREIGN KEY REFERENCES HospitalSch.Patient ,
RoomNo	Int	FOREIGN KEY REFERENCES HospitalSch.Room,
DoctorIncharge	Varchar(15)	FOREIGN KEY REFERENCES HospitalSch.Doctor ,
AdmissionDate	DateTime	Not Null Default getDate(), 
DischargeDate	DateTime	Null,
Status	Varchar(20)	Not Null,
Remark	Varchar(100)	Null,
CreatedDate		DateTime	Not Null Default getDate(),
CreatedUser	Varchar(40)	Not Null,
ModifiedDate	DateTime	Not Null Default getDate(),
ModifiedUser	Varchar(40)	Not Null)





