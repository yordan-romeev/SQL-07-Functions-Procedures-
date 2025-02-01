USE PracticeDB;
GO

-- Create a multi-statement TVF GetTopPaidEmployees that takes a department ID and returns the top 3 employees with the highest salaries in that department.

CREATE OR ALTER FUNCTION GetTopPaidEmployees (@departmentId INT)
RETURNS @TopEmployees TABLE (EmployeeId INT, Name NVARCHAR(50), Salary DECIMAL(10, 2))
AS
BEGIN
    INSERT INTO @TopEmployees
    SELECT TOP 3 EmployeeId, Name, Salary
    FROM Employees 
    WHERE DepartmentId = @departmentId
    ORDER BY Salary DESC
    RETURN
END

GO

-- Sample Usage 

SELECT * FROM dbo.GetTopPaidEmployees(3)
GO

-- Write a function GetEmployeeDetails that returns a table with employee names, their department names, and salaries.

CREATE FUNCTION GetEmployeeDetails()
RETURNS @EmployeeDetails TABLE (EmployeeId INT, Name NVARCHAR(50), Department NVARCHAR(50), Salary DECIMAL(10, 2))
AS
BEGIN
    INSERT INTO @EmployeeDetails
    SELECT e.EmployeeId, e.Name, d.DepartmentName, e.Salary
    FROM Employees e
    LEFT JOIN Departments d ON d.DepartmentId = e.DepartmentId
    RETURN
END

GO

-- Sample Usage 

SELECT * FROM dbo.GetEmployeeDetails()
GO

-- Develop a multi-statement TVF GetOutOfStockProducts that returns all products where the stock is 0.

CREATE FUNCTION GetOutOfStockProducts()
RETURNS @OutOfStockProducts TABLE (ProductId INT, ProductName NVARCHAR(50), CategoryId INT, Price DECIMAL(10, 2), Stock INT)
AS
BEGIN
    INSERT INTO @OutOfStockProducts
    SELECT * 
    FROM Products 
    WHERE Stock = 0
    RETURN
END

GO

-- Sample Usage 
SELECT * FROM dbo.GetOutOfStockProducts()
GO

-- Create a TVF GetEmployeesByAgeRange that takes a minimum and maximum age and returns employees whose age falls within the range.

CREATE OR ALTER FUNCTION GetEmployeesByAgeRange(@MinAge INT, @MaxAge INT)
RETURNS @EmployeesInAgeRange TABLE (EmployeeId INT, Name NVARCHAR(50), Age NVARCHAR(50))
AS
BEGIN
    INSERT INTO @EmployeesInAgeRange
    SELECT EmployeeId, Name, YEAR(GETDATE()) - YEAR(DateOfBirth) AS Age
    FROM Employees
    WHERE YEAR(GETDATE()) - YEAR(DateOfBirth) BETWEEN @MinAge AND @MaxAge
RETURN
END

GO

-- Sample Usage 

SELECT * FROM dbo.GetEmployeesByAgeRange(30, 35)
GO
