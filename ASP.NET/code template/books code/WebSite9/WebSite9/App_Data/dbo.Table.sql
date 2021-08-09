CREATE TABLE [dbo].[student]
(
	[NO] NVARCHAR(10) NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Sex] CHAR(2) NOT NULL, 
    [birthday] DATETIME NOT NULL, 
    [Adress] NVARCHAR(50) NULL, 
    [Photo] NVARCHAR(50) NULL
)
