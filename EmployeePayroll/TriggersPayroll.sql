/*Queries for Triggers:

Trigger to automatically update the HireDate of an employee when their record is inserted
Trigger to update the ModifiedDate of an employee when their record is updated
Trigger to delete salary records of an employee when they are deleted from the Employee table
Trigger to enforce a constraint where the EndDate of a leave must be greater than or equal to the StartDate
Trigger to automatically insert a new record in the Salary table with default values when a new employee is added to the Employee table*/

CREATE TABLE Track_Records
(Operation VARCHAR(30),ID INT,
ActionTime VARCHAR(100))
Select * from Track_Records


CREATE TRIGGER  Trig_InsUpd
ON Employee After Insert,Update
AS 
BEGIN
DECLARE @ID INT
SELECT @ID=EmployeeID FROM inserted
INSERT INTO Track_Records(Operation,ID,ActionTime)
VALUES ('Insert/Update',@ID,GETDATE())
--PRINT( "Inserted trigger exceuted")
END
INSERT INTO Employee VALUES('Sham','Khytc','1998-04-15','Male','Hyderabad',9433333243,'Sham@gmail.com','2020-10-11',7)
UPDATE Employee SET HireDate='2023-03-19' WHERE FirstName='Sham';

CREATE TRIGGER  Trig_Update
ON Employee FOR UPDATE
AS 
BEGIN
DECLARE @ID INT
SELECT @ID=EmployeeID FROM inserted
INSERT INTO Track_Records(Operation,ID,ActionTime)
VALUES ('Update',@ID,GETDATE())
--PRINT( "Inserted trigger exceuted")
END

UPDATE Employee SET  HireDate='2022-12-09' Where EmployeeID=4; 

CREATE TRIGGER  Trig_Delete
ON Salary FOR Delete
AS 
BEGIN
DECLARE @ID INT
SELECT @ID=EmployeeID FROM deleted
INSERT INTO Track_Records(Operation,ID,ActionTime)
VALUES ('Delete',@ID,GETDATE())
--PRINT( "Inserted trigger exceuted")
END
Delete From Salary Where EmployeeID=9;
