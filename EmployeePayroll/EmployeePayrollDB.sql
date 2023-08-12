--Creating DataBase

CREATE DATABASE EmployeePayrollDB;
USE EmployeePayrollDB;

--==============================================EMPLOYEE TABLE===========================================================================
--Table Employee

CREATE TABLE Employee(
EmployeeID INT Primary Key IDENTITY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Date_of_Birth DATE,
Gender VARCHAR(10),
Address VARCHAR(100),
ContactNumber BIGINT,
Email VARCHAR(100),
HireDate DATE ,
DesignationID INT,
Foreign Key(DesignationID) References Designation(DesignationID));
INSERT INTO Employee VALUES('Sai','Adabala','1998-12-20','Female','Amalapuram',9123345332,'sai@gmail.com','2023-11-02',1);
INSERT INTO Employee VALUES('Satya','Adabala','1999-02-11','Female','Anathavaram',948363643726,'satya@gmail.com','2023-01-10',2);
INSERT INTO Employee VALUES('Ravi','kakarthi','2000-11-08','Male','Bhimavaram',8323245332,'Ravi@gmail.com','2023-02-05',3)
INSERT INTO Employee VALUES('Tej','Bonthu','1995-02-22','Male','Mumbai',9453345332,'Tej@gmail.com','2020-10-01',4)
INSERT INTO Employee VALUES('Sivani','Nokula','1991-10-12','Male','Bangluru',9123424123,'Siva@gmail.com','2013-02-03',5)
INSERT INTO Employee VALUES('Devi','Grandi','1998-10-04','Female','Chennai',7413122343,'Devi@gmail.com','2021-03-11',6)
INSERT INTO Employee VALUES('Sagar','Adala','1997-01-12','Male','Hyderabad',8214141422,'Sagar@gmail.com','2020-10-11',7)
INSERT INTO Employee VALUES('Priya','Penmasta','1989-12-06','Female','Hyderabad',9414222424,'Priya@gmail.com','2010-07-07',8)
INSERT INTO Employee VALUES('Ammu','Ddasd','1998-02-12','Female','Chennai',9153124214,'Ammu@gmail.com','2023-05-05',9)
INSERT INTO Employee VALUES('Puja','Mathukumalli','1996-10-11','Female','Delhi',9434134134,'Puja@gmail.com','2021-02-11',10)

SELECT * FROM Employee;
SELECT * FROM Designation;

--==============================================DESIGNATION TABLE===========================================================================

--Table Designation

CREATE TABLE Designation(
DesignationID INT PRIMARY KEY IDENTITY,
Designation_Name VARCHAR(30)
);
INSERT INTO Designation VALUES('Director'),
('Manager'),('SalesOfficer'),('Developer'),('HR'),('FinancialOffiers'),
('Cashier'),('Marketing'),('CEO'),('Executive');

--=============================================DEPARTMENT TABLE============================================================================

--Table Department

CREATE TABLE Department(
DepartmentID INT PRIMARY KEY IDENTITY,
Department_Name VARCHAR(50),
ManagerID INT
FOREIGN KEY(ManagerID) REFERENCES Employee(EmployeeID));
INSERT INTO Department VALUES('Administration',1),
('Executive',2),('Sales',3),('IT',4),('Human Resourse',5),('Finance',6),
('Accounts',7),('Production',8),('TopMangement',9),('Finance',10);

--============================================PAYROLL PERIOD TABLE=============================================================================

--Table PayrollPeriod:

CREATE TABLE PayrollPeriod(
PayrollPeriodID INT PRIMARY KEY IDENTITY,
StartDate DATE,
EndDate DATE);
INSERT INTO PayrollPeriod VALUES('2023-01-01','2023-04-01'),
('2022-07-01','2023-04-01'),
('2021-03-01','2022-04-01'),
('2019-02-01','2019-04-01'),
('2023-05-01','2023-07-01'),
('2019-06-01','2021-04-01'),
('2022-02-01','2022-04-01'),
('2021-08-01','2023-04-01'),
('2022-03-01','2022-09-01'),
('2023-01-01','2023-04-01');
SELECT * FROM PayrollPeriod

