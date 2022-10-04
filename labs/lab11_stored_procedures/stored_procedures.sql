USE AP;
GO

IF OBJECT_ID('sp_InsertTerms') IS NOT NULL
	DROP PROC sp_InsertTerms;
GO

CREATE PROC sp_InsertTerms
	@description varchar(255) = NULL,
	@dueDays int = NULL
AS
	IF @description IS NULL
		THROW 50001, 'ERROR: Invalid Description', 1;
	IF @dueDays IS NULL
		THROW 50001, 'ERROR: Invalid Due Days', 1;
	BEGIN TRY
		INSERT INTO Terms (TermsDescription, TermsDueDays)
		VALUES (@description, @dueDays)
		PRINT 'SUCCESS: Terms inserted';
	END TRY
	BEGIN CATCH
		THROW 50000, 'ERROR: Please insert valid Terms', 1;
	END CATCH;
GO

EXEC sp_InsertTerms @description = 'Net Due 365 Days', @dueDays=365;
EXEC sp_InsertTerms @description = 'Net Due 365 Days';
