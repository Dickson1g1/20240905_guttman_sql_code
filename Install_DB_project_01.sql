/* SQL installation script
  Name: Class Project.                    Date Created: 10/15/2024
                                          Date Modified:
  Purpose: For database class project 1.

*/

SYSTEM CLS;
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';

SELECT USER() AS 'INSTALL USER';


-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20241015;

/* Create the database after checking to make sure it is
  not already there

*/


-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20241015
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS '###############################';


-- Let's enter the database
USE testdb_20241015;


-- Let's create some tables


-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';

DROP TABLE IF EXISTS soldvia;
DROP TABLE IF EXISTS salestransaction;
DROP TABLE IF EXISTS `product`;  -- Use backticks for reserved keywords
DROP TABLE IF EXISTS `vendor`;   -- Use backticks for reserved keywords
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS `customer`; -- Use backticks for reserved keywords
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS region;

CREATE TABLE region(
    regionId           CHAR(1) NOT NULL,  -- Added NOT NULL
    regionname         VARCHAR(25),
    PRIMARY KEY(regionId)
);

CREATE TABLE store(
    storeId            VARCHAR(3) NOT NULL,  -- Added NOT NULL
    storezip           CHAR(15),
    regionId           CHAR(1),
    PRIMARY KEY(storeId),
    FOREIGN KEY(regionId) REFERENCES region(regionId)
);

CREATE TABLE `customer`(
    customerId         CHAR(7) NOT NULL,  -- Added NOT NULL
    customername       VARCHAR(15),
    customerzip        CHAR(5),
    PRIMARY KEY(customerId)
);

CREATE TABLE category(
    categoryId         CHAR(2) NOT NULL,  -- Added NOT NULL
    categoryname       VARCHAR(25),
    PRIMARY KEY(categoryId)
);

CREATE TABLE `vendor`(
    vendorId           CHAR(2) NOT NULL,  -- Added NOT NULL
    vendorname         VARCHAR(25),
    PRIMARY KEY(vendorId)
);

CREATE TABLE salestransaction(
    tId                VARCHAR(8) NOT NULL,  -- Added NOT NULL
    customerId         CHAR(7),
    storeId            VARCHAR(3),
    tdate              DATE,
    PRIMARY KEY(tId),
    FOREIGN KEY(customerId) REFERENCES `customer`(customerId),
    FOREIGN KEY(storeId) REFERENCES store(storeId)
);

CREATE TABLE `product`(
    productId          CHAR(3) NOT NULL,
    productname        VARCHAR(25),
    productprice       DECIMAL(7, 2),
    vendorId           CHAR(2),
    categoryId         CHAR(2),
    PRIMARY KEY(productId),
    FOREIGN KEY(vendorId) REFERENCES `vendor`(vendorId),
    FOREIGN KEY(categoryId) REFERENCES category(categoryId)
);

CREATE TABLE soldvia(
    soldviaId          INT AUTO_INCREMENT,
    productId          CHAR(3),
    tId                VARCHAR(8),
    noofitems          INT,
    PRIMARY KEY(soldviaId),
    FOREIGN KEY(productId) REFERENCES `product`(productId),
    FOREIGN KEY(tId) REFERENCES salestransaction(tId)
);
