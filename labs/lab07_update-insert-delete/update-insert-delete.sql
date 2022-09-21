/*
Nicko Goodwin
9/21/2022
Lab 07 - Updates, Inserts, and Deletes
*/
USE MyGuitarShop;

/*
[#1]
Write an INSERT statement that adds this row to the Categories table:
	-CategoryName: Brass
	-Code the INSERT statement so SQL Server generates the value for the CategoryID column.
*/
INSERT INTO Categories(CategoryName)
VALUES ('Brass'); 

/*
[#2]
Write an UPDATE statement that modifies the row you just added to Categories. Change the CategoryName column to �Woodwinds�, 
and use the CategoryID column to identify the row.
*/
UPDATE Categories
SET CategoryName = 'Woodwinds'
WHERE CategoryID = 5;

/*
[#3]
Write a DELETE statement that deletes the row added to Categories in exercise 1. Use the CategoryID column to identify the row.
*/
DELETE FROM Categories
WHERE CategoryID = 5;

/*
[#4]
Write an INSERT statement that adds this row to the Products table:
	-ProductID: The next automatically generated 
		|ID 
		| CategoryID: 4 
		| ProductCode: dgx_640 
		| ProductName: Yamaha DGX 640 88-Key Digital Piano 
		| Description: Long description to come. 
		| ListPrice 799.99 
		| DiscountPercent: 0 
		| DateAdded: Today�s date/time.
	-Use a column list for this statement.
*/
INSERT INTO Products(CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
VALUES (4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano ', 'Long description to come', 799.99, 0, CURRENT_TIMESTAMP);

/*
[#5]
Write an UPDATE statement that modifies the product added in exercise 4. This statement should change the 
DiscountPercent column from 0% to 35%.
*/
UPDATE PRODUCTS
SET DiscountPercent = 0.35
WHERE ProductCode = 'dgx_640';

/*
[#6]
Write a DELETE statement that deletes the row in Categories that has an ID of 4. 

When you execute this statement, it will produce an error since the category has related rows in the Products table. 
To fix that, precede the DELETE statement with another DELETE statement that deletes all products in this category.
*/
DELETE FROM Products
WHERE CategoryID = 4;

DELETE FROM Categories
WHERE CategoryID = 4;

/*
[#7]
Write an INSERT statement that adds this row to the Customers table:
	-EmailAddress:	rick@raven.com | Password: (empty string) | FirstName: Rick | LastName: Raven
	-Use a column list for this statement.
*/
INSERT INTO Customers(EmailAddress, Password, FirstName, LastName)
VALUES ('rick@raven.com', '', 'Rick', 'Raven');

/*
[#8]
Write an UPDATE statement that modifies Customers. 
	Change the password column to �secret� for the customer with an email address of rick@raven.com.
*/
UPDATE Customers
SET Password = 'secret'
WHERE EmailAddress = 'rick@raven.com';

/*
[#9]
Write an UPDATE statement that modifies Customers. 
	Change the password column to �reset� for every customer in the table.
*/
UPDATE Customers
SET Password = 'reset';