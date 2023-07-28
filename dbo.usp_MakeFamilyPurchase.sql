CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
(
@FamilySurName varchar(255)
)
AS
	IF NOT @FamilySurName IN (SELECT dbo.Family.SurName FROM dbo.Family)
		PRINT('Семья, имя которой было передано - не существует')
	ELSE
		UPDATE dbo.Family
		SET dbo.Family.BudgetValue -= (
			SELECT SUM(dbo.Basket.Value)
			FROM dbo.Family
				JOIN dbo.Basket
					ON dbo.Family.FamilyID = dbo.Basket.ID_Family
						AND @FamilySurName = dbo.Family.SurName)
		WHERE @FamilySurName = dbo.Family.SurName
GO
