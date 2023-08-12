/*create a stored procedure that will take the
Employee ID of a person and checks if it is in the table. There are two
conditions
·       
It will create a new record if the Employee ID
is not stored in the table
·       
If the record is already in the table, it will
update that
*/
CREATE PROCEDURE SPCheckEmpID(
@FirstName VARCHAR(40),
@LastName VARCHAR(30) )
AS BEGIN 
if exists (select * from  Employee where EmployeeId=20 ) 
UPDATE Employee SET FirstName=@FirstName,LastName=@LastName wHERE EmployeeID=2
else 
INSERT INTO Employee( FirstName ,LastName) VALUES(@FirstName,@LastName)
return
END
EXEC SPCheckEmpID 'Divya','Jana'
Drop Procedure SPCheckEmpID
Select * from Employee

/*Write a Stored Procedure to validate username
and password raise error if the data already present.*/
CREATE PROCEDURE CheckPassword
    @UserName VARCHAR(20),
    @Password varchar(20)
AS
BEGIN

SET NOCOUNT ON

IF EXISTS(SELECT * FROM UserLogin WHERE UserName = @UserName AND Password = @Password)
    SELECT 'Data Valide' AS UserExists
ELSE
    SELECT 'Data Not Found' AS UserExists

END
Drop procedure Exception
EXEC CheckPassword 'Satya','$@Ty@'
EXEC CheckPassword 'Satya','THbd#$!2'

/*Assuming we want to create a stored procedure to calculate the total salary
  for a specific employee based on their EmployeeID and a provided PayrollPeriodID.(handle exceptions in SP)
*/
CREATE PROCEDURE Exception
(@EmployeeID INT)
AS BEGIN
	if Exists(select * from  Employee where EmployeeId=@EmployeeID)
		SELECT Salary.NetSalary ,PayrollPeriod.PayrollPeriodID FROM Salary INNER JOIN Employee ON Employee.EmployeeID=Salary.SalaryID INNER JOIN PayrollPeriod oN
		Employee.EmployeeID=PayrollPeriod.PayrollPeriodID 
	else
	 throw 50001,'ERROR ! No record present',1
END
EXEC Exception 20