IF NOT EXISTS 
	(SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[CreditCards]') AND type in (N'U'))
BEGIN
CREATE TABLE CreditCards
(
	CreditCardID INT NOT NULL PRIMARY KEY, 
    CardHolder NVARCHAR(50) NOT NULL, 
    ValidThru DATE NOT NULL, 
    EmployeeID INT NOT NULL, 
    BankAddress NVARCHAR(150) NULL

	CONSTRAINT FK_CreditCards_Employees FOREIGN KEY ([EmployeeID]) REFERENCES Employees (EmployeeID)
)
END