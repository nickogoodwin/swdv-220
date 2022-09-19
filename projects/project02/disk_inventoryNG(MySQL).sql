-- Active: 1661148601560@@127.0.0.1@3306@disk_inventoryng

DROP DATABASE disk_inventoryNG;

CREATE DATABASE disk_inventoryNG DEFAULT CHARACTER SET "utf8mb4";

USE disk_inventoryNG;

CREATE TABLE
    genres(
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS artists (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS borrow_statuses (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS borrowers (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        phone VARCHAR(255),
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS disks (
        id INT NOT NULL AUTO_INCREMENT,
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

CREATE TABLE
    IF NOT EXISTS barrowed_disks (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        borrowedDate DATETIME NOT NULL,
        returnedDate DATETIME,
        diskID INT NOT NULL,
        borrowerID INT NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY (diskID) REFERENCES disks(id),
        FOREIGN KEY (borrowerID) REFERENCES borrowers(id)
    );

CREATE LOGIN diskUserNG WITH PASSWORD = 'p@55w0rd';

DROP USER IF EXISTS diskUserNG;

CREATE USER diskUserNG FOR LOGIN diskUserNG;

GRANT SELECT TO diskUserNG;