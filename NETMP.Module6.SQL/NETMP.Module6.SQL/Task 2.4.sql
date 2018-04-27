-- Task 1
SELECT suppliers.CompanyName
FROM Suppliers AS suppliers
GROUP BY suppliers.SupplierID, suppliers.CompanyName
HAVING 0 IN (SELECT products.UnitsInStock 
			FROM Products AS products
			WHERE products.SupplierID = Suppliers.SupplierID)
GO

--Task 2
SELECT employees.FirstName, employees.LastName
FROM Employees AS employees
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName
HAVING (SELECT COUNT(*) 
		FROM Orders AS orders
		WHERE orders.EmployeeID = employees.EmployeeID 
		GROUP BY orders.EmployeeID) > 150
GO

-- Task 3
-- There are no customers having no orders
-- So the query check for 1 having order
SELECT customers.CustomerID
FROM Customers AS customers
WHERE EXISTS (SELECT *
			  FROM Orders AS orders
			  WHERE orders.CustomerID = customers.CustomerID
			  GROUP BY orders.CustomerID
			  HAVING COUNT(*) = 1)
GO