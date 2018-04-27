-- Task 1
SELECT customers.CompanyName, customers.Country
FROM Customers AS customers
WHERE customers.Country IN ('USA', 'Canada')
ORDER BY customers.CompanyName, customers.Country
GO

-- Task 2
SELECT customers.CompanyName, customers.Country
FROM Customers AS customers
WHERE customers.Country NOT IN ('USA', 'Canada')
ORDER BY customers.CompanyName
GO

-- Task 3
SELECT DISTINCT customers.Country
FROM Customers AS customers
ORDER BY customers.Country DESC
GO