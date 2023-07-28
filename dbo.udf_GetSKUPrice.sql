IF OBJECT_ID('dbo.udf_GetSKUPrice') IS NOT NULL DROP FUNCTION dbo.udf_GetSKUPrice;
GO

CREATE FUNCTION dbo.udf_GetSKUPrice
(
 @ID_SKU AS INT
)
RETURNS DECIMAL
AS
 BEGIN
 DECLARE @SKUPrice AS DECIMAL(18,2)
	SET @SKUPrice = (SELECT dbo.Basket.Value/dbo.Basket.Quantity as d FROM dbo.Basket WHERE	dbo.Basket.ID_SKU = @ID_SKU)
 RETURN @SKUPrice 
 END;
GO