--==========================================SALARY TABLE===============================================================================

--Table Salary

CREATE TABLE Salary(
SalaryID INT PRIMARY KEY IDENTITY,
EmployeeID INT,
PayrollPeriodID INT
FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY(PayrollPeriodID) REFERENCES PayrollPeriod(PayrollPeriodID),
BasicSalary INT,
Allowances INT,
Deductions INT,
NetSalary INT
);
--NetSalary: The net salary (calculated as Basic Salary + Allowances - Deductions).
INSERT INTO Salary VALUES(1,1,20000,5000,2000,23000)
INSERT INTO Salary VALUES(2,2,30000,6000,1000,35000),
(3,3,40000,10000,1000,49000),(4,4,20000,3000,1000,22000),
(5,5,25000,6000,500,30500),(6,6,28000,5000,1000,33000),
(7,7,34000,4000,1000,37000),(8,8,44000,5000,900,58500),
(9,9,54000,5000,3000,56000),(10,10,20000,5000,500,24500);
SELECT * FROM Salary;

--===========================================ATTENDENCE TABLE==============================================================================

--Table Attendence
  
CREATE TABLE Attendence(
Attendence_ID INT PRIMARY KEY IDENTITY,
EmployeeID INT,
FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
Attendence DATE,
ClockIN TIME,
ClockOut Time);
SELECT * FROM Attendence;

--=============================================LEAVE TABLE============================================================================

--Table Leave

CREATE TABLE Leave(
LeaveID INT PRIMARY KEY IDENTITY,
EmployeeID INT,
FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
StartDate DATE,
EndDate DATE);
ALTER TABLE Leave Add LeaveType VARCHAR(40);
INSERT INTO Leave VALUES(1,'2022-07-01','2022-07-03','Sick Leave'),
(2,'2021-03-01','2021-03-05','Sick Leave'),
(3,'2019-02-01','2019-02-10','Vacation Leave'),
(4,'2023-05-01','2023-07-01','Sick Leave'),
(5,'2019-06-01','2020-04-20','Parental Leave'),
(6,'2022-02-01','2022-02-16','Vacation Leave'),
(7,'2021-08-01','2021-08-07','Study Leave'),
(8,'2022-03-01','2022-03-05','Sick Leave'),
(9,'2023-01-20','2023-02-01','Marriage Leave'),
(10,'2023-01-20','2023-01-23','Unpaid Leave');
SELECT * FROM Leave

--============================================TRAINING TABLE=============================================================================

--Table Training

CREATE TABLE Training(
TrainingID INT PRIMARY KEY IDENTITY,
Training_Name VARCHAR(50),
Description VARCHAR(50),
Trainer VARCHAR(40),
StartDate Date,
EndDate DATE,
EmployeeID INT,
FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID));
INSERT INTO Training VALUES('Web Design','Dsssd','Devi','2022-07-01','2022-12-03',1);
INSERT INTO Training VALUES('Data Analytics','Ewer','Ram','2021-03-01','2021-08-05',2);
INSERT INTO Training VALUES('AI','Dqwq','Sasi','2019-02-01','2019-06-10',3);
INSERT INTO Training VALUES('Devops','Sewwq','David','2023-05-01','2023-12-01',4);
INSERT INTO Training VALUES('Mobile Development','Kris','Jkgj','2019-06-01','2020-01-20',5);
INSERT INTO Training VALUES('CyberSecurity','Abf','Hema','2022-02-01','2022-08-16',6);
INSERT INTO Training VALUES('Database','Pjrnf','Sai','2021-08-01','2023-02-07',7);
INSERT INTO Training VALUES('Manual Testing','Hkfw','Gayathri','2022-03-01','2022-09-05',8);
INSERT INTO Training VALUES('.Net','Oefffe','Anu','2023-01-20','2023-08-01',9);
INSERT INTO Training VALUES('Agile','Dkdjf','Siva','2023-01-20','2023-05-23',10);

SELECT * FROM Training;

--=========================================================================================================================

CREATE TABLE UserLogin(
UserName VARCHAR(30),
Password VARCHAR(40))
INSERT INTO UserLogin VALUES('Sai','S@!848'),
('Jyothi','J@34!'),
('Satya','THbd#$!2'),
('Delip','&#Ghgh!12')

