USE PracticeDB;
GO

-- Create a scalar function GetFullYear that extracts the year from a given date. Test it using GETDATE().

CREATE FUNCTION dbo.GetFullYear(@inputDate DATE)
RETURNS INT
AS
BEGIN
    RETURN YEAR(@inputDate)
END

GO

-- Sample usage 

SELECT dbo.GetFullYear(GETDATE());
GO

-- Write a scalar function GetAnnualSalary that calculates the annual salary of an employee based on their monthly salary.

CREATE FUNCTION dbo.GetAnnualSalary(@MontlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS 
BEGIN
    RETURN @MontlySalary * 12
END

GO

-- Sample Usage

SELECT dbo.GetAnnualSalary(5000);
GO

-- Create a function IsInStock that takes a product ID and returns TRUE if the stock is greater than 0, otherwise FALSE

CREATE FUNCTION IsInStock(@ProductID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @Stock INT
    SELECT @Stock = Stock FROM Products WHERE ProductId = @ProductID
    RETURN CASE 
        WHEN @Stock > 0 THEN 'TRUE'
        ELSE 'FALSE'
    END
END

GO

-- Sample Usage
SELECT dbo.IsInStock(1);
GO

-- Develop a scalar function GetDiscountPrice that takes a price and a discount percentage and returns the discounted price.

CREATE FUNCTION GetDiscountPrice(@Price DECIMAL(10,2), @DiscountPercentage DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN (@Price - (@Price * (@DiscountPercentage/100)))
END

GO
-- Sample Usage 
SELECT dbo.GetDiscountPrice(699.99, 10);

GO