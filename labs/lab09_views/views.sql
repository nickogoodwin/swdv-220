USE AP;

/*
Write the statement(s) to create a view Top3Invoices that lists the top 3 
VendorID and Invoice Totals when the invoice total (less the credit & payment) 
is more than zero. 

The output should be sorted in descending order by Invoice total. 

See starter code in notes area
*/
DROP VIEW Top3Invoices;

CREATE VIEW Top3Invoices AS
	SELECT TOP 3 VendorId, (InvoiceTotal - CreditTotal - PaymentTotal) AS InvoiceAmount
	FROM Invoices
	ORDER BY InvoiceAmount DESC;

SELECT * FROM Top3Invoices;

/*
Write the statement(s) to create a view OverDueInvoices that lists InvoiceID, 
InvoiceDate, and InvoiceTotal for invoices that have no payment date and the 
due date is past due. The output should be sorted in descending order by 
Invoice total. 

See starter code in notes area.
*/
DROP VIEW OverDueInvoices;

CREATE VIEW OverDueInvoices AS
	SELECT InvoiceID, InvoiceDate, InvoiceTotal
	FROM Invoices
	WHERE PaymentDate IS NULL AND
	InvoiceDate < GetDate();

SELECT * FROM OverDueInvoices;
	

/*
Work with an updatable view; see starter code in notes area.
-Write the statement(s) to create an updatable view named ChangeTerms to 
returns all columns of the Terms table. 
-Write a select query to show the results from ChangeTerms.
-Write an insert statement for Net due 220 days as 220 days.
-Write an update statement to change both references to 240 days instead of 
220 days.
*/
CREATE VIEW ChangeTerms AS
	SELECT * FROM Terms;

SELECT * FROM ChangeTerms;

Insert INTO ChangeTerms (TermsDescription, TermsDueDays)
Values ('Net due 220 days', 220);

UPDATE ChangeTerms
SET TermsDescription = 'Net due 240 Days', TermsDueDays = 240
Where TermsDueDays = 220;