--=========================================DDL,DML,DQL================================================================================

--DDL,DML,DQL Commands

--Create
CREATE TABLE Emp(
ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(30));

--select
SELECT * FROM Emp;


--Insert
 INSERT INTO Emp VALUES('Ravi'),
 ('Sai');


--Alter
ALTER TABLE Emp ADD Email VARCHAR(40);
 INSERT INTO Emp VALUES('Satya','satya@gmail.com'),
 ('Devi','devi@gmail.com');


--UPDATE
UPDATE Emp SET Email='sai@gmail.com' WHERE Name='Sai';


--Delete
DELETE Emp WHERE Name='Devi';


--Drop
DROP TABLE Emp;


--Truncate
TRUNCATE TABLE Emp; 

--TCL Commands
--commit

--==========================================-Basic Queries:===============================================================================

--1.Query to display last 5 Records from table
--2.Query to fetch last record from the table
--3.Query to fetch monthly Salary of Employee if annual salary is given
--4.Display Even rows in Employee table
--5.Display last 50% records from Employee table
--6.get distinct records from the table without using distinct keyword(NOT DONE)
--7.add the email validation using only one query

SELECT TOP 5 * FROM Employee ORDER BY EmployeeID DESC

SELECT TOP 1 * FROM Employee ORDER BY EmployeeID DESC

SELECT Employee.EmployeeID,Employee.FirstName ,Salary.NetSalary  from Employee INNER JOIN Salary ON Employee.EmployeeID=Salary.EmployeeID ;

SELECT * FROM Employee WHERE (EmployeeID%2)=1;

SELECT TOP 50 PERCENT * FROM Employee ORDER BY EmployeeID 

if exists(Select Employee.Email from Employee Where Email='Satya@gmail.com')
	Select 'true' as Exist
else
	select 'false' as Exist

--===========================================JOIN query==============================================================================


--INNER :
--Retrieve employee information along with their department names and designations
--LEFT JOIN query:
--Retrieve all employees and their corresponding salaries, if available
--RIGHT JOIN query:
--Retrieve all salaries and the corresponding employee names, if available
--FULL OUTER JOIN query:
--Retrieve all employees and their salaries, including unmatched records from both table
--SELF JOIN query:
 --Retrieve the names of employees and their respective managers

SELECT Employee.EmployeeID,Employee.FirstName,Employee.LastName,Employee.Gender,Employee.Email,Department.Department_Name,
Designation.Designation_Name,Designation.DesignationID
 FROM  Employee  INNER JOIN Department ON Employee.EmployeeID=Department.DepartmentID 
 INNER JOIN  Designation ON  Employee.DesignationID=Designation.DesignationID;


INSERT INTO Employee VALUES('Sai','Adabala','1998-12-20','Female','Amalapuram',9123345332,'sai@gmail.com','2023-11-02',1);
SELECT * FROM Employee LEFT JOIN Salary ON  Employee.EmployeeID=Salary.EmployeeID ;


SELECT Salary.SalaryID,Salary.EmployeeID,Salary.PayrollPeriodID,Salary.BasicSalary,Salary.Allowances,
Salary.Deductions,Salary.NetSalary,Employee.FirstName,Employee.LastName FROM Employee RIGHT JOIN Salary ON  Employee.EmployeeID=Salary.EmployeeID ;


