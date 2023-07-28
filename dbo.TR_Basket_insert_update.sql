CREATE TRIGGER dbo.TR_Basket_insert_update 
ON dbo.Basket
AFTER INSERT
AS
DECLARE @R INT
DECLARE @M DECIMAL(3,3)
SET @R = (SELECT COUNT(ID_SKU) FROM inserted)
SET @M = 0.05
IF @R >= 2
	UPDATE dbo.Basket
	SET dbo.Basket.DiscountValue = dbo.Basket.Value * @M
	WHERE dbo.Basket.ID_SKU IN (SELECT ID_SKU FROM inserted) 
ELSE
	UPDATE dbo.Basket
	SET dbo.Basket.DiscountValue = 0
	WHERE dbo.Basket.ID_SKU IN (SELECT ID_SKU FROM inserted) 
GO