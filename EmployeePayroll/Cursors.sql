/*Queries for Cursors:

1Query using a cursor to fetch and display all employees' names
2 Query using a cursor to update the basic salary of all employees by a certain percentage
3 Query using a cursor to delete all employees who have left the organization
4 Query using a cursor to update employee designations based on their years of service
5 Query using a cursor to calculate the total salary for each employee and display the results
6 Cursor to update the salary of employees based on their performance rating:
 Suppose we have an EmployeePerformance table that contains the EmployeeID and their corresponding PerformanceRating.
  We want to update the salary of employees based on their PerformanceRating. 
Employees with a PerformanceRating of 'Excellent' will receive a 10% salary increase,
  'Good' will receive a 5% increase, and 'Average' will receive a 2% increase
7 Cursor to assign a default department for employees who don't have one:
  Suppose we have a Department table with a default department (DepartmentID = 1) representing employees without an assigned department.
  We want to check if any employees have a NULL DepartmentID and assign them to the default department.*/

 --1
 Declare @EmployeeID INT,
 @FirstName VARCHAR(60);
 DECLARE Cursor_Emp_Name CURSOR FOR 
 SELECT Employee.EmployeeID,Employee.FirstName FROM Employee
 OPEN Cursor_Emp_Name;
 
-- loop through a cursor
FETCH NEXT FROM Cursor_Emp_Name INTO @EmployeeID,@FirstName ;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('Employee ID : ',@EmployeeID ,'   Emp_Name : ',@FirstName);
    FETCH NEXT FROM Cursor_Emp_Name INTO @EmployeeID,@FirstName;
    END;
 
-- close and deallocate cursor
CLOSE Cursor_Emp_Name;
DEALLOCATE Cursor_Emp_Name;

uPDATE Salary SET BasicSalary=BasicSalary+(BasicSalary+10/1000) 
UPDATE Salary SET NetSalary=BasicSalary+Allowances-Deductions
SELECT * FROM Salary;

--6--+===================================================================================================
 Declare @EmployeeID INT,
 @FirstName VARCHAR(60),
 @BasicSalary INT,
 @NetSalary INT;
 DECLARE Cursor_Hike_Salary CURSOR FOR 
 SELECT Employee.EmployeeID,Employee.FirstName,Salary.BasicSalary ,Salary.NetSalary FROM Employee	
 INNER JOIN Salary ON Employee.EmployeeID=Salary.EmployeeID;

  OPEN  Cursor_Hike_Salary;
    DECLARE @Performance vARCHAR='Excellent';

 IF @Performance='Good'
 BEGIN
 UPDATE Salary SET BasicSalary=BasicSalary+(BasicSalary*5/100)  WHERE EmployeeID=2
UPDATE Salary SET NetSalary=BasicSalary+Allowances-Deductions  WHERE EmployeeID=2
END
ELSE IF @Performance='Excellent'
BEGIN
 UPDATE Salary SET BasicSalary=BasicSalary+(BasicSalary*50/100)  WHERE EmployeeID=1
UPDATE Salary SET NetSalary=BasicSalary+Allowances-Deductions  WHERE EmployeeID=1
END
ELSE
BEGIN
 UPDATE Salary SET BasicSalary=BasicSalary+(BasicSalary*2/100)  WHERE EmployeeID=10
UPDATE Salary SET NetSalary=BasicSalary+Allowances-Deductions  WHERE EmployeeID=10

END

 
-- loop through a cursor
FETCH NEXT FROM  Cursor_Hike_Salary INTO @EmployeeID,@FirstName ,@BasicSalary,@NetSalary;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('Employee ID : ',@EmployeeID ,'   Emp_Name : ',@FirstName,'    BasicSalary : ',@BasicSalary,'   NetSalary : ',@NetSalary);
    FETCH NEXT FROM Cursor_Hike_Salary  INTO @EmployeeID,@FirstName ,@BasicSalary,@NetSalary;
    END;
 
-- close and deallocate cursor
CLOSE Cursor_Hike_Salary ;
DEALLOCATE  Cursor_Hike_Salary ;

--2--+===================================================================================================

 Declare @EmployeeID INT,
 @FirstName VARCHAR(60),
 @BasicSalary INT,
 @NetSalary INT;
 DECLARE Cursor_Percent_Salary CURSOR FOR 
 SELECT Employee.EmployeeID,Employee.FirstName,Salary.BasicSalary ,Salary.NetSalary FROM Employee	
 INNER JOIN Salary ON Employee.EmployeeID=Salary.EmployeeID;
 OPEN Cursor_Percent_Salary;
 UPDATE Salary SET BasicSalary=BasicSalary+(BasicSalary*5/100)
UPDATE Salary SET NetSalary=BasicSalary+Allowances-Deductions

 
-- loop through a cursor
FETCH NEXT FROM Cursor_Percent_Salary  INTO @EmployeeID,@FirstName ,@BasicSalary,@NetSalary;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('Employee ID : ',@EmployeeID ,'   Emp_Name : ',@FirstName,'    BasicSalary : ',@BasicSalary,'   NetSalary : ',@NetSalary);
    FETCH NEXT FROM Cursor_Percent_Salary  INTO @EmployeeID,@FirstName ,@BasicSalary,@NetSalary;
    END;
 
-- close and deallocate cursor
CLOSE Cursor_Percent_Salary ;
DEALLOCATE Cursor_Percent_Salary ;

--5--+===================================================================================================
 Declare @EmployeeID INT,
 @FirstName VARCHAR(60),
 @NetSalary INT;
 DECLARE Cursor_Total_Salary CURSOR FOR 
 SELECT Employee.EmployeeID,Employee.FirstName,Salary.NetSalary FROM Employee	
 INNER JOIN Salary ON Employee.EmployeeID=Salary.EmployeeID;
 OPEN Cursor_Total_Salary ;
-- loop through a cursor
FETCH NEXT FROM Cursor_Total_Salary  INTO @EmployeeID,@FirstName,@NetSalary;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('Employee ID : ',@EmployeeID ,'   Emp_Name : ',@FirstName,'   TotalSalary : ',@NetSalary);
    FETCH NEXT FROM Cursor_Total_Salary   INTO @EmployeeID,@FirstName ,@NetSalary;
    END;
 
-- close and deallocate cursor
CLOSE Cursor_Total_Salary ;
DEALLOCATE Cursor_Total_Salary  ;