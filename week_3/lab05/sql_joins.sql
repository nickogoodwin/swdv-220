USE AP;

--#1
SELECT * FROM Invoices
	JOIN Terms ON Invoices.TermsID = Terms.TermsID;

--#2
SELECT InvoiceNumber, InvoiceDate, TermsDueDays, (InvoiceTotal - PaymentTotal - CreditTotal) AS Balance FROM Invoices
	JOIN Terms ON Invoices.TermsID = Terms.TermsID
	ORDER BY Balance DESC;

--#3	
SELECT GLAccounts.AccountNo, AccountDescription FROM GLAccounts
	LEFT JOIN InvoiceLineItems ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
	WHERE InvoiceLineItems.AccountNo IS NULL
	ORDER BY AccountNo;

--#4
SELECT VendorName, DefaultTermsID, TermsDescription FROM Vendors
	JOIN Terms ON Vendors.DefaultTermsID = Terms.TermsID
	ORDER BY TermsDescription, VendorName;

--#5
SELECT DISTINCT Vendors1.VendorID, Vendors1.VendorName, (Vendors1.VendorContactFName + ' ' +  Vendors1.VendorContactLName) AS 'Name' 
	FROM Vendors AS Vendors1 JOIN Vendors AS Vendors2 
		ON Vendors1.VendorContactFName = Vendors2.VendorContactFName
		WHERE Vendors1.VendorID <> Vendors2.VendorID
		ORDER BY 'Name'
;