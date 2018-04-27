IF NOT EXISTS 
	(SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Regions]') AND type in (N'U'))
BEGIN
	EXEC sp_rename 'Region', 'Regions'
END

IF COL_LENGTH('[dbo].[Customers]', 'FoundationDate') IS NULL
BEGIN
	ALTER TABLE Customers
	ADD FoundationDate DATETIME
END