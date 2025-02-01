USE PracticeDB;
GO

-- Create an inline TVF GetEmployeesByDepartment that returns all employees belonging to a given department.

CREATE OR ALTER FUNCTION dbo.GetEmployeesByDepartment(@DepartmentID INT)
RETURNS TABLE
AS 
RETURN (
    SELECT EmployeeId, Name, DepartmentId, Salary
    FROM Employees 
    WHERE DepartmentId = @DepartmentID
)

GO

-- Sample Usage

SELECT * FROM dbo.GetEmployeesByDepartment(2);
GO

-- Write an inline TVF GetProductsByCategory that returns all products for a given category ID.

CREATE FUNCTION dbo.GetProductsByCategory(@CategoryID INT)
RETURNS TABLE
AS
RETURN (
    SELECT * 
    FROM Products
    WHERE CategoryId = @CategoryID
)

GO
-- Sample Usage 

SELECT * FROM dbo.GetProductsByCategory(1);
GO

-- Create a function GetAffordableProducts that takes a maximum price as input and returns all products below that price

CREATE FUNCTION GetAffordableProducts(@MaxPrice DECIMAL(10,2))
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM Products
    WHERE Price < @MaxPrice
)

GO
-- Sample Usage

SELECT * FROM dbo.GetAffordableProducts(100)
GO

-- Write a function GetDepartmentsWithEmployees that returns all departments with at least one employee.

CREATE FUNCTION GetDepartmentsWithEmployees()
RETURNS TABLE
AS
RETURN (
    SELECT d.DepartmentId, d.DepartmentName
    FROM Departments d
    JOIN Employees e ON e.DepartmentId = d.DepartmentId
    GROUP BY d.DepartmentId, d.DepartmentName
    HAVING COUNT(e.EmployeeId) > 0
)

GO

-- Sample Usage 

SELECT * FROM dbo.GetDepartmentsWithEmployees();
GO
