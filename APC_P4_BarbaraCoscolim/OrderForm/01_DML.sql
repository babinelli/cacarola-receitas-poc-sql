-- ---------------------------------------------------------------------
-- USAR BASE DE DADOS
-- ---------------------------------------------------------------------

USE [Orders]
GO

-- ---------------------------------------------------------------------
-- STORED PROCEDURE (SP)
-- user defined function (udf)
-- user function n (ufn)
-- user storage procedure (usp)
-- ---------------------------------------------------------------------
/*
SELECT
	*
FROM
	[dbo].[Country];
GO
*/
-- ---------------------------------------------------------------------
-- INSERT
/*
	INSERT INTO TABELA (CAMPO1, CAMPO 2, ..., CAMPON)
		VALUES (VALOR1, VALOR2, ...,VALORN)
*/
-- ---------------------------------------------------------------------

-- Inserir 1 linha
INSERT INTO 
	[dbo].[Country] 
		([Country])
	VALUES 
		('XPTO');
GO


-- Inserir v�rias linhas
INSERT INTO 
	[dbo].[Country] 
		([Country])
	VALUES 
		('XPTO1'),
		('XPTO2'),
		('XPTO3');
GO
-- ---------------------------------------------------------------------
-- UPDATE
/*
	UPDATE TABELA
		SET CAMPO1 = VALOR1, CAMPO2 = VALOR2, ..., CAMPON = VALORN
		[WHERE CONDI��O]
*/
-- ---------------------------------------------------------------------

UPDATE 
	[dbo].[Country]
	SET 
		[Country] = 'Fran�a'
	WHERE 
		[Country] = 'XPTO';
GO

-- ---------------------------------------------------------------------
-- DELETE
/*
	DELETE FROM TABELA CAMPO
		[WHERE CONDI��O]
*/
-- ---------------------------------------------------------------------
DELETE FROM 
	[dbo].[Country]
	WHERE
		[Country] = 'XPTO3';
GO


EXEC [dbo].[uspSelectCountry];


