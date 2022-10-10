/*
--From NOTES section of slides

SELECT Vendors.VendorID, VendorName, COUNT(*) as NumOfInvoices
FROM Vendors
JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
WHERE 
	VendorName = 'United Parcel Service' OR
	VendorName = 'Federal Express Corporation' OR
	VendorName = 'FedUp'
group by Vendors.VendorID, VendorName;
GO
*/

/*
BEGIN LAB
*/

DECLARE @DeleteVendorID int, @NewVendorID int;

SELECT @DeleteVendorID = VendorID 
FROM Vendors
	WHERE VendorName = 'United Parcel Service';

SELECT @NewVendorID = VendorID
FROM Vendors
	WHERE VendorName = 'Federal Express Corporation';


BEGIN TRAN;

UPDATE Invoices
	SET VendorID = @NewVendorID
	WHERE VendorID = @DeleteVendorID;

DELETE FROM Vendors
	WHERE VendorID = @DeleteVendorID;

IF @@ROWCOUNT < 1
	BEGIN
		ROLLBACK TRAN;
		PRINT 'ERROR: Vendor does not exist, deletions rolled back.';
	END;
ELSE
	BEGIN
		UPDATE Vendors
			SET VendorName = 'FedUp'
			WHERE VendorId = @NewVendorID;
		COMMIT TRAN;
		PRINT 'Transaction Succeeded'
	END;	