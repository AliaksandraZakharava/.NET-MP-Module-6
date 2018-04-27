-- As there are no orders after 05.06.1998, then instead '01.06.1998' date has been used

-- Task 1
SELECT orders.OrderID, orders.ShippedDate, orders.ShipVia
FROM Orders AS orders
WHERE orders.ShippedDate >= '19980501' AND ShipVia >= 2 
GO

-- Task 2
SELECT orders.OrderID, 
	CASE 
		WHEN orders.ShippedDate IS NULL THEN 'Not shipped'
	END ShippedDate 
FROM Orders AS orders
WHERE orders.ShippedDate IS NULL
GO

-- Task 3
-- 9 is "Default + milliseconds" standard
SELECT	orders.OrderID AS [Order Number],
		CASE 
			WHEN orders.ShippedDate IS NULL THEN 'Not shipped' 
			ELSE CONVERT(varchar(20), CAST(ShippedDate as DATETIME), 9) 
		END AS [Shipped Date]
FROM Orders AS orders
WHERE orders.ShippedDate > '19980501' OR orders.ShippedDate IS NULL
GO