SELECT * FROM Employee FULL JOIN Salary ON  Employee.EmployeeID=Salary.EmployeeID ;


 SELECT Employee.FirstName, Department.ManagerID  FROM Employee,Department WHERE  Employee.EmployeeID=Department.ManagerID;

 --=========================================FUNCTIONS================================================================================

 --
 /*Queries for Functions:
Query using the CalculateAge function to retrieve the age of employees
  Query using a custom function to calculate the total salary for an employee
Query using a function to get the number of employees in a specific department
Query using a function to get the number of leaves taken by an employee
*/
 SELECT Employee.FirstName,Employee.LastName,DATEDIFF(YEAR ,Date_of_Birth,GETDATE()) AS Age FROM Employee;
 Select * from Employee

 SELECT SUM(NetSalary) AS TotalSalary,Salary.EmployeeID FROM Salary GROUP BY EmployeeID;

 SELECT COUNT(*) AS No_Of_Employees FROM Department WHERE Department_Name='Finance' GROUP BY Department_Name

 SELECT Employee.FirstName, Leave.LeaveType,DATEDIFF(Day,StartDate,EndDate) as Days From Leave INNER JOIN Employee ON Leave.EmployeeID=Employee.EmployeeID

 --==================================================VIEW=======================================================================

 /*Queries for Views:

Query using the EmployeeDetails view to get employee details along with department and manager information
Query using a view to get employees who have taken leaves within a specific date range
Query using a view to get employees with their respective department and designation names
Query using a view to get employees who are managers along with their department names
*/
CREATE VIEW EmployeeDetails
AS
SELECT Employee.FirstName,Employee.LastName,Employee.Email,Employee.HireDate,Department.DepartmentID,Department.Department_Name,
Department.ManagerID FROM Employee,Department WHERE Employee.EmployeeID=Department.DepartmentID
SELECT * FROM EmployeeDetails


CREATE VIEW ViewLeaves
AS
SELECT * FROM Leave WHERE StartDate BETWEEN ('2019-01-01') AND ('2022-01-01') ;
SELECT * FROM ViewLeaves


CREATE VIEW ViewNames
AS
SELECT Employee.FirstName,Department.Department_Name,Designation.Designation_Name FROM Employee 
INNER JOIN Department ON Employee.EmployeeID=Department.ManagerID  INNER JOIN Designation ON Employee.EmployeeID=Designation.DesignationID;
SELECT * FROM ViewNames
 
 
 CREATE VIEW DepartName
AS Select Designation.Designation_Name FROM Designation WHERE Designation_Name='Manager'
SELECT * FROM DepartName
--==============================================INDEXES===========================================================================



/*Queries for Indexes:

Query using the IX_Employee_EmployeeID index to retrieve an employee by their ID
Query using an index on the StartDate column to improve performance in searching for leaves within a specific date range
Query using an index on the DepartmentID column to optimize filtering employees by their department
Query using an index on the NetSalary column to speed up searching for employees with specific salary ranges
Query using an index on the DesignationName column to quickly search for employees with a specific job designation
*/
CREATE INDEX IX_Employee_EmployeeID  ON Employee(EmployeeID)
SELECT * FROM  Employee WHERE EmployeeID=1;

CREATE INDEX IX_Leave_StartDate  ON Leave(StartDate)
SELECT * FROM Leave WHERE StartDate BETWEEN ('2019-01-01') AND ('2022-01-01') ;

CREATE UNIQUE INDEX IX_DepartID ON Department(DepartmentID)
SELECT Department_Name,COUNT(Department_Name) AS Employees FROM Department
 GROUP BY Department_Name; 

CREATE NONCLUSTERED INDEX IX_NetSalary ON Salary(NetSalary)
SELECT NetSalary FROM Salary WHERE NetSalary<30000;

CREATE  INDEX IX_DesignationName ON Designation(Designation_Name)
SELECT * FROM Designation WHERE Designation_Name='Manager';

/*Queries for Triggers:

Trigger to automatically update the HireDate of an employee when their record is inserted
Trigger to update the ModifiedDate of an employee when their record is updated
  Trigger to delete salary records of an employee when they are deleted from the Employee table
Trigger to enforce a constraint where the EndDate of a leave must be greater than or equal to the StartDate
Trigger to automatically insert a new record in the Salary table with default values when a new employee is added to the Employee table*/


/*Subquery

Query to get employees who have salaries greater than the average salary in their department
Query to retrieve employees who have taken leaves longer than the average leave duration
Query to get employees whose salary is within 10% of the highest salary in their department */

Select Salary.NetSalary from Salary where NetSalary>
(Select Avg(NetSalary) from Salary )

 SELECT  Leave.LeaveType,DATEDIFF(Day,StartDate,EndDate)  From Leave WHERE DATEDIFF(Day,StartDate,EndDate)
>(Select AVg(DATEDIFF(Day,StartDate,EndDate)) from Leave)

