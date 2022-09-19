USE AP;

/***
1) Write a SELECT statement that returns the same result as the statement below. 
Substitute a subquery in the WHERE clause for the inner join.

SELECT DISTINCT AccountDescription
FROM GLAccounts
join InvoiceLineItems
	on GLAccounts.AccountNo = InvoiceLineItems.AccountNo 
ORDER BY AccountDescription;
***/
SELECT DISTINCT AccountDescription
FROM GLAccounts
WHERE AccountNo IN 
	(SELECT AccountNo 
	FROM InvoiceLineItems 
)
ORDER BY AccountDescription;


/***
2) Write a SELECT statement using a subquery that finds the invoices (InvoiceNumber, InvoiceTotal, BalanceDue) 
that have a Balance due greater than the average InvoiceTotal. 

Sort in descending order by InvoiceTotal.
***/
SELECT InvoiceNumber, InvoiceTotal,  InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 
 (SELECT AVG(InvoiceTotal) AS AvgInvoiceTotal
 FROM Invoices)
ORDER BY InvoiceTotal DESC;

/***
3) Write a SELECT statement using a subquery that shows the TermsID & TermsDescription 
for any TermID not found in the Invoices table. 

Sort by TermsID. 

HINT: You might need to insert an unused term into your Terms table. See notes area for the insert code.
***/
SELECT TermsID, TermsDescription 
FROM Terms
WHERE NOT EXISTS 
	(SELECT * FROM Invoices
	WHERE Invoices.TermsID = Terms.TermsID)
ORDER BY TermsID;
;

/***
4) Write a SELECT statement using the GLAccounts table that returns one row for each account number 
that has never been used in InvoiceLineItems. 

Return the AccountNo & AccountDescription in AccountNo order. 

Write 3 statements that give the same results using: 
a. A correlated subquery introduced with the NOT EXISTS operator
b. A non-correlated subquery
c/ A join
***/

--a - correlated subquery
SELECT GLAccounts.AccountNo, AccountDescription 
FROM GLAccounts 
WHERE NOT EXISTS
	(SELECT InvoiceLineItems.AccountNo FROM InvoiceLineItems
	WHERE InvoiceLineItems.AccountNo = GLAccounts.AccountNo)
ORDER BY AccountNo;

--b - non-correlated subquery
SELECT GLAccounts.AccountNo, AccountDescription 
FROM GLAccounts 
WHERE GLAccounts.AccountNo NOT IN
	(SELECT InvoiceLineItems.AccountNo
	FROM InvoiceLineItems)
ORDER BY AccountNo;

--c - join
SELECT GLAccounts.AccountNo, AccountDescription 
FROM GLAccounts 
	LEFT JOIN InvoiceLineItems
		ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
WHERE InvoiceLineItems.AccountNo IS NULL
ORDER BY AccountNo;