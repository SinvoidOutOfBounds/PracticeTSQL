IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL
 DROP TABLE dbo.SKU;

CREATE TABLE dbo.SKU
 (
	SKUID INT IDENTITY (1,1) NOT NULL
	,CONSTRAINT PK_dbo_SKUID PRIMARY KEY (SKUID)
	,Code AS ('s' + Cast(SKUID as varchar))
	,CONSTRAINT UNQ_dbo_Code UNIQUE(Code)
	,Name NVARCHAR(30)		 NOT NULL
 );

IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL
 DROP TABLE dbo.Family;

CREATE TABLE dbo.Family
 (
	FamilyID INT IDENTITY (1,1) NOT NULL
	,CONSTRAINT PK_dbo_FamilyID PRIMARY KEY (FamilyID)
	,SurName NVARCHAR(30)		NOT NULL
	,BudgetValue INT			NOT NULL
 );

IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL
 DROP TABLE dbo.Basket;

CREATE TABLE dbo.Basket
 (
	BasketID       INT IDENTITY (1,1)   NOT NULL
	,CONSTRAINT    PK_dbo_BasketID      PRIMARY KEY (BasketID)
	,ID_SKU        INT				    NOT NULL 
	,ID_Family     INT				    NOT NULL
	,CONSTRAINT    FK_dbo_ID_SKU        FOREIGN KEY (ID_SKU)    REFERENCES dbo.SKU(SKUID)
	,CONSTRAINT    FK_dbo_ID_Family     FOREIGN KEY (ID_Family) REFERENCES dbo.Family(FamilyID)
	,Quantity      INT                  NOT NULL
	,Value         INT                  NOT NULL
	,PurchaseDate  DATETIME			    NOT NULL DEFAULT SYSDATETIME()
	,DiscountValue INT                  NULL
	,CONSTRAINT    CHK_dbo_Quantity     CHECK(Quantity >= 0)
	,CONSTRAINT    CHK_dbo_Value        CHECK(Value >= 0)
 );