/*
 *    Nicko Goodwin
 *    8/26/2022
 */

USE MyGuitarShop;

--Exercise 1

SELECT
    ProductCode,
    ProductName,
    ListPrice,
    DiscountPercent
FROM Products
ORDER BY ListPrice DESC;

--Exercise 2

SELECT
    LastName + ', ' + FirstName As FullName
FROM Customers
WHERE
    LastName BETWEEN 'M' AND 'Z'
ORDER BY LastName;

--Exercise 3

SELECT
    ProductName AS [The ProductName Column],
    ListPrice AS [The ListPrice Column],
    DateAdded AS [The DateAdded Column]
FROM Products
WHERE
    ListPrice > 500
    AND ListPrice < 2000
ORDER BY DateAdded DESC;

--Exercise 4

SELECT
    ProductName AS [The ProductName Column],
    ListPrice AS [The ListPrice Column],
    DiscountPercent AS [The DiscountPercent],
    ListPrice * (DiscountPercent *.01) AS DiscountAmount,
    ListPrice - (ListPrice * DiscountPercent) As DiscountPrice
FROM Products
ORDER BY DiscountPrice DESC;

--Exercise 5

SELECT
    ItemID AS [The ItemID Column],
    ItemPrice AS [The ItemPrice Column],
    DiscountAmount AS [The DiscountAmount Column],
    Quantity AS [The Quantity Column],
    ItemPrice * Quantity AS PriceTotal,
    DiscountAmount * Quantity AS DiscountTotal, (ItemPrice - DiscountAmount) * Quantity AS ItemTotal
FROM OrderItems
WHERE (ItemPrice - DiscountAmount) * Quantity > 500
ORDER BY ItemTotal DESC;

--Exercise 6

SELECT
    OrderID AS [The OrderID Column],
    OrderDate AS [The OrderDate Column],
    ShipDate As [The ShipDate Column]
FROM Orders
WHERE ShipDate IS NULL;