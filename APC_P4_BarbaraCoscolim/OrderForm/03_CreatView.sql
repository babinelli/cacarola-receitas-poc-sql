-- --------------------------------------------------------
-- Usar base de dados
-- --------------------------------------------------------

USE [Orders]
GO

-- --------------------------------------------------------
-- Criar View
-- --------------------------------------------------------

SELECT
	[O].OrderID AS [Order Number],
	[O].Date,
	[C].CustomerID AS [Customer Number],
	[C].CustomerName AS [Customer Name],
	[C].CustomerAddress AS [Customer Address],
	[CI].City,
	[CO].Country,
	[P].ProductRef AS [Product Reference],
	[P].ProductName AS [Product Name],
	[CA].Category,
	[OP].Quantity,
	[P].UnitPrice AS [Unit Price]
FROM
	[dbo].[Order] AS [O]
INNER JOIN
	[dbo].[Customer] AS [C]
ON
	[O].CustomerID = [C].CustomerID
INNER JOIN
	[dbo].[City] AS [CI]
ON
	[C].CityID = [CI].CityID
INNER JOIN
	[dbo].[Country] AS [CO]
ON
	[CI].CountryID = [CO].CountryID
INNER JOIN
	[dbo].[OrderProduct] AS [OP]
ON
	[O].OrderID = [OP].OrderID
INNER JOIN
	[dbo].[Product] AS [P]
ON
	[OP].ProductID = [P].ProductID
INNER JOIN
	[dbo].[Category] AS [CA]
ON
	[P].CategoryID = [CA].CategoryID

-- Não foi usado para criar a view
ORDER BY
	[C].CustomerID,
	[O].OrderID,
	[CO].Country,
	[CI].City,
	[P].ProductRef;


GO

-- Executa sp para ordernar a view por data e cliente
EXEC [dbo].[uspOrderView];
GO
