USE PracticeDB;
GO

-- Create a stored procedure UpdateSalary that takes an employee ID and a percentage and increases their salary by that percentage. 

CREATE PROC UpdateSalary(@EmployeeID INT, @IncreasePercentage DECIMAL(10,2))
AS
    UPDATE Employees 
    SET Salary = Salary + Salary * @IncreasePercentage / 100
    WHERE EmployeeId = @EmployeeID
GO

-- Sample Usage 
EXEC UpdateSalary 1, 10
GO 

-- Write a stored procedure AddNewProduct to insert a new product into the Products table. 

CREATE PROC AddNewProduct(@ProductName NVARCHAR(50), @CategoryID INT, @Price DECIMAL(10, 2), @Stock INT)
AS 
    INSERT INTO Products (ProductName, CategoryId, Price, Stock)
    VALUES (@ProductName, @CategoryID, @Price, @Stock)
GO

-- Sample Usage 
EXEC AddNewProduct 'Smartwatch', 1, 199.99, 100
GO 

-- Develop a stored procedure DeleteLowStockProducts that deletes all products with stock below 5. 

CREATE PROC DeleteLowStockProducts
AS 
    DELETE 
    FROM Products 
    WHERE Stock < 5
GO

-- Sample Usage 
EXEC DeleteLowStockProducts
GO 

-- Write a procedure TransferEmployee that takes an employee ID and a department ID and moves the employee to the new department. 

CREATE PROC TransferEmployee(@EmployeeID INT, @DepartmentID INT)
AS
    UPDATE Employees
    SET DepartmentId = @DepartmentID
    WHERE EmployeeId = @EmployeeID
GO

-- Sample Usage 
EXEC TransferEmployee 4, 2
GO 
