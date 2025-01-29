# Functions & Procedures – Exercises

## 1. Database Setup

```sql
CREATE DATABASE PracticeDB;
GO
USE PracticeDB;
GO

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    DateOfBirth DATE,
    DepartmentId INT,
    Salary DECIMAL(10,2)
);

CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(50)
);

CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(50),
    CategoryId INT,
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50)
);

-- Insert data
INSERT INTO Departments (DepartmentName) VALUES ('HR'), ('IT'), ('Sales'), ('Marketing');

INSERT INTO Employees (Name, DateOfBirth, DepartmentId, Salary)
VALUES 
('John Doe', '1990-06-15', 1, 50000),
('Jane Smith', '1985-12-22', 2, 70000),
('Alice Brown', '1992-03-10', 3, 45000),
('Bob Johnson', '1988-09-05', 4, 55000);

INSERT INTO Categories (CategoryName) VALUES ('Electronics'), ('Clothing'), ('Home Appliances');

INSERT INTO Products (ProductName, CategoryId, Price, Stock)
VALUES 
('Smartphone', 1, 699.99, 50),
('Laptop', 1, 1299.99, 30),
('T-Shirt', 2, 19.99, 100),
('Vacuum Cleaner', 3, 149.99, 20);
```

## 2. Scalar Functions

```sql
-- Get full year from a given date
SELECT dbo.GetFullYear(GETDATE());
-- Example Output: 2025

-- Calculate annual salary
SELECT dbo.GetAnnualSalary(5000);
-- Example Output: 60000

-- Check if a product is in stock
SELECT dbo.IsInStock(1);
-- Example Output: TRUE

-- Calculate discounted price
SELECT dbo.GetDiscountPrice(699.99, 10);
-- Example Output: 629.99
```

## 3. Inline Table-Valued Functions

```sql
-- Get employees by department
SELECT * FROM dbo.GetEmployeesByDepartment(2);
-- Example Output:
-- EmployeeId | Name | DepartmentId | Salary 
-- 2 | Jane Smith | 2 | 70000

-- Get products by category
SELECT * FROM dbo.GetProductsByCategory(1);
-- Example Output:
-- ProductId | ProductName | CategoryId | Price | Stock 
-- 1 | Smartphone | 1 | 699.99 | 50 
-- 2 | Laptop | 1 | 1299.99 | 30

-- Get affordable products
SELECT * FROM dbo.GetAffordableProducts(100);
-- Example Output:
-- 3 | T-Shirt | 19.99

-- Get departments with employees
SELECT * FROM dbo.GetDepartmentsWithEmployees();
-- Example Output:
-- 1 | HR 
-- 2 | IT 
-- 3 | Sales 
-- 4 | Marketing
```

## 4. Multi-Statement Table-Valued Functions

```sql
-- Get top-paid employees in a department
SELECT * FROM dbo.GetTopPaidEmployees(3);
-- Example Output:
-- 3 | Alice Brown | 45000

-- Get employee details
SELECT * FROM dbo.GetEmployeeDetails();
-- Example Output:
-- 1 | John Doe | HR | 50000
-- 2 | Jane Smith | IT | 70000

-- Get out-of-stock products
SELECT * FROM dbo.GetOutOfStockProducts();

-- Get employees by age range
SELECT * FROM dbo.GetEmployeesByAgeRange(30, 40);
-- Example Output:
-- 1 | John Doe | 35 
-- 2 | Jane Smith | 39
```

## 5. Stored Procedures

```sql
-- Update employee salary by percentage
EXEC UpdateSalary 1, 10;
-- Example Output:
-- 1 | 55000

-- Add a new product
EXEC AddNewProduct 'Smartwatch', 1, 199.99, 100;
-- Example Output: Product added successfully.

-- Delete low-stock products
EXEC DeleteLowStockProducts;
-- Example Output: Products with low stock deleted.

-- Transfer an employee to a new department
EXEC TransferEmployee 4, 2;
-- Example Output:
-- 4 | Bob Johnson | 2
```

## 6. Optional Advanced Task

```sql
-- Multi-result stored procedure
EXEC GetEmployeeAndDepartmentInfo;
-- Returns:
-- 1. A result set of all employees.
-- 2. A result set of all departments.
