CREATE OR ALTER FUNCTION funkcja (@nr_zam INT)
RETURNS datetime
	AS
	BEGIN
	DECLARE @data datetime;
	SELECT @data=ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] WHERE @nr_zam=SalesOrderID
RETURN @data

END;



CREATE PROCEDURE Product_information(@name nvarchar(50)) 
	AS
	BEGIN
 	SELECT ProductID,Name,MakeFlag FROM [AdventureWorks2017].[Production].[Product] Product
	WHERE Product.Name = @name

	END;



CREATE OR ALTER FUNCTION nr_card (@order_nr INT)
RETURNS nvarchar(30)
	AS
	BEGIN
	DECLARE @number nvarchar(30);
	SELECT @number=CardNumber FROM [AdventureWorks2017].[Sales].[CreditCard] credit INNER JOIN [AdventureWorks2017].[Sales].[SalesOrderHeader] sale ON credit.CreditCardID=soh.CreditCardID
	WHERE @order_nr=sale.SalesOrderID
RETURN @number

END;




CREATE PROCEDURE dividing (@nr1 float, @nr2 float)
	AS
	BEGIN
	IF (@nr1 > @nr2)
		BEGIN
		DECLARE @result float
		SET @result = @nr1 / @nr2
		RETURN @result

		END;
	ELSE
		BEGIN
		DECLARE @error varchar(50)
		SET @error ='Niewlasciwie zdefiniowales dane wejsciowe'
		RETURN @error
		END;

	END;
