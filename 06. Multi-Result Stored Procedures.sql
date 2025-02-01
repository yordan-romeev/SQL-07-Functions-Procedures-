USE PracticeDB
GO

--Create a multi-result stored procedure GetEmployeeAndDepartmentInfo that returns:
    -- A result set of all employees.
    -- A result set of all departments.

CREATE PROC GetEmployeeAndDepartmentInfo
AS
    SELECT * FROM Employees
    SELECT * FROM Departments
GO

-- Sample Usage
EXEC GetEmployeeAndDepartmentInfo