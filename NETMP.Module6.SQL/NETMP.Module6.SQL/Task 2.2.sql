-- Task 1
SELECT	YEAR(orders.OrderDate) AS [OrderYear],
		COUNT(*) AS [Count]
FROM Orders AS orders
GROUP BY YEAR(orders.OrderDate)
GO

SELECT COUNT(*) AS Total FROM Orders 
GO

-- Task 2
SELECT	(SELECT CONCAT(FirstName, ' ', LastName) FROM Employees WHERE EmployeeID = Sellers.EmployeeID) AS Seller,
		Sellers.Amount
FROM	(SELECT DISTINCT orders.EmployeeID, COUNT(*) AS Amount 
		FROM Orders AS orders
		GROUP BY orders.EmployeeID) AS Sellers
ORDER BY Sellers.Amount DESC
GO

--Task 3
SELECT	(SELECT CONCAT(FirstName, ' ', LastName) FROM Employees WHERE EmployeeID = [Year Orders].EmployeeID) AS Seller,
		(SELECT CompanyName FROM Customers WHERE CustomerID = [Year Orders].CustomerID) AS Customer,
		[Year Orders].[Orders number]
FROM(SELECT orders.EmployeeID, orders.CustomerID, Count(*) AS [Orders number]
	FROM Orders AS orders
	WHERE YEAR(OrderDate) = 1998
	GROUP BY orders.EmployeeID, orders.CustomerID) AS [Year Orders]
ORDER BY Seller
GO

-- Task 4
CREATE VIEW UniqueCommonCities AS
SELECT DISTINCT customers.City FROM Customers AS customers GROUP BY customers.City
INTERSECT 
SELECT DISTINCT employees.City FROM Employees AS employees GROUP BY employees.City
GO

SELECT City, 'Seller' As 'Status', CONCAT(FirstName, ' ', LastName) AS 'Name'
FROM Employees AS employees
GROUP BY FirstName, LastName, City
HAVING City IN (SELECT * FROM UniqueCommonCities)
UNION
SELECT City, 'Customer', CompanyName
FROM Customers
GROUP BY CompanyName, City
HAVING City IN (SELECT * FROM UniqueCommonCities)
ORDER BY City, 'Status', 'Name'
GO

-- Task 5
SELECT customers.City, customers.CompanyName
FROM Customers AS customers
GROUP BY customers.City, customers.CompanyName
HAVING (SELECT COUNT(*) FROM Customers WHERE Customers.City = customers.City) > 1
ORDER BY customers.City, customers.CompanyName
GO

-- Task 6
SELECT	CONCAT(FirstName, ' ', LastName) AS Employee,
		(SELECT CONCAT(employees.FirstName, ' ', employees.LastName) 
		FROM Employees AS employees 
		WHERE employees.EmployeeID = [Outer].ReportsTo) AS Manager
FROM Employees as [Outer]
GO


