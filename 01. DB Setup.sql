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

--Insert data
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