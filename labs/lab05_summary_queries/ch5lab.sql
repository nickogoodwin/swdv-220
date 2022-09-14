/*
Nicko Goodwin
9/14/2022
*/

USE AP;

SELECT * from InvoiceLineItems;

/*
1. Write a SELECT statement that returns 2 columns from the InvoiceLineItems table: InvoiceID & Amount Due, 
where Amount Due is the sum of InvoiceLineItemAmount for each InvoiceID.
*/
SELECT InvoiceID, SUM(InvoiceLineItemAmount) AS AmountDue FROM InvoiceLineItems GROUP BY InvoiceID;

/*
2. Write a SELECT statement based on #1, that includes the InvoiceTotal from Invoices. 
Join where the InvoiceIDs are equal.
*/
SELECT InvoiceLineItems.InvoiceID, SUM(InvoiceLineItemAmount) AS AmountDue, InvoiceTotal 
	FROM InvoiceLineItems 
	JOIN Invoices ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID
	GROUP BY InvoiceLineItems.InvoiceID, InvoiceTotal;


/*
3. Write a SELECT statement that displays the AccountDescription for each GLAccount and the number of 
InvoiceLineItems for that GLAccount. Sort by the AccountDescription.
*/
SELECT AccountDescription, COUNT(*) AS LineItemsCount
	FROM InvoiceLineItems 
	JOIN GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
	GROUP BY AccountDescription
	ORDER BY AccountDescription;

/*
4. Write a SELECT statement based on #3, that includes the average line item total for each GLAccount 
showing only 2 decimal places and accounts with 2 or more invoice line items. 
Sort in descending order of the average line item total
*/
SELECT 
	AccountDescription, 
	COUNT(*) AS LineItemsCount, 
	CAST(AVG(InvoiceLineItems.InvoiceLineItemAmount)AS DECIMAL(10,2)) AS AvgTotal
		FROM InvoiceLineItems 
		JOIN GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
		GROUP BY AccountDescription
		HAVING COUNT(*) > 2
		ORDER BY AvgTotal DESC;