-- Task 1
-- The original task is 'To define employeers, who managers 'Western' Region (from Region table)'
-- But table 'Employees' has no FK to Region table
-- The task has been modified to 'To define territories (table Territories) from 'Western' Region (from Region table)'
SELECT TerritoryID, TerritoryDescription
FROM Territories JOIN Region ON Territories.RegionID = Region.RegionID
WHERE RegionDescription = 'Western'
GO

-- Task 2
SELECT CompanyName, Count(*) AS [OrdersQuantity]
FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CompanyName
ORDER BY [OrdersQuantity]
GO

