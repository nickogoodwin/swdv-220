/*
Nicko Goodwin
9/16/2022
*/

DROP DATABASE disk_inventoryNG;

CREATE DATABASE disk_inventoryNG;

USE disk_inventoryNG;
GO;

CREATE TABLE
     genres (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        PRIMARY KEY(id)
    );
GO;

CREATE TABLE
     artists (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        PRIMARY KEY(id)
    );
	GO;

CREATE TABLE
     borrow_statuses (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        PRIMARY KEY(id)
    );
	GO;

CREATE TABLE
     borrowers (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        phone VARCHAR(255),
        PRIMARY KEY(id)
    );
	GO;

CREATE TABLE
     disks (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        releaseDate DATETIME NOT NULL,
        genreID INT NOT NULL,
        artistID INT NOT NULL,
        statusID INT NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY (genreID) REFERENCES genres(id),
        FOREIGN KEY (artistID) REFERENCES artists(id),
        FOREIGN KEY (statusID) REFERENCES borrow_statuses(id)
    );
	GO;

CREATE TABLE
     barrowed_disks (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        borrowedDate DATETIME NOT NULL,
        returnedDate DATETIME,
        diskID INT NOT NULL,
        borrowerID INT NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY (diskID) REFERENCES disks(id),
        FOREIGN KEY (borrowerID) REFERENCES borrowers(id)
    );
	GO;

CREATE LOGIN diskUserNG WITH PASSWORD = 'p@55w0rd';

DROP USER IF EXISTS diskUserNG;
CREATE USER diskUserNG FOR LOGIN diskUserNG;

GRANT SELECT TO diskUserNG;
GO;