/* SQL installation script
  Name:Class Project 1                     Date Created:
                                           Date Modified:
  Purpose:

*/

SYSTEM CLS;
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';

SELECT USER() AS 'INSTALL USER';


-- Remove the database if it is already there
DROP DATABASE IF EXISTS my_project_db1;

/* Create the database after checking to make sure it is
  not already there

*/


-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS my_project_db1
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';


-- Let's enter the database
USE my_project_db1;


-- Let's create some tables


-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';


DROP TABLE IF EXISTS region;

CREATE TABLE region(
    regionId           CHAR(1) NOT NULL,  -- Added NOT NULL
    regionname         VARCHAR(25),
    PRIMARY KEY(regionId)
);

DROP TABLE IF EXISTS store;

CREATE TABLE store(
    storeId            VARCHAR(3) NOT NULL,  -- Added NOT NULL
    storezip           CHAR(15),
    regionId           CHAR(1),
    PRIMARY KEY(storeId),
    FOREIGN KEY(regionId) REFERENCES region(regionId)
);

DROP TABLE IF EXISTS `customer`; -- Used backticks for reserved keywords

CREATE TABLE `customer`(
    customerId         CHAR(7) NOT NULL,  -- Added NOT NULL
    customername       VARCHAR(15),
    customerzip        CHAR(5),
    PRIMARY KEY(customerId)
);

DROP TABLE IF EXISTS category;

CREATE TABLE category(
    categoryId         CHAR(2) NOT NULL,  -- Added NOT NULL
    categoryname       VARCHAR(25),
    PRIMARY KEY(categoryId)
);


DROP TABLE IF EXISTS `vendor`;   -- Used backticks for reserved keywords

CREATE TABLE `vendor`(
    vendorId           CHAR(2) NOT NULL,  -- Added NOT NULL
    vendorname         VARCHAR(25),
    PRIMARY KEY(vendorId)
);

DROP TABLE IF EXISTS salestransaction;

CREATE TABLE salestransaction(
    tId                VARCHAR(8) NOT NULL,  -- Added NOT NULL
    customerId         CHAR(7),
    storeId            VARCHAR(3),
    tdate              DATE,
    PRIMARY KEY(tId),
    FOREIGN KEY(customerId) REFERENCES `customer`(customerId),
    FOREIGN KEY(storeId) REFERENCES store(storeId)
);

DROP TABLE IF EXISTS `product`;  -- Used backticks for reserved keywords

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

DROP TABLE IF EXISTS soldvia;

CREATE TABLE soldvia(
    soldviaId          INT AUTO_INCREMENT,
    productId          CHAR(3),
    tId                VARCHAR(8),
    noofitems          INT,
    PRIMARY KEY(soldviaId),
    FOREIGN KEY(productId) REFERENCES `product`(productId),
    FOREIGN KEY(tId) REFERENCES salestransaction(tId)
);

show tables; -- to show the tables at the end when it finish runing.
