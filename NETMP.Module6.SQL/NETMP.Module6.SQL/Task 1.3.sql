-- Task 1
SELECT DISTINCT orderDetails.OrderID
FROM [Order Details] AS orderDetails
WHERE orderDetails.Quantity BETWEEN 3 AND 10
GO

-- Task 2
SELECT DISTINCT customers.CustomerID, customers.Country
FROM Customers AS customers
WHERE LEFT(customers.Country, 1) BETWEEN 'b' AND 'g'
ORDER BY customers.Country
GO

-- Task 3
SELECT DISTINCT customers.CustomerID, customers.Country
FROM Customers AS customers
WHERE LEFT(customers.Country, 1) >= 'b' AND LEFT(customers.Country, 1) <= 'g'
GO