DROP DATABASE IF EXISTS MyWebDB;

CREATE DATABASE MyWebDB;

USE MyWebDB;

CREATE TABLE
    IF NOT EXISTS Users (
        userID INT NOT NULL AUTO_INCREMENT,
        emailAddress VARCHAR(100) NOT NULL,
        firstName VARCHAR(50),
        lastName VARCHAR(50) NOT NULL,
        PRIMARY KEY (userID)
    );

CREATE TABLE
    IF NOT EXISTS Products (
        productID INT NOT NULL AUTO_INCREMENT,
        productName VARCHAR(100) NOT NULL,
        PRIMARY KEY (productID)
    );

CREATE TABLE
    IF NOT EXISTS Downloads (
        downloadID INT NOT NULL AUTO_INCREMENT,
        userID INT NOT NULL,
        downloadDate DATETIME NOT NULL,
        fileName VARCHAR(100) NOT NULL,
        productID INT NOT NULL,
        PRIMARY KEY (downloadID),
        FOREIGN KEY (userID) REFERENCES Users(userID),
        FOREIGN KEY (productID) REFERENCES Products(productID)
    );

CREATE INDEX userID ON Downloads(userID);

CREATE INDEX productID ON Downloads(productID);

ALTER TABLE Products
ADD
    productPrice DECIMAL(5, 2) DEFAULT 9.99,
ADD
    dateAdded DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

--SQL Server - "ALTER" COLUMN

ALTER TABLE Users ALTER COLUMN firstName VARCHAR(20) NOT NULL;

-- MySQL - "MODIFY" COLUMN

-- ALTER TABLE Users MODIFY COLUMN firstName VARCHAR(20) NOT NULL;

/************
 TEST QUERIES
 *************/

/*
 INSERT INTO
 Products(productName, productPrice)
 VALUES ('testProduct', 1110.99);
 */

/*
 ALTER TABLE
 Products DROP COLUMN productPrice,
 DROP COLUMN dateAdded;
 */

-- SELECT firstName from Users;