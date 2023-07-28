CREATE VIEW dbo.vw_SKUPrice(SKUID,Code,Name,SKUPrice) AS
SELECT dbo.SKU.SKUID, dbo.SKU.Code, dbo.SKU.Name, dbo.udf_GetSKUPrice(dbo.SKU.SKUID)
FROM dbo.SKU
GO