USE MyGuitarShop;

DECLARE @category varchar(255);
--SET @category = 'Guitars';
SET @category = 'Flutes';

BEGIN TRY
	INSERT INTO Categories
	VALUES (@category)
	PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
	THROW 50000, 'Error 2627: Violation of UNIQUE KEY constraint', 1;
END CATCH