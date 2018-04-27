-- Task 1
SELECT SUM(orderDetails.UnitPrice*orderDetails.Quantity*(1 - orderDetails.Discount)) AS [Totals]
FROM [Order Details] AS orderDetails
GO

-- Task 2
SELECT COUNT(
	CASE 
		WHEN orders.ShippedDate IS NULL THEN 1
		ELSE NULL
	END) AS 'Not shipped'
FROM Orders AS orders
GO

-- Task 3
SELECT COUNT(DISTINCT orders.CustomerID) AS [Customers]
FROM Orders AS orders
GO