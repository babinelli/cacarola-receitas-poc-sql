-- =============================================
-- Author:		B�rbara Fantinelli Coscolim
-- Create date: 2020-09-18
-- Description:	SP para listar todos os pa�ses
-- =============================================
CREATE PROCEDURE uspSelectCountry 

AS

BEGIN
	SET NOCOUNT ON;
	
	SELECT
		*
	FROM
		[dbo].[Country];

END

GO
