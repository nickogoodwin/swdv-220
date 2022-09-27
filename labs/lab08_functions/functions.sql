/*
Lab 08 - SQL Functions
Nicko Goodwin
9/27/2022
*/
USE AP;

/*
Write a select statement that returns information from Vendors whose 
zip code starts with 9. Use a function in your WHERE clause. 

Sort by the area code. Show only rows that have an area code.

Column 1 "Name" is the contact's name using the first name initial followed 
by a period, a space, and then last name. 

Column 2 "Area Code" is the contacts 3 digit area code only. 

Column 3 "Zip Code" is the Vendor's zip code.

Edit Vendor table & change contact first & last names for 
VendorID 29 & 92 to NULL.

Test & debug as needed.

If both first & last names are null, Name should show 'NO CONTACT NAME'.
*/

--Update vendor names to NULL values
UPDATE Vendors
SET VendorContactFName = NULL, VendorContactLName = NULL
WHERE VendorID = 29 OR VendorID = 92;


SELECT 
	IIF(VendorContactFName IS NULL AND VendorContactLName IS NULL, 'NO CONTACT NAME', CONCAT(LEFT(VendorContactFName,1), '. ', VendorContactLName))  AS 'Name', 
	LEFT(VendorPhone, 5) AS 'Area Code',
	VendorZipCode AS 'Zip Code'
FROM Vendors
WHERE LEFT(VendorZipCode, 1) = 9 AND LEFT(VendorPhone, 5) IS NOT NULL
ORDER BY LEFT(VendorPhone, 5);


/*
Write the SQL to show VendorID, VendorName and Address line 1. 

If the Address line 1 has nothing in it, print out 'NO ADDRESS ON FILE'. 

Show the vendors with no Address line 1 at the top of the report. 

Split VendorName into first name & last name after the first space 
in VendorName.
*/
SELECT 
	VendorID,
	SUBSTRING(VendorName, 1, CHARINDEX(' ', VendorName)) as FirstName,
	SUBSTRING(VendorName, CHARINDEX(' ', VendorName)+1, LEN(VendorName)) as LastName,
	ISNULL(VendorAddress1, 'NO ADDRESS ON FILE') as 'Address'
FROM Vendors
ORDER BY CASE
	WHEN VendorAddress1 IS NULL THEN 1 ELSE 2 end;

/*
Write a select statement that returns the day of the week 
(Sunday, Monday, etc.) for your birth date.
*/
SELECT 
	'1992-12-09' AS 'Birthday', 
	DATENAME(weekday, '1992-12-09') as 'DayOfWeek';