-- =============================================================================================================================
-- Template generated from Template Explorer using:
-- =============================================================================================================================
-- Author:		Bárbara Fantinelli Coscolim
-- Create date: 2020-09-20
-- Description:	Ordena a view dbo.vFullOrder por cliente (ordem alfabética) e data (mais recente para mais antiga)
-- =============================================================================================================================
CREATE PROCEDURE uspOrderView 

AS

BEGIN

	SET NOCOUNT ON;

	SELECT
		*
	FROM 
		[dbo].[vFullOrder]
	ORDER BY
		[Date] DESC,
		[Customer Name]

END

GO